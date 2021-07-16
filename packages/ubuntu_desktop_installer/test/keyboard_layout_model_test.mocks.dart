// Mocks generated by Mockito 5.0.10 from annotations
// in ubuntu_desktop_installer/test/keyboard_layout_model_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;
import 'dart:io' as _i2;
import 'dart:ui' as _i7;

import 'package:http/src/streamed_response.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/src/types.dart' as _i3;
import 'package:subiquity_client/subiquity_client.dart' as _i6;
import 'package:ubuntu_desktop_installer/keyboard_model.dart' as _i4;
import 'package:ubuntu_desktop_installer/pages/keyboard_layout/keyboard_layout_model.dart'
    as _i8;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: comment_references
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeProcessResult extends _i1.Fake implements _i2.ProcessResult {}

class _FakeKeyboardSetup extends _i1.Fake implements _i3.KeyboardSetup {}

class _FakeIdentityData extends _i1.Fake implements _i3.IdentityData {}

class _FakeTimezoneData extends _i1.Fake implements _i3.TimezoneData {}

class _FakeSSHData extends _i1.Fake implements _i3.SSHData {}

class _FakeApplicationStatus extends _i1.Fake implements _i3.ApplicationStatus {
}

class _FakeGuidedStorageResponse extends _i1.Fake
    implements _i3.GuidedStorageResponse {}

class _FakeStorageResponse extends _i1.Fake implements _i3.StorageResponse {}

/// A class which mocks [KeyboardModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockKeyboardModel extends _i1.Mock implements _i4.KeyboardModel {
  MockKeyboardModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.KeyboardLayout> get layouts =>
      (super.noSuchMethod(Invocation.getter(#layouts),
          returnValue: <_i3.KeyboardLayout>[]) as List<_i3.KeyboardLayout>);
  @override
  set layouts(List<_i3.KeyboardLayout>? _layouts) =>
      super.noSuchMethod(Invocation.setter(#layouts, _layouts),
          returnValueForMissingStub: null);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i5.Future<void> load(_i6.SubiquityClient? client) =>
      (super.noSuchMethod(Invocation.method(#load, [client]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  void addListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i7.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [ProcessRunner].
///
/// See the documentation for Mockito's code generation for more information.
class MockProcessRunner extends _i1.Mock implements _i8.ProcessRunner {
  MockProcessRunner() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.ProcessResult> run(
          String? executable, List<String>? arguments) =>
      (super.noSuchMethod(Invocation.method(#run, [executable, arguments]),
              returnValue:
                  Future<_i2.ProcessResult>.value(_FakeProcessResult()))
          as _i5.Future<_i2.ProcessResult>);
}

/// A class which mocks [SubiquityClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockSubiquityClient extends _i1.Mock implements _i6.SubiquityClient {
  MockSubiquityClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void open(String? socketPath) =>
      super.noSuchMethod(Invocation.method(#open, [socketPath]),
          returnValueForMissingStub: null);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i5.Future<void> checkStatus(
          String? method, _i9.StreamedResponse? response) =>
      (super.noSuchMethod(Invocation.method(#checkStatus, [method, response]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> locale() =>
      (super.noSuchMethod(Invocation.method(#locale, []),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<void> setLocale(String? code) =>
      (super.noSuchMethod(Invocation.method(#setLocale, [code]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.KeyboardSetup> keyboard() => (super.noSuchMethod(
          Invocation.method(#keyboard, []),
          returnValue: Future<_i3.KeyboardSetup>.value(_FakeKeyboardSetup()))
      as _i5.Future<_i3.KeyboardSetup>);
  @override
  _i5.Future<void> setKeyboard(_i3.KeyboardSetting? setting) =>
      (super.noSuchMethod(Invocation.method(#setKeyboard, [setting]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> proxy() =>
      (super.noSuchMethod(Invocation.method(#proxy, []),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<void> setProxy(String? proxy) =>
      (super.noSuchMethod(Invocation.method(#setProxy, [proxy]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<String> mirror() =>
      (super.noSuchMethod(Invocation.method(#mirror, []),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
  @override
  _i5.Future<void> setMirror(String? mirror) =>
      (super.noSuchMethod(Invocation.method(#setMirror, [mirror]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.IdentityData> identity() =>
      (super.noSuchMethod(Invocation.method(#identity, []),
              returnValue: Future<_i3.IdentityData>.value(_FakeIdentityData()))
          as _i5.Future<_i3.IdentityData>);
  @override
  _i5.Future<void> setIdentity(_i3.IdentityData? identity) =>
      (super.noSuchMethod(Invocation.method(#setIdentity, [identity]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.TimezoneData> timezone() =>
      (super.noSuchMethod(Invocation.method(#timezone, []),
              returnValue: Future<_i3.TimezoneData>.value(_FakeTimezoneData()))
          as _i5.Future<_i3.TimezoneData>);
  @override
  _i5.Future<void> setTimezone(String? timezone) =>
      (super.noSuchMethod(Invocation.method(#setTimezone, [timezone]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.SSHData> ssh() =>
      (super.noSuchMethod(Invocation.method(#ssh, []),
              returnValue: Future<_i3.SSHData>.value(_FakeSSHData()))
          as _i5.Future<_i3.SSHData>);
  @override
  _i5.Future<void> setSsh(_i3.SSHData? ssh) =>
      (super.noSuchMethod(Invocation.method(#setSsh, [ssh]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.ApplicationStatus> status({_i3.ApplicationState? current}) =>
      (super.noSuchMethod(Invocation.method(#status, [], {#current: current}),
              returnValue:
                  Future<_i3.ApplicationStatus>.value(_FakeApplicationStatus()))
          as _i5.Future<_i3.ApplicationStatus>);
  @override
  _i5.Future<void> markConfigured(List<String>? endpointNames) =>
      (super.noSuchMethod(Invocation.method(#markConfigured, [endpointNames]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> confirm(String? tty) =>
      (super.noSuchMethod(Invocation.method(#confirm, [tty]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<_i3.GuidedStorageResponse> getGuidedStorage(
          int? minSize, bool? wait) =>
      (super.noSuchMethod(Invocation.method(#getGuidedStorage, [minSize, wait]),
              returnValue: Future<_i3.GuidedStorageResponse>.value(
                  _FakeGuidedStorageResponse()))
          as _i5.Future<_i3.GuidedStorageResponse>);
  @override
  _i5.Future<_i3.StorageResponse> setGuidedStorage(_i3.GuidedChoice? choice) =>
      (super.noSuchMethod(Invocation.method(#setGuidedStorage, [choice]),
              returnValue:
                  Future<_i3.StorageResponse>.value(_FakeStorageResponse()))
          as _i5.Future<_i3.StorageResponse>);
  @override
  _i5.Future<void> setStorage(List<dynamic>? config) =>
      (super.noSuchMethod(Invocation.method(#setStorage, [config]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
}