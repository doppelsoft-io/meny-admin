// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_menu_items_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryMenuItemsState {
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  List<CategoryMenuItemModel> get categoryMenuItems =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        initial,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        adding,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        removing,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        success,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Adding value) adding,
    required TResult Function(_Removing value) removing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryMenuItemsStateCopyWith<CategoryMenuItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryMenuItemsStateCopyWith<$Res> {
  factory $CategoryMenuItemsStateCopyWith(CategoryMenuItemsState value,
          $Res Function(CategoryMenuItemsState) then) =
      _$CategoryMenuItemsStateCopyWithImpl<$Res>;
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryMenuItemModel> categoryMenuItems});
}

/// @nodoc
class _$CategoryMenuItemsStateCopyWithImpl<$Res>
    implements $CategoryMenuItemsStateCopyWith<$Res> {
  _$CategoryMenuItemsStateCopyWithImpl(this._value, this._then);

  final CategoryMenuItemsState _value;
  // ignore: unused_field
  final $Res Function(CategoryMenuItemsState) _then;

  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryMenuItems = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryMenuItems: categoryMenuItems == freezed
          ? _value.categoryMenuItems
          : categoryMenuItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryMenuItemModel>,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $CategoryMenuItemsStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryMenuItemModel> categoryMenuItems});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$CategoryMenuItemsStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryMenuItems = freezed,
  }) {
    return _then(_Initial(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryMenuItems: categoryMenuItems == freezed
          ? _value.categoryMenuItems
          : categoryMenuItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryMenuItemModel>,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {final List<CategoryModel> categories = const <CategoryModel>[],
      final List<CategoryMenuItemModel> categoryMenuItems =
          const <CategoryMenuItemModel>[]})
      : _categories = categories,
        _categoryMenuItems = categoryMenuItems;

  final List<CategoryModel> _categories;
  @override
  @JsonKey()
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryMenuItemModel> _categoryMenuItems;
  @override
  @JsonKey()
  List<CategoryMenuItemModel> get categoryMenuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryMenuItems);
  }

  @override
  String toString() {
    return 'CategoryMenuItemsState.initial(categories: $categories, categoryMenuItems: $categoryMenuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.categoryMenuItems, categoryMenuItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(categoryMenuItems));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        initial,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        adding,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        removing,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        success,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)
        error,
  }) {
    return initial(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
  }) {
    return initial?.call(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(categories, categoryMenuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Adding value) adding,
    required TResult Function(_Removing value) removing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
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

abstract class _Initial implements CategoryMenuItemsState {
  const factory _Initial(
      {final List<CategoryModel> categories,
      final List<CategoryMenuItemModel> categoryMenuItems}) = _$_Initial;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AddingCopyWith<$Res>
    implements $CategoryMenuItemsStateCopyWith<$Res> {
  factory _$AddingCopyWith(_Adding value, $Res Function(_Adding) then) =
      __$AddingCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryMenuItemModel> categoryMenuItems});
}

/// @nodoc
class __$AddingCopyWithImpl<$Res>
    extends _$CategoryMenuItemsStateCopyWithImpl<$Res>
    implements _$AddingCopyWith<$Res> {
  __$AddingCopyWithImpl(_Adding _value, $Res Function(_Adding) _then)
      : super(_value, (v) => _then(v as _Adding));

  @override
  _Adding get _value => super._value as _Adding;

  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryMenuItems = freezed,
  }) {
    return _then(_Adding(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryMenuItems: categoryMenuItems == freezed
          ? _value.categoryMenuItems
          : categoryMenuItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryMenuItemModel>,
    ));
  }
}

/// @nodoc

class _$_Adding implements _Adding {
  const _$_Adding(
      {required final List<CategoryModel> categories,
      required final List<CategoryMenuItemModel> categoryMenuItems})
      : _categories = categories,
        _categoryMenuItems = categoryMenuItems;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryMenuItemModel> _categoryMenuItems;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryMenuItems);
  }

  @override
  String toString() {
    return 'CategoryMenuItemsState.adding(categories: $categories, categoryMenuItems: $categoryMenuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Adding &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.categoryMenuItems, categoryMenuItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(categoryMenuItems));

  @JsonKey(ignore: true)
  @override
  _$AddingCopyWith<_Adding> get copyWith =>
      __$AddingCopyWithImpl<_Adding>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        initial,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        adding,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        removing,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        success,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)
        error,
  }) {
    return adding(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
  }) {
    return adding?.call(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (adding != null) {
      return adding(categories, categoryMenuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Adding value) adding,
    required TResult Function(_Removing value) removing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return adding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return adding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (adding != null) {
      return adding(this);
    }
    return orElse();
  }
}

abstract class _Adding implements CategoryMenuItemsState {
  const factory _Adding(
          {required final List<CategoryModel> categories,
          required final List<CategoryMenuItemModel> categoryMenuItems}) =
      _$_Adding;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AddingCopyWith<_Adding> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemovingCopyWith<$Res>
    implements $CategoryMenuItemsStateCopyWith<$Res> {
  factory _$RemovingCopyWith(_Removing value, $Res Function(_Removing) then) =
      __$RemovingCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryMenuItemModel> categoryMenuItems});
}

