// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_modifier_group_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateModifierGroupState {
  ModifierGroupModel get group => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) initial,
    required TResult Function(ModifierGroupModel group) creating,
    required TResult Function(ModifierGroupModel group) created,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
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
  $CreateModifierGroupStateCopyWith<CreateModifierGroupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateModifierGroupStateCopyWith<$Res> {
  factory $CreateModifierGroupStateCopyWith(CreateModifierGroupState value,
          $Res Function(CreateModifierGroupState) then) =
      _$CreateModifierGroupStateCopyWithImpl<$Res>;
  $Res call({ModifierGroupModel group});

  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class _$CreateModifierGroupStateCopyWithImpl<$Res>
    implements $CreateModifierGroupStateCopyWith<$Res> {
  _$CreateModifierGroupStateCopyWithImpl(this._value, this._then);

  final CreateModifierGroupState _value;
  // ignore: unused_field
  final $Res Function(CreateModifierGroupState) _then;

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
abstract class _$$_InitialCopyWith<$Res>
    implements $CreateModifierGroupStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CreateModifierGroupStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Initial(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'CreateModifierGroupState.initial(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) initial,
    required TResult Function(ModifierGroupModel group) creating,
    required TResult Function(ModifierGroupModel group) created,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return initial(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return initial?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(group);
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

abstract class _Initial implements CreateModifierGroupState {
  const factory _Initial({required final ModifierGroupModel group}) =
      _$_Initial;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatingCopyWith<$Res>
    implements $CreateModifierGroupStateCopyWith<$Res> {
  factory _$$_CreatingCopyWith(
          _$_Creating value, $Res Function(_$_Creating) then) =
      __$$_CreatingCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_CreatingCopyWithImpl<$Res>
    extends _$CreateModifierGroupStateCopyWithImpl<$Res>
    implements _$$_CreatingCopyWith<$Res> {
  __$$_CreatingCopyWithImpl(
      _$_Creating _value, $Res Function(_$_Creating) _then)
      : super(_value, (v) => _then(v as _$_Creating));

  @override
  _$_Creating get _value => super._value as _$_Creating;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Creating(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Creating implements _Creating {
  const _$_Creating({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'CreateModifierGroupState.creating(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Creating &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_CreatingCopyWith<_$_Creating> get copyWith =>
      __$$_CreatingCopyWithImpl<_$_Creating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) initial,
    required TResult Function(ModifierGroupModel group) creating,
    required TResult Function(ModifierGroupModel group) created,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return creating(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return creating?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(group);
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

abstract class _Creating implements CreateModifierGroupState {
  const factory _Creating({required final ModifierGroupModel group}) =
      _$_Creating;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_CreatingCopyWith<_$_Creating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CreatedCopyWith<$Res>
    implements $CreateModifierGroupStateCopyWith<$Res> {
  factory _$$_CreatedCopyWith(
          _$_Created value, $Res Function(_$_Created) then) =
      __$$_CreatedCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_CreatedCopyWithImpl<$Res>
    extends _$CreateModifierGroupStateCopyWithImpl<$Res>
    implements _$$_CreatedCopyWith<$Res> {
  __$$_CreatedCopyWithImpl(_$_Created _value, $Res Function(_$_Created) _then)
      : super(_value, (v) => _then(v as _$_Created));

  @override
  _$_Created get _value => super._value as _$_Created;

  @override
  $Res call({
    Object? group = freezed,
  }) {
    return _then(_$_Created(
      group: group == freezed
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ModifierGroupModel,
    ));
  }
}

/// @nodoc

class _$_Created implements _Created {
  const _$_Created({required this.group});

  @override
  final ModifierGroupModel group;

  @override
  String toString() {
    return 'CreateModifierGroupState.created(group: $group)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Created &&
            const DeepCollectionEquality().equals(other.group, group));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(group));

  @JsonKey(ignore: true)
  @override
  _$$_CreatedCopyWith<_$_Created> get copyWith =>
      __$$_CreatedCopyWithImpl<_$_Created>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ModifierGroupModel group) initial,
    required TResult Function(ModifierGroupModel group) creating,
    required TResult Function(ModifierGroupModel group) created,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return created(group);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return created?.call(group);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(group);
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

abstract class _Created implements CreateModifierGroupState {
  const factory _Created({required final ModifierGroupModel group}) =
      _$_Created;

  @override
  ModifierGroupModel get group;
  @override
  @JsonKey(ignore: true)
  _$$_CreatedCopyWith<_$_Created> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $CreateModifierGroupStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({ModifierGroupModel group, Exception exception});

  @override
  $ModifierGroupModelCopyWith<$Res> get group;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$CreateModifierGroupStateCopyWithImpl<$Res>
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
    return 'CreateModifierGroupState.error(group: $group, exception: $exception)';
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
    required TResult Function(ModifierGroupModel group) initial,
    required TResult Function(ModifierGroupModel group) creating,
    required TResult Function(ModifierGroupModel group) created,
    required TResult Function(ModifierGroupModel group, Exception exception)
        error,
  }) {
    return error(group, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
    TResult Function(ModifierGroupModel group, Exception exception)? error,
  }) {
    return error?.call(group, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ModifierGroupModel group)? initial,
    TResult Function(ModifierGroupModel group)? creating,
    TResult Function(ModifierGroupModel group)? created,
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

abstract class _Error implements CreateModifierGroupState {
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
