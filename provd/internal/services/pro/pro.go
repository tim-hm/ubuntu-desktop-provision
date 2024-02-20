// Package pro implements the Pro gRPC service.
package pro

import (
	"context"
	"encoding/json"
	"fmt"
	"os/exec"

	pb "github.com/canonical/ubuntu-desktop-provision/provd/protos"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/emptypb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

// Option is a functional option to set the DBus objects in tests.
type Option func(*Service) error

// Service is the implementation of the Pro service.
type Service struct {
	pb.UnimplementedProServiceServer
}

// New returns a new instance of the Pro service.
func New(opts ...Option) (*Service, error) {
	s := &Service{}

	// Applying options, checking for errors in obtaining DBus objects
	for _, opt := range opts {
		if err := opt(s); err != nil {
			return nil, err
		}
	}

	return s, nil
}

type proAPIResponse struct {
	Result string `json:"result"`
	Data   struct {
		Attributes struct {
			Expires       string  `json:"expires,omitempty"`
			ExpiresIn     int     `json:"expires_in,omitempty"`
			Token         string  `json:"token,omitempty"`
			UserCode      string  `json:"user_code,omitempty"`
			ContractID    *string `json:"contract_id,omitempty"`
			ContractToken *string `json:"contract_token,omitempty"`
		} `json:"attributes"`
	} `json:"data"`
	Errors   proAPIErrors  `json:"errors"`
	Version  string        `json:"version"`
	Warnings []interface{} `json:"warnings"`
}

type proAPIError struct {
	Code string `json:"code"`
}

type proAPIErrors []proAPIError

func (e proAPIErrors) ContainsCode(code string) bool {
	for _, err := range e {
		if err.Code == code {
			return true
		}
	}
	return false
}

// ProMagicAttach streams a user code and waits on a contract token from the pro server to preform a magic attach.
func (s *Service) ProMagicAttach(req *emptypb.Empty, stream pb.ProService_ProMagicAttachServer) error {
	// Validate request
	if req == nil {
		return status.Errorf(codes.InvalidArgument, "request is nil")
	}

	// Initiate magic attach process
	response, exeErr := s.initiateMagicAttach(stream.Context())

	if exeErr != nil {
		// Check if it was a connectivity error
		if response.Errors.ContainsCode("connectivity-error") {
			resp := &pb.ProMagicAttachResponse{
				Type: pb.MagicAttachResponseType_NETWORK_ERROR,
			}
			if err := stream.Send(resp); err != nil {
				return status.Errorf(codes.Internal, fmt.Sprintf("failed to send connectivity error response: %v", err))
			}
			return nil
		}

		// If not a connectivity error, return unknown error
		resp := &pb.ProMagicAttachResponse{
			Type: pb.MagicAttachResponseType_UNKNOWN_ERROR,
		}
		if err := stream.Send(resp); err != nil {
			return status.Errorf(codes.Internal, fmt.Sprintf("failed to send unknown error response: %v", err))
		}
		return nil
	}
	// Return the user code
	userCodeResponse := &pb.ProMagicAttachResponse{
		Type:     pb.MagicAttachResponseType_USER_CODE,
		UserCode: &response.Data.Attributes.UserCode,
	}
	if err := stream.Send(userCodeResponse); err != nil {
		return status.Errorf(codes.Internal, fmt.Sprintf("failed to send user code response: %v", err))
	}

	var contractToken *string
	// Wait process may reset if token expires and a new one is generated
	for {
		// Wait for magic attach process to complete
		exe, args := proExecutable("api", "u.pro.attach.magic.wait.v1", "--args", fmt.Sprintf("magic_token=%s", response.Data.Attributes.Token))
		//nolint:gosec // TODO: Double check in a review
		out, exeErr := exec.CommandContext(stream.Context(), exe, args...).Output()
		if err := json.Unmarshal(out, &response); err != nil {
			return status.Errorf(codes.Internal, fmt.Sprintf("failed to parse wait response: %v", err))
		}

		if response.Result == "success" {
			contractToken = response.Data.Attributes.ContractToken
			break
		}

		if exeErr != nil {
			// Check if the code has expired
			if response.Errors.ContainsCode("magic-attach-token-error") {
				// Initiate magic attach process
				response, err := s.initiateMagicAttach(stream.Context())

				if err != nil {
					// Check if it was a connectivity error
					if response.Errors.ContainsCode("connectivity-error") {
						resp := &pb.ProMagicAttachResponse{
							Type: pb.MagicAttachResponseType_NETWORK_ERROR,
						}
						if err := stream.Send(resp); err != nil {
							return status.Errorf(codes.Internal, fmt.Sprintf("failed to send connectivity error response: %v", err))
						}
						return nil
					}

					// If not a connectivity error, return unknown error
					resp := &pb.ProMagicAttachResponse{
						Type: pb.MagicAttachResponseType_UNKNOWN_ERROR,
					}
					if err := stream.Send(resp); err != nil {
						return status.Errorf(codes.Internal, fmt.Sprintf("failed to send unknown error response: %v", err))
					}
					return nil
				}
				// Return the user code
				userCodeRefreshResponse := &pb.ProMagicAttachResponse{
					Type:     pb.MagicAttachResponseType_REFRESHED_USER_CODE,
					UserCode: &response.Data.Attributes.UserCode,
				}
				if err := stream.Send(userCodeRefreshResponse); err != nil {
					return status.Errorf(codes.Internal, fmt.Sprintf("failed to send user code response: %v", err))
				}
				continue
			}
			// Check if it was a connectivity error
			if response.Errors.ContainsCode("connectivity-error") {
				resp := &pb.ProMagicAttachResponse{
					Type: pb.MagicAttachResponseType_NETWORK_ERROR,
				}
				if err := stream.Send(resp); err != nil {
					return status.Errorf(codes.Internal, fmt.Sprintf("failed to send connectivity error response: %v", err))
				}
				return nil
			}

			// If not a connectivity error, return unknown error
			resp := &pb.ProMagicAttachResponse{
				Type: pb.MagicAttachResponseType_UNKNOWN_ERROR,
			}
			if err := stream.Send(resp); err != nil {
				return status.Errorf(codes.Internal, fmt.Sprintf("failed to send unknown error response: %v", err))
			}
			return nil
		}
	}

	// Get the contract token
	if contractToken == nil {
		return status.Errorf(codes.Internal, "contract token not found in response")
	}

	// Pro attach the token
	if err := runProAttach(stream.Context(), *contractToken); err != nil {
		resp := &pb.ProMagicAttachResponse{
			Type: pb.MagicAttachResponseType_UNKNOWN_ERROR,
		}
		if err := stream.Send(resp); err != nil {
			return status.Errorf(codes.Internal, fmt.Sprintf("failed to send unknown error response: %v", err))
		}
		return nil
	}

	// Send the final success response
	successResponse := &pb.ProMagicAttachResponse{
		Type: pb.MagicAttachResponseType_SUCCESS,
	}
	if err := stream.Send(successResponse); err != nil {
		return status.Errorf(codes.Internal, fmt.Sprintf("failed to send final success response: %v", err))
	}

	// Close the stream
	return nil
}

func (s *Service) initiateMagicAttach(ctx context.Context) (*proAPIResponse, error) {
	// Initiate magic attach process
	exe, args := proExecutable("api", "u.pro.attach.magic.initiate.v1")
	//nolint:gosec // TODO: Double check in a review
	out, err := exec.CommandContext(ctx, exe, args...).Output()
	if err != nil {
		return nil, fmt.Errorf("failed to initiate magic attach: %v\nOutput: %s", err, string(out))
	}

	// Parse the response
	var response proAPIResponse
	if err := json.Unmarshal(out, &response); err != nil {
		return nil, fmt.Errorf("failed to parse response: %v", err)
	}

	return &response, nil
}

// proExecutable returns the full command to run the pro executable with the provided arguments.
func proExecutable(args ...string) (string, []string) {
	return "pro", args
}

// ProAttach attaches a contract token to the system.
func (s *Service) ProAttach(ctx context.Context, req *wrapperspb.StringValue) (*emptypb.Empty, error) {
	// Validate request
	if req == nil || req.Value == "" {
		return nil, status.Errorf(codes.InvalidArgument, "contract token is required")
	}

	// Pro attach the token
	if err := runProAttach(ctx, req.Value); err != nil {
		return nil, status.Errorf(codes.Internal, fmt.Sprintf("failed to pro attach: %v", err))
	}

	// Return an empty response on success
	return &emptypb.Empty{}, nil
}

func runProAttach(ctx context.Context, contractToken string) error {
	// Construct the full path to the pro-attach executable
	proAttachPath := "/home/matt/dev/go/pro-attach/pro-attach"

	// Run the pro attach command with the contract token
	out, err := exec.CommandContext(ctx, proAttachPath, contractToken).Output()
	if err != nil {
		return fmt.Errorf("failed to run pro attach: %v\nOutput: %s", err, string(out))
	}

	// Process the output if needed
	// For example, you might want to check for success or parse the output

	return nil
}
