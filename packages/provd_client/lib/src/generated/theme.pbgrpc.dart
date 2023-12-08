//
//  Generated code. Do not modify.
//  source: theme.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'theme.pb.dart' as $6;

export 'theme.pb.dart';

@$pb.GrpcServiceName('theme.ThemeService')
class ThemeServiceClient extends $grpc.Client {
  static final _$setTheme = $grpc.ClientMethod<$6.SetThemeRequest, $6.Empty>(
      '/theme.ThemeService/SetTheme',
      ($6.SetThemeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Empty.fromBuffer(value));
  static final _$getTheme = $grpc.ClientMethod<$6.Empty, $6.GetThemeResponse>(
      '/theme.ThemeService/GetTheme',
      ($6.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetThemeResponse.fromBuffer(value));
  static final _$setAccent = $grpc.ClientMethod<$6.SetAccentRequest, $6.Empty>(
      '/theme.ThemeService/SetAccent',
      ($6.SetAccentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.Empty.fromBuffer(value));
  static final _$getAccent = $grpc.ClientMethod<$6.Empty, $6.GetAccentResponse>(
      '/theme.ThemeService/GetAccent',
      ($6.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetAccentResponse.fromBuffer(value));

  ThemeServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.Empty> setTheme($6.SetThemeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setTheme, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetThemeResponse> getTheme($6.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTheme, request, options: options);
  }

  $grpc.ResponseFuture<$6.Empty> setAccent($6.SetAccentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setAccent, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetAccentResponse> getAccent($6.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccent, request, options: options);
  }
}

@$pb.GrpcServiceName('theme.ThemeService')
abstract class ThemeServiceBase extends $grpc.Service {
  $core.String get $name => 'theme.ThemeService';

  ThemeServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.SetThemeRequest, $6.Empty>(
        'SetTheme',
        setTheme_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.SetThemeRequest.fromBuffer(value),
        ($6.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.Empty, $6.GetThemeResponse>(
        'GetTheme',
        getTheme_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.Empty.fromBuffer(value),
        ($6.GetThemeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.SetAccentRequest, $6.Empty>(
        'SetAccent',
        setAccent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.SetAccentRequest.fromBuffer(value),
        ($6.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.Empty, $6.GetAccentResponse>(
        'GetAccent',
        getAccent_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.Empty.fromBuffer(value),
        ($6.GetAccentResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.Empty> setTheme_Pre($grpc.ServiceCall call, $async.Future<$6.SetThemeRequest> request) async {
    return setTheme(call, await request);
  }

  $async.Future<$6.GetThemeResponse> getTheme_Pre($grpc.ServiceCall call, $async.Future<$6.Empty> request) async {
    return getTheme(call, await request);
  }

  $async.Future<$6.Empty> setAccent_Pre($grpc.ServiceCall call, $async.Future<$6.SetAccentRequest> request) async {
    return setAccent(call, await request);
  }

  $async.Future<$6.GetAccentResponse> getAccent_Pre($grpc.ServiceCall call, $async.Future<$6.Empty> request) async {
    return getAccent(call, await request);
  }

  $async.Future<$6.Empty> setTheme($grpc.ServiceCall call, $6.SetThemeRequest request);
  $async.Future<$6.GetThemeResponse> getTheme($grpc.ServiceCall call, $6.Empty request);
  $async.Future<$6.Empty> setAccent($grpc.ServiceCall call, $6.SetAccentRequest request);
  $async.Future<$6.GetAccentResponse> getAccent($grpc.ServiceCall call, $6.Empty request);
}
