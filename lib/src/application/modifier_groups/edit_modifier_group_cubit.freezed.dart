// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_modifier_group_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditModifierGroupState {
  ModifierGroupModel get group => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) loading,
    required TResult Function(ModifierGroupModel group) loaded,
    required TResult Function(ModifierGroupModel group) updating,
    required TResult Function(ModifierGroupModel group) success,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
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
  $EditModifierGroupStateCopyWith<EditModifierGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditModifierGroupStateCopyWith<$Res> {
  factory $EditModifierGroupStateCopyWith(EditModifierGroupState value,
          $Res Function(EditModifierGroupState) then) =
      _$EditModifierGroupStateCopyWithImpl<$Res>;
  $Res call({ModifierGroupModel group});

  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class _$EditModifierGroupStateCopyWithImpl<$Res>
    implements $EditModifierGroupStateCopyWith<$Res> {
  _$EditModifierGroupStateCopyWithImpl(this._value, this._then);

  final EditModifierGroupState _value;
  // ignore: unused_field
  final $Res Function(EditModifierGroupState) _then;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_value.copyWith(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }

  @override
  $ModifierGroupModelCopyWith<$Res> get group {
    return $ModifierGroupModelCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $EditModifierGroupStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$EditModifierGroupStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Loading(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'EditModifierGroupState.loading(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) loading,
    required TResult Function(ModifierGroupModel group) loaded,
    required TResult Function(ModifierGroupModel group) updating,
    required TResult Function(ModifierGroupModel group) success,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return loading(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return loading?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(group);
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

abstract class _Loading implements EditModifierGroupState {
  const factory _Loading({required final ModifierGroupModel group}) =
      _$_Loading;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $EditModifierGroupStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$EditModifierGroupStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Loaded(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'EditModifierGroupState.loaded(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) loading,
    required TResult Function(ModifierGroupModel group) loaded,
    required TResult Function(ModifierGroupModel group) updating,
    required TResult Function(ModifierGroupModel group) success,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return loaded(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return loaded?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(group);
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

abstract class _Loaded implements EditModifierGroupState {
  const factory _Loaded({required final ModifierGroupModel group}) = _$_Loaded;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatingCopyWith<$Res>
    implements $EditModifierGroupStateCopyWith<$Res> {
  factory _$$_UpdatingCopyWith(
          _$_Updating value, $Res Function(_$_Updating) then) =
      __$$_UpdatingCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res>
    extends _$EditModifierGroupStateCopyWithImpl<$Res>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, (v) => _then(v as _$_Updating));

  @override
  _$_Updating get _value => super._value as _$_Updating;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Updating(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'EditModifierGroupState.updating(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updating &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      __$$_UpdatingCopyWithImpl<_$_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) loading,
    required TResult Function(ModifierGroupModel group) loaded,
    required TResult Function(ModifierGroupModel group) updating,
    required TResult Function(ModifierGroupModel group) success,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return updating(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return updating?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(group);
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

abstract class _Updating implements EditModifierGroupState {
  const factory _Updating({required final ModifierGroupModel group}) =
      _$_Updating;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res>
    implements $EditModifierGroupStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$EditModifierGroupStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Success(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'EditModifierGroupState.success(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) loading,
    required TResult Function(ModifierGroupModel group) loaded,
    required TResult Function(ModifierGroupModel group) updating,
    required TResult Function(ModifierGroupModel group) success,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return success(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return success?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(group);
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

abstract class _Success implements EditModifierGroupState {
  const factory _Success({required final ModifierGroupModel group}) =
      _$_Success;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $EditModifierGroupStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group, Exception exception});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$EditModifierGroupStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? group = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.group, required this.exception});

  @override
  final ModifierGroupModel group;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'EditModifierGroupState.error(group: $group, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.group, group) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(group),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) loading,
    required TResult Function(ModifierGroupModel group) loaded,
    required TResult Function(ModifierGroupModel group) updating,
    required TResult Function(ModifierGroupModel group) success,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return error(group, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return error?.call(group, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? loading,
    TResult Function(ModifierGroupModel group)? loaded,
    TResult Function(ModifierGroupModel group)? updating,
    TResult Function(ModifierGroupModel group)? success,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(group, exception);
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

abstract class _Error implements EditModifierGroupState {
  const factory _Error(
      {required final ModifierGroupModel group,
      required final Exception exception}) = _$_Error;

  @override
  ModifierGroupModel get group;
  Exception get exception;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
