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
    required TResult Function(MenuModel menu) initial,
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
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
abstract class _$$_InitialCopyWith<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Initial(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'EditMenuState.initial(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
    required TResult Function(MenuModel menu) loading,
    required TResult Function(MenuModel menu) loaded,
    required TResult Function(MenuModel menu) updating,
    required TResult Function(MenuModel menu) success,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return initial(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return initial?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? loading,
    TResult Function(MenuModel menu)? loaded,
    TResult Function(MenuModel menu)? updating,
    TResult Function(MenuModel menu)? success,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EditMenuState {
  const factory _Initial({required final MenuModel menu}) = _$_Initial;

  @override
  MenuModel get menu;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Loading(
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
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
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
    TResult Function(MenuModel menu)? initial,
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
    TResult Function(MenuModel menu)? initial,
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
    required TResult Function(_Initial value) initial,
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
    TResult Function(_Initial value)? initial,
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
    TResult Function(_Initial value)? initial,
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
  MenuModel get menu;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Loaded(
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
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
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
    TResult Function(MenuModel menu)? initial,
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
    TResult Function(MenuModel menu)? initial,
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
    required TResult Function(_Initial value) initial,
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
    TResult Function(_Initial value)? initial,
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
    TResult Function(_Initial value)? initial,
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
  MenuModel get menu;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatingCopyWith<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  factory _$$_UpdatingCopyWith(
          _$_Updating value, $Res Function(_$_Updating) then) =
      __$$_UpdatingCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, (v) => _then(v as _$_Updating));

  @override
  _$_Updating get _value => super._value as _$_Updating;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Updating(
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
            other is _$_Updating &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      __$$_UpdatingCopyWithImpl<_$_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
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
    TResult Function(MenuModel menu)? initial,
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
    TResult Function(MenuModel menu)? initial,
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
    required TResult Function(_Initial value) initial,
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
    TResult Function(_Initial value)? initial,
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
    TResult Function(_Initial value)? initial,
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
  MenuModel get menu;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res>
    implements $EditMenuStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Success(
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
            other is _$_Success &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
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
    TResult Function(MenuModel menu)? initial,
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
    TResult Function(MenuModel menu)? initial,
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
    required TResult Function(_Initial value) initial,
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
    TResult Function(_Initial value)? initial,
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
    TResult Function(_Initial value)? initial,
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
  MenuModel get menu;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $EditMenuStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu, Exception exception});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$EditMenuStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? menu = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
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
            other is _$_Error &&
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
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
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
    TResult Function(MenuModel menu)? initial,
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
    TResult Function(MenuModel menu)? initial,
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
    required TResult Function(_Initial value) initial,
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
    TResult Function(_Initial value)? initial,
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
    TResult Function(_Initial value)? initial,
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
  MenuModel get menu;
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
