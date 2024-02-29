// Mocks generated by Mockito 5.4.4 from annotations
// in ubuntu_bootstrap/test/refresh/test_refresh.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:ubuntu_bootstrap/pages/refresh/refresh_model.dart' as _i3;
import 'package:ubuntu_bootstrap/services.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRefreshState_0 extends _i1.SmartFake implements _i2.RefreshState {
  _FakeRefreshState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RefreshModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockRefreshModel extends _i1.Mock implements _i3.RefreshModel {
  MockRefreshModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RefreshState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeRefreshState_0(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.RefreshState);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i4.Future<bool> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);

  @override
  _i4.Future<void> dispose() => (super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<_i2.RefreshState> check() => (super.noSuchMethod(
        Invocation.method(
          #check,
          [],
        ),
        returnValue: _i4.Future<_i2.RefreshState>.value(_FakeRefreshState_0(
          this,
          Invocation.method(
            #check,
            [],
          ),
        )),
      ) as _i4.Future<_i2.RefreshState>);

  @override
  _i4.Future<void> refresh() => (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  _i4.Future<void> quit() => (super.noSuchMethod(
        Invocation.method(
          #quit,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);

  @override
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
