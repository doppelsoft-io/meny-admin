// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_menu_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateMenuState {
  MenuModel get menu => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
    required TResult Function(MenuModel menu) creating,
    required TResult Function(MenuModel menu) created,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Created value) created,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateMenuStateCopyWith<CreateMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateMenuStateCopyWith<$Res> {
  factory $CreateMenuStateCopyWith(
          CreateMenuState value, $Res Function(CreateMenuState) then) =
      _$CreateMenuStateCopyWithImpl<$Res>;
  $Res call({MenuModel menu});

  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class _$CreateMenuStateCopyWithImpl<$Res>
    implements $CreateMenuStateCopyWith<$Res> {
  _$CreateMenuStateCopyWithImpl(this._value, this._then);

  final CreateMenuState _value;
  // ignore: unused_field
  final $Res Function(CreateMenuState) _then;

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
    implements $CreateMenuStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$CreateMenuStateCopyWithImpl<$Res>
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
    return 'CreateMenuState.initial(menu: $menu)';
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
    required TResult Function(MenuModel menu) creating,
    required TResult Function(MenuModel menu) created,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return initial(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return initial?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
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
    required TResult Function(_Creating value) creating,
    required TResult Function(_Created value) created,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateMenuState {
  const factory _Initial({required final MenuModel menu}) = _$_Initial;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatingCopyWith<$Res>
    implements $CreateMenuStateCopyWith<$Res> {
  factory _$$_CreatingCopyWith(
          _$_Creating value, $Res Function(_$_Creating) then) =
      __$$_CreatingCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_CreatingCopyWithImpl<$Res>
    extends _$CreateMenuStateCopyWithImpl<$Res>
    implements _$$_CreatingCopyWith<$Res> {
  __$$_CreatingCopyWithImpl(
      _$_Creating _value, $Res Function(_$_Creating) _then)
      : super(_value, (v) => _then(v as _$_Creating));

  @override
  _$_Creating get _value => super._value as _$_Creating;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Creating(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Creating implements _Creating {
  const _$_Creating({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'CreateMenuState.creating(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Creating &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_CreatingCopyWith<_$_Creating> get copyWith =>
      __$$_CreatingCopyWithImpl<_$_Creating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
    required TResult Function(MenuModel menu) creating,
    required TResult Function(MenuModel menu) created,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return creating(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return creating?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Created value) created,
    required TResult Function(_Error value) error,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class _Creating implements CreateMenuState {
  const factory _Creating({required final MenuModel menu}) = _$_Creating;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreatingCopyWith<_$_Creating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatedCopyWith<$Res>
    implements $CreateMenuStateCopyWith<$Res> {
  factory _$$_CreatedCopyWith(
          _$_Created value, $Res Function(_$_Created) then) =
      __$$_CreatedCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_CreatedCopyWithImpl<$Res> extends _$CreateMenuStateCopyWithImpl<$Res>
    implements _$$_CreatedCopyWith<$Res> {
  __$$_CreatedCopyWithImpl(_$_Created _value, $Res Function(_$_Created) _then)
      : super(_value, (v) => _then(v as _$_Created));

  @override
  _$_Created get _value => super._value as _$_Created;

  @override
  $Res call({
    Object? menu = freezed,
  }) {
    return _then(_$_Created(
      menu: menu == freezed
          ? _value.menu
          : menu // ignore: cast_nullable_to_non_nullable
              as MenuModel,
    ));
  }
}

/// @nodoc

class _$_Created implements _Created {
  const _$_Created({required this.menu});

  @override
  final MenuModel menu;

  @override
  String toString() {
    return 'CreateMenuState.created(menu: $menu)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Created &&
            const DeepCollectionEquality().equals(other.menu, menu));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(menu));

  @JsonKey(ignore: true)
  @override
  _$$_CreatedCopyWith<_$_Created> get copyWith =>
      __$$_CreatedCopyWithImpl<_$_Created>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MenuModel menu) initial,
    required TResult Function(MenuModel menu) creating,
    required TResult Function(MenuModel menu) created,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return created(menu);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return created?.call(menu);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(menu);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Creating value) creating,
    required TResult Function(_Created value) created,
    required TResult Function(_Error value) error,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class _Created implements CreateMenuState {
  const factory _Created({required final MenuModel menu}) = _$_Created;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CreatedCopyWith<_$_Created> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $CreateMenuStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({MenuModel menu, Exception exception});

  @override
  $MenuModelCopyWith<$Res> get menu;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$CreateMenuStateCopyWithImpl<$Res>
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
    return 'CreateMenuState.error(menu: $menu, exception: $exception)';
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
    required TResult Function(MenuModel menu) creating,
    required TResult Function(MenuModel menu) created,
    required TResult Function(MenuModel menu, Exception exception) error,
  }) {
    return error(menu, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
    TResult Function(MenuModel menu, Exception exception)? error,
  }) {
    return error?.call(menu, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MenuModel menu)? initial,
    TResult Function(MenuModel menu)? creating,
    TResult Function(MenuModel menu)? created,
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
    required TResult Function(_Creating value) creating,
    required TResult Function(_Created value) created,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Creating value)? creating,
    TResult Function(_Created value)? created,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CreateMenuState {
  const factory _Error(
      {required final MenuModel menu,
      required final Exception exception}) = _$_Error;

  @override
  MenuModel get menu => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
