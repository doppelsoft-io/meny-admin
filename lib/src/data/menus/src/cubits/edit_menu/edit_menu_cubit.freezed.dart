// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditMenuState {
  MenuModel get menu => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditMenuStateCopyWith<EditMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditMenuStateCopyWith<$Res> {
  factory $EditMenuStateCopyWith(
          EditMenuState value, $Res Function(EditMenuState) then) =
      _$EditMenuStateCopyWithImpl<$Res>;
  $Res call({MenuModel menu});

  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class _$EditMenuStateCopyWithImpl<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  _$EditMenuStateCopyWithImpl(this._value, this._then);

  final EditMenuState _value;
  // ignore: unused_field
  final $Res Function(EditMenuState) _then;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_value.copyWith(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }

  @override
  $MenuModelCopyWith<$Res> get menu {
    return $MenuModelCopyWith<$Res>(_value.menu, (value) {
      return _then(_value.copyWith(menu: value));
    });
  }
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $EditMenuStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_Loading(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'EditMenuState.loading(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return loading(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return loading?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements EditMenuState {
  const factory _Loading({required final MenuModel menu}) = _$_Loading;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> implements $EditMenuStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_Loaded(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'EditMenuState.loaded(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return loaded(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return loaded?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements EditMenuState {
  const factory _Loaded({required final MenuModel menu}) = _$_Loaded;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdatingCopyWith<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) then) =
      __$UpdatingCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$UpdatingCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(_Updating _value, $Res Function(_Updating) _then)
      : super(_value, (v) => _then(v as _Updating));

  @override
  _Updating get _value => super._value as _Updating;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_Updating(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'EditMenuState.updating(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Updating &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$UpdatingCopyWith<_Updating> get copyWith =>
      __$UpdatingCopyWithImpl<_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return updating(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return updating?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return updating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return updating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(this);
    }
    return orElse();
  }
}

abstract class _Updating implements EditMenuState {
  const factory _Updating({required final MenuModel menu}) = _$_Updating;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdatingCopyWith<_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res> implements $EditMenuStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_Success(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'EditMenuState.success(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return success(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return success?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements EditMenuState {
  const factory _Success({required final MenuModel menu}) = _$_Success;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> implements $EditMenuStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu, Exception exception});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? menu = freezed,
    Object? exception = freezed,
  }) {
    return _then(_Error(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.menu, required this.exception});

  @override
  final MenuModel menu;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'EditMenuState.error(menu: $menu, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.menu, menu) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(menu),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return error(menu, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return error?.call(menu, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(menu, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements EditMenuState {
  const factory _Error(
      {required final MenuModel menu,
      required final Exception exception}) = _$_Error;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
