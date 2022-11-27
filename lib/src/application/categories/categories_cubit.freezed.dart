// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoriesState {
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  OrderBy get orderBy => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loading,
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loaded,
    required TResult Function(List<CategoryModel> categories,
            Exception exception, OrderBy orderBy)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult? Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
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
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
  @useResult
  $Res call({List<CategoryModel> categories, OrderBy orderBy});

  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? orderBy = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderByCopyWith<$Res> get orderBy {
    return $OrderByCopyWith<$Res>(_value.orderBy, (value) {
      return _then(_value.copyWith(orderBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryModel> categories, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Loading(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading(
      {final List<CategoryModel> categories = const <CategoryModel>[],
      this.orderBy = const OrderBy()})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final OrderBy orderBy;

  @override
  String toString() {
    return 'CategoriesState.loading(categories: $categories, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories), orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      __$$_LoadingCopyWithImpl<_$_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loading,
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loaded,
    required TResult Function(List<CategoryModel> categories,
            Exception exception, OrderBy orderBy)
        error,
  }) {
    return loading(categories, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult? Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
  }) {
    return loading?.call(categories, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(categories, orderBy);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
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

abstract class _Loading implements CategoriesState {
  const factory _Loading(
      {final List<CategoryModel> categories,
      final OrderBy orderBy}) = _$_Loading;

  @override
  List<CategoryModel> get categories;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<_$_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryModel> categories, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Loaded(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(
      {required final List<CategoryModel> categories, required this.orderBy})
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final OrderBy orderBy;

  @override
  String toString() {
    return 'CategoriesState.loaded(categories: $categories, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories), orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loading,
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loaded,
    required TResult Function(List<CategoryModel> categories,
            Exception exception, OrderBy orderBy)
        error,
  }) {
    return loaded(categories, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult? Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
  }) {
    return loaded?.call(categories, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(categories, orderBy);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
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

abstract class _Loaded implements CategoriesState {
  const factory _Loaded(
      {required final List<CategoryModel> categories,
      required final OrderBy orderBy}) = _$_Loaded;

  @override
  List<CategoryModel> get categories;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CategoryModel> categories, Exception exception, OrderBy orderBy});

  @override
  $OrderByCopyWith<$Res> get orderBy;
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
    Object? exception = null,
    Object? orderBy = null,
  }) {
    return _then(_$_Error(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
      orderBy: null == orderBy
          ? _value.orderBy
          : orderBy // ignore: cast_nullable_to_non_nullable
              as OrderBy,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required final List<CategoryModel> categories,
      required this.exception,
      required this.orderBy})
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
  final OrderBy orderBy;

  @override
  String toString() {
    return 'CategoriesState.error(categories: $categories, exception: $exception, orderBy: $orderBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            (identical(other.orderBy, orderBy) || other.orderBy == orderBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_categories), exception, orderBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loading,
    required TResult Function(List<CategoryModel> categories, OrderBy orderBy)
        loaded,
    required TResult Function(List<CategoryModel> categories,
            Exception exception, OrderBy orderBy)
        error,
  }) {
    return error(categories, exception, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult? Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult? Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
  }) {
    return error?.call(categories, exception, orderBy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loading,
    TResult Function(List<CategoryModel> categories, OrderBy orderBy)? loaded,
    TResult Function(List<CategoryModel> categories, Exception exception,
            OrderBy orderBy)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(categories, exception, orderBy);
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
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
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

abstract class _Error implements CategoriesState {
  const factory _Error(
      {required final List<CategoryModel> categories,
      required final Exception exception,
      required final OrderBy orderBy}) = _$_Error;

  @override
  List<CategoryModel> get categories;
  Exception get exception;
  @override
  OrderBy get orderBy;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
