// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tags_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagsState {
  List<TagModel> get tags => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TagModel> tags) loading,
    required TResult Function(List<TagModel> tags) loaded,
    required TResult Function(List<TagModel> tags, Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagsStateCopyWith<TagsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagsStateCopyWith<$Res> {
  factory $TagsStateCopyWith(TagsState value, $Res Function(TagsState) then) =
      _$TagsStateCopyWithImpl<$Res>;
  $Res call({List<TagModel> tags});
}

/// @nodoc
class _$TagsStateCopyWithImpl<$Res> implements $TagsStateCopyWith<$Res> {
  _$TagsStateCopyWithImpl(this._value, this._then);

  final TagsState _value;
  // ignore: unused_field
  final $Res Function(TagsState) _then;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<TagModel> tags});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_$_Loading(
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading({final List<TagModel> tags = const <TagModel>[]})
      : _tags = tags;

  final List<TagModel> _tags;
  @override
  @JsonKey()
  List<TagModel> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'TagsState.loading(tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TagModel> tags) loading,
    required TResult Function(List<TagModel> tags) loaded,
    required TResult Function(List<TagModel> tags, Exception exception) error,
  }) {
    return loading(tags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
  }) {
    return loading?.call(tags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(tags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TagsState {
  const factory _Loading({final List<TagModel> tags}) = _$_Loading;

  @override
  List<TagModel> get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  $Res call({List<TagModel> tags});
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res> extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, (v) => _then(v as _$_Loaded));

  @override
  _$_Loaded get _value => super._value as _$_Loaded;

  @override
  $Res call({
    Object? tags = freezed,
  }) {
    return _then(_$_Loaded(
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded({required final List<TagModel> tags}) : _tags = tags;

  final List<TagModel> _tags;
  @override
  List<TagModel> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'TagsState.loaded(tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TagModel> tags) loading,
    required TResult Function(List<TagModel> tags) loaded,
    required TResult Function(List<TagModel> tags, Exception exception) error,
  }) {
    return loaded(tags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
  }) {
    return loaded?.call(tags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(tags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements TagsState {
  const factory _Loaded({required final List<TagModel> tags}) = _$_Loaded;

  @override
  List<TagModel> get tags => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $TagsStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({List<TagModel> tags, Exception exception});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$TagsStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? tags = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagModel>,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required final List<TagModel> tags, required this.exception})
      : _tags = tags;

  final List<TagModel> _tags;
  @override
  List<TagModel> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final Exception exception;

  @override
  String toString() {
    return 'TagsState.error(tags: $tags, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<TagModel> tags) loading,
    required TResult Function(List<TagModel> tags) loaded,
    required TResult Function(List<TagModel> tags, Exception exception) error,
  }) {
    return error(tags, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
  }) {
    return error?.call(tags, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<TagModel> tags)? loading,
    TResult Function(List<TagModel> tags)? loaded,
    TResult Function(List<TagModel> tags, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(tags, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements TagsState {
  const factory _Error(
      {required final List<TagModel> tags,
      required final Exception exception}) = _$_Error;

  @override
  List<TagModel> get tags => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
