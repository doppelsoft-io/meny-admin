// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'compiled_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompiledCategoryState {
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) initial,
    required TResult Function(List<CategoryModel> categories) loading,
    required TResult Function(List<CategoryModel> categories) success,
    required TResult Function(
            List<CategoryModel> categories, Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompiledCategoryStateCopyWith<CompiledCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompiledCategoryStateCopyWith<$Res> {
  factory $CompiledCategoryStateCopyWith(CompiledCategoryState value,
          $Res Function(CompiledCategoryState) then) =
      _$CompiledCategoryStateCopyWithImpl<$Res>;
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class _$CompiledCategoryStateCopyWithImpl<$Res>
    implements $CompiledCategoryStateCopyWith<$Res> {
  _$CompiledCategoryStateCopyWithImpl(this._value, this._then);

  final CompiledCategoryState _value;
  // ignore: unused_field
  final $Res Function(CompiledCategoryState) _then;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $CompiledCategoryStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CompiledCategoryStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_Initial(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  _$_Initial({final List<CategoryModel> categories = const <CategoryModel>[]})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CompiledCategoryState.initial(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) initial,
    required TResult Function(List<CategoryModel> categories) loading,
    required TResult Function(List<CategoryModel> categories) success,
    required TResult Function(
            List<CategoryModel> categories, Exception exception)
        error,
  }) {
    return initial(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
  }) {
    return initial?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
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

abstract class _Initial implements CompiledCategoryState {
  factory _Initial({final List<CategoryModel> categories}) = _$_Initial;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $CompiledCategoryStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CompiledCategoryStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_Loading(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  _$_Loading({required final List<CategoryModel> categories})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CompiledCategoryState.loading(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) initial,
    required TResult Function(List<CategoryModel> categories) loading,
    required TResult Function(List<CategoryModel> categories) success,
    required TResult Function(
            List<CategoryModel> categories, Exception exception)
        error,
  }) {
    return loading(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
  }) {
    return loading?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
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

abstract class _Loading implements CompiledCategoryState {
  factory _Loading({required final List<CategoryModel> categories}) =
      _$_Loading;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res>
    implements $CompiledCategoryStateCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$CompiledCategoryStateCopyWithImpl<$Res>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, (v) => _then(v as _$_Success));

  @override
  _$_Success get _value => super._value as _$_Success;

  @override
  $Res call({
    Object? categories = freezed,
  }) {
    return _then(_$_Success(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  _$_Success({required final List<CategoryModel> categories})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CompiledCategoryState.success(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Success &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      __$$_SuccessCopyWithImpl<_$_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) initial,
    required TResult Function(List<CategoryModel> categories) loading,
    required TResult Function(List<CategoryModel> categories) success,
    required TResult Function(
            List<CategoryModel> categories, Exception exception)
        error,
  }) {
    return success(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
  }) {
    return success?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
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

abstract class _Success implements CompiledCategoryState {
  factory _Success({required final List<CategoryModel> categories}) =
      _$_Success;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessCopyWith<_$_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $CompiledCategoryStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  $Res call({List<CategoryModel> categories, Exception exception});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$CompiledCategoryStateCopyWithImpl<$Res>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, (v) => _then(v as _$_Error));

  @override
  _$_Error get _value => super._value as _$_Error;

  @override
  $Res call({
    Object? categories = freezed,
    Object? exception = freezed,
  }) {
    return _then(_$_Error(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  _$_Error(
      {required final List<CategoryModel> categories, required this.exception})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final Exception exception;

  @override
  String toString() {
    return 'CompiledCategoryState.error(categories: $categories, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories) initial,
    required TResult Function(List<CategoryModel> categories) loading,
    required TResult Function(List<CategoryModel> categories) success,
    required TResult Function(
            List<CategoryModel> categories, Exception exception)
        error,
  }) {
    return error(categories, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
  }) {
    return error?.call(categories, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories)? initial,
    TResult Function(List<CategoryModel> categories)? loading,
    TResult Function(List<CategoryModel> categories)? success,
    TResult Function(List<CategoryModel> categories, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(categories, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
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

abstract class _Error implements CompiledCategoryState {
  factory _Error(
      {required final List<CategoryModel> categories,
      required final Exception exception}) = _$_Error;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
