// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditCategoryState {
  CategoryModel get category => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) initial,
    required TResult Function(CategoryModel category) updating,
    required TResult Function(CategoryModel category) success,
    required TResult Function(CategoryModel category, Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Updating value) updating,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Updating value)? updating,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditCategoryStateCopyWith<EditCategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditCategoryStateCopyWith<$Res> {
  factory $EditCategoryStateCopyWith(
          EditCategoryState value, $Res Function(EditCategoryState) then) =
      _$EditCategoryStateCopyWithImpl<$Res>;
  $Res call({CategoryModel category});

  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class _$EditCategoryStateCopyWithImpl<$Res>
    implements $EditCategoryStateCopyWith<$Res> {
  _$EditCategoryStateCopyWithImpl(this._value, this._then);

  final EditCategoryState _value;
  // ignore: unused_field
  final $Res Function(EditCategoryState) _then;

  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }

  @override
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $EditCategoryStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({CategoryModel category});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$EditCategoryStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_Initial(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({required this.category});

  @override
  final CategoryModel category;

  @override
  String toString() {
    return 'EditCategoryState.initial(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) initial,
    required TResult Function(CategoryModel category) updating,
    required TResult Function(CategoryModel category) success,
    required TResult Function(CategoryModel category, Exception exception)
        error,
  }) {
    return initial(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
  }) {
    return initial?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
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

abstract class _Initial implements EditCategoryState {
  const factory _Initial({required final CategoryModel category}) = _$_Initial;

  @override
  CategoryModel get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdatingCopyWith<$Res>
    implements $EditCategoryStateCopyWith<$Res> {
  factory _$UpdatingCopyWith(_Updating value, $Res Function(_Updating) then) =
      __$UpdatingCopyWithImpl<$Res>;
  @override
  $Res call({CategoryModel category});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$UpdatingCopyWithImpl<$Res>
    extends _$EditCategoryStateCopyWithImpl<$Res>
    implements _$UpdatingCopyWith<$Res> {
  __$UpdatingCopyWithImpl(_Updating _value, $Res Function(_Updating) _then)
      : super(_value, (v) => _then(v as _Updating));

  @override
  _Updating get _value => super._value as _Updating;

  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_Updating(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$_Updating implements _Updating {
  const _$_Updating({required this.category});

  @override
  final CategoryModel category;

  @override
  String toString() {
    return 'EditCategoryState.updating(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Updating &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$UpdatingCopyWith<_Updating> get copyWith =>
      __$UpdatingCopyWithImpl<_Updating>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) initial,
    required TResult Function(CategoryModel category) updating,
    required TResult Function(CategoryModel category) success,
    required TResult Function(CategoryModel category, Exception exception)
        error,
  }) {
    return updating(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
  }) {
    return updating?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (updating != null) {
      return updating(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
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

abstract class _Updating implements EditCategoryState {
  const factory _Updating({required final CategoryModel category}) =
      _$_Updating;

  @override
  CategoryModel get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdatingCopyWith<_Updating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $EditCategoryStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call({CategoryModel category});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> extends _$EditCategoryStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? category = freezed,
  }) {
    return _then(_Success(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success({required this.category});

  @override
  final CategoryModel category;

  @override
  String toString() {
    return 'EditCategoryState.success(category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) initial,
    required TResult Function(CategoryModel category) updating,
    required TResult Function(CategoryModel category) success,
    required TResult Function(CategoryModel category, Exception exception)
        error,
  }) {
    return success(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
  }) {
    return success?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
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

abstract class _Success implements EditCategoryState {
  const factory _Success({required final CategoryModel category}) = _$_Success;

  @override
  CategoryModel get category => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $EditCategoryStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call({CategoryModel category, Exception exception});

  @override
  $CategoryModelCopyWith<$Res> get category;
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$EditCategoryStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? category = freezed,
    Object? exception = freezed,
  }) {
    return _then(_Error(
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error({required this.category, required this.exception});

  @override
  final CategoryModel category;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'EditCategoryState.error(category: $category, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CategoryModel category) initial,
    required TResult Function(CategoryModel category) updating,
    required TResult Function(CategoryModel category) success,
    required TResult Function(CategoryModel category, Exception exception)
        error,
  }) {
    return error(category, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
  }) {
    return error?.call(category, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CategoryModel category)? initial,
    TResult Function(CategoryModel category)? updating,
    TResult Function(CategoryModel category)? success,
    TResult Function(CategoryModel category, Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(category, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
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

abstract class _Error implements EditCategoryState {
  const factory _Error(
      {required final CategoryModel category,
      required final Exception exception}) = _$_Error;

  @override
  CategoryModel get category => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
