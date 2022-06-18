// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_tag_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditTagState {
  TagModel get tag => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TagModel tag) loading,
    required TResult Function(TagModel tag) loaded,
    required TResult Function(TagModel tag) updating,
    required TResult Function(TagModel tag) success,
    required TResult Function(TagModel tag, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
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
  $EditTagStateCopyWith<EditTagState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTagStateCopyWith<$Res> {
  factory $EditTagStateCopyWith(
          EditTagState value, $Res Function(EditTagState) then) =
      _$EditTagStateCopyWithImpl<$Res>;
  $Res call({TagModel tag});

  $TagModelCopyWith<$Res> get tag;
}

/// @nodoc
class _$EditTagStateCopyWithImpl<$Res> implements $EditTagStateCopyWith<$Res> {
  _$EditTagStateCopyWithImpl(this._value, this._then);

  final EditTagState _value;
  // ignore: unused_field
  final $Res Function(EditTagState) _then;

  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(_value.copyWith(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagModel,
    ));
  }

  @override
  $TagModelCopyWith<$Res> get tag {
    return $TagModelCopyWith<$Res>(_value.tag, (value) {
      return _then(_value.copyWith(tag: value));
    });
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $EditTagStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({TagModel tag});

  @override
  $TagModelCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$EditTagStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(_$_Loading(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagModel,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({required this.tag});

  @override
  final TagModel tag;

  @override
  String toString() {
    return 'EditTagState.loading(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TagModel tag) loading,
    required TResult Function(TagModel tag) loaded,
    required TResult Function(TagModel tag) updating,
    required TResult Function(TagModel tag) success,
    required TResult Function(TagModel tag, Exception exception) error,
  }) {
    return loading(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
  }) {
    return loading?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(tag);
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

abstract class _Loading implements EditTagState {
  const factory _Loading({required final TagModel tag}) = _$_Loading;

  @override
  TagModel get tag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> implements $EditTagStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  $Res call({TagModel tag});

  @override
  $TagModelCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res> extends _$EditTagStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(_$_Loaded(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagModel,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required this.tag});

  @override
  final TagModel tag;

  @override
  String toString() {
    return 'EditTagState.loaded(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TagModel tag) loading,
    required TResult Function(TagModel tag) loaded,
    required TResult Function(TagModel tag) updating,
    required TResult Function(TagModel tag) success,
    required TResult Function(TagModel tag, Exception exception) error,
  }) {
    return loaded(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
  }) {
    return loaded?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tag);
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

abstract class _Loaded implements EditTagState {
  const factory _Loaded({required final TagModel tag}) = _$_Loaded;

  @override
  TagModel get tag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdatingCopyWith<$Res>
    implements $EditTagStateCopyWith<$Res> {
  factory _$$_UpdatingCopyWith(
          _$_Updating value, $Res Function(_$_Updating) then) =
      __$$_UpdatingCopyWithImpl<$Res>;
  @override
  $Res call({TagModel tag});

  @override
  $TagModelCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_UpdatingCopyWithImpl<$Res> extends _$EditTagStateCopyWithImpl<$Res>
    implements _$$_UpdatingCopyWith<$Res> {
  __$$_UpdatingCopyWithImpl(
      _$_Updating _value, $Res Function(_$_Updating) _then)
      : super(_value, (v) => _then(v as _$_Updating));

  @override
  _$_Updating get _value => super._value as _$_Updating;

  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(_$_Updating(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagModel,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating({required this.tag});

  @override
  final TagModel tag;

  @override
  String toString() {
    return 'EditTagState.updating(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Updating &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      __$$_UpdatingCopyWithImpl<_$_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TagModel tag) loading,
    required TResult Function(TagModel tag) loaded,
    required TResult Function(TagModel tag) updating,
    required TResult Function(TagModel tag) success,
    required TResult Function(TagModel tag, Exception exception) error,
  }) {
    return updating(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
  }) {
    return updating?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(tag);
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

abstract class _Updating implements EditTagState {
  const factory _Updating({required final TagModel tag}) = _$_Updating;

  @override
  TagModel get tag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatingCopyWith<_$_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res>
    implements $EditTagStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  $Res call({TagModel tag});

  @override
  $TagModelCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res> extends _$EditTagStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(_$_Success(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.tag});

  @override
  final TagModel tag;

  @override
  String toString() {
    return 'EditTagState.success(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TagModel tag) loading,
    required TResult Function(TagModel tag) loaded,
    required TResult Function(TagModel tag) updating,
    required TResult Function(TagModel tag) success,
    required TResult Function(TagModel tag, Exception exception) error,
  }) {
    return success(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
  }) {
    return success?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(tag);
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

abstract class _Success implements EditTagState {
  const factory _Success({required final TagModel tag}) = _$_Success;

  @override
  TagModel get tag => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $EditTagStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({TagModel tag, Exception exception});

  @override
  $TagModelCopyWith<$Res> get tag;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$EditTagStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? tag = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
      tag: tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as TagModel,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.tag, required this.exception});

  @override
  final TagModel tag;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'EditTagState.error(tag: $tag, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tag),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TagModel tag) loading,
    required TResult Function(TagModel tag) loaded,
    required TResult Function(TagModel tag) updating,
    required TResult Function(TagModel tag) success,
    required TResult Function(TagModel tag, Exception exception) error,
  }) {
    return error(tag, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
  }) {
    return error?.call(tag, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TagModel tag)? loading,
    TResult Function(TagModel tag)? loaded,
    TResult Function(TagModel tag)? updating,
    TResult Function(TagModel tag)? success,
    TResult Function(TagModel tag, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(tag, exception);
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

abstract class _Error implements EditTagState {
  const factory _Error(
      {required final TagModel tag,
      required final Exception exception}) = _$_Error;

  @override
  TagModel get tag => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