/// @nodoc
class __$RemovingCopyWithImpl<$Res>
    extends _$CategoryMenuItemsStateCopyWithImpl<$Res>
    implements _$RemovingCopyWith<$Res> {
  __$RemovingCopyWithImpl(_Removing _value, $Res Function(_Removing) _then)
      : super(_value, (v) => _then(v as _Removing));

  @override
  _Removing get _value => super._value as _Removing;

  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryMenuItems = freezed,
  }) {
    return _then(_Removing(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryMenuItems: categoryMenuItems == freezed
          ? _value.categoryMenuItems
          : categoryMenuItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryMenuItemModel>,
    ));
  }
}

/// @nodoc

class _$_Removing implements _Removing {
  const _$_Removing(
      {required final List<CategoryModel> categories,
      required final List<CategoryMenuItemModel> categoryMenuItems})
      : _categories = categories,
        _categoryMenuItems = categoryMenuItems;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryMenuItemModel> _categoryMenuItems;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryMenuItems);
  }

  @override
  String toString() {
    return 'CategoryMenuItemsState.removing(categories: $categories, categoryMenuItems: $categoryMenuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Removing &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.categoryMenuItems, categoryMenuItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(categoryMenuItems));

  @JsonKey(ignore: true)
  @override
  _$RemovingCopyWith<_Removing> get copyWith =>
      __$RemovingCopyWithImpl<_Removing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        initial,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        adding,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        removing,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        success,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)
        error,
  }) {
    return removing(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
  }) {
    return removing?.call(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (removing != null) {
      return removing(categories, categoryMenuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Adding value) adding,
    required TResult Function(_Removing value) removing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return removing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return removing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (removing != null) {
      return removing(this);
    }
    return orElse();
  }
}

abstract class _Removing implements CategoryMenuItemsState {
  const factory _Removing(
          {required final List<CategoryModel> categories,
          required final List<CategoryMenuItemModel> categoryMenuItems}) =
      _$_Removing;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RemovingCopyWith<_Removing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SuccessCopyWith<$Res>
    implements $CategoryMenuItemsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryMenuItemModel> categoryMenuItems});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    extends _$CategoryMenuItemsStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryMenuItems = freezed,
  }) {
    return _then(_Success(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryMenuItems: categoryMenuItems == freezed
          ? _value.categoryMenuItems
          : categoryMenuItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryMenuItemModel>,
    ));
  }
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success(
      {required final List<CategoryModel> categories,
      required final List<CategoryMenuItemModel> categoryMenuItems})
      : _categories = categories,
        _categoryMenuItems = categoryMenuItems;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryMenuItemModel> _categoryMenuItems;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryMenuItems);
  }

  @override
  String toString() {
    return 'CategoryMenuItemsState.success(categories: $categories, categoryMenuItems: $categoryMenuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.categoryMenuItems, categoryMenuItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(categoryMenuItems));

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        initial,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        adding,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        removing,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        success,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)
        error,
  }) {
    return success(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
  }) {
    return success?.call(categories, categoryMenuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categories, categoryMenuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Adding value) adding,
    required TResult Function(_Removing value) removing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
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

abstract class _Success implements CategoryMenuItemsState {
  const factory _Success(
          {required final List<CategoryModel> categories,
          required final List<CategoryMenuItemModel> categoryMenuItems}) =
      _$_Success;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SuccessCopyWith<_Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res>
    implements $CategoryMenuItemsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<CategoryModel> categories,
      List<CategoryMenuItemModel> categoryMenuItems,
      Exception exception});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    extends _$CategoryMenuItemsStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? categories = freezed,
    Object? categoryMenuItems = freezed,
    Object? exception = freezed,
  }) {
    return _then(_Error(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
      categoryMenuItems: categoryMenuItems == freezed
          ? _value.categoryMenuItems
          : categoryMenuItems // ignore: cast_nullable_to_non_nullable
              as List<CategoryMenuItemModel>,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(
      {required final List<CategoryModel> categories,
      required final List<CategoryMenuItemModel> categoryMenuItems,
      required this.exception})
      : _categories = categories,
        _categoryMenuItems = categoryMenuItems;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryMenuItemModel> _categoryMenuItems;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryMenuItems);
  }

  @override
  final Exception exception;

  @override
  String toString() {
    return 'CategoryMenuItemsState.error(categories: $categories, categoryMenuItems: $categoryMenuItems, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality()
                .equals(other.categoryMenuItems, categoryMenuItems) &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(categoryMenuItems),
      const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        initial,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        adding,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        removing,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)
        success,
    required TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)
        error,
  }) {
    return error(categories, categoryMenuItems, exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
  }) {
    return error?.call(categories, categoryMenuItems, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        initial,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        adding,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        removing,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems)?
        success,
    TResult Function(List<CategoryModel> categories,
            List<CategoryMenuItemModel> categoryMenuItems, Exception exception)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(categories, categoryMenuItems, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Adding value) adding,
    required TResult Function(_Removing value) removing,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Adding value)? adding,
    TResult Function(_Removing value)? removing,
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

abstract class _Error implements CategoryMenuItemsState {
  const factory _Error(
      {required final List<CategoryModel> categories,
      required final List<CategoryMenuItemModel> categoryMenuItems,
      required final Exception exception}) = _$_Error;

  @override
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  @override
  List<CategoryMenuItemModel> get categoryMenuItems =>
      throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
