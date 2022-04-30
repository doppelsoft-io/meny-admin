// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryMenuItemModel _$CategoryMenuItemModelFromJson(
    Map<String, dynamic> json) {
  return _CategoryMenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryMenuItemModel {
  String get categoryId => throw _privateConstructorUsedError;
  String get menuItemId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryMenuItemModelCopyWith<CategoryMenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryMenuItemModelCopyWith<$Res> {
  factory $CategoryMenuItemModelCopyWith(CategoryMenuItemModel value,
          $Res Function(CategoryMenuItemModel) then) =
      _$CategoryMenuItemModelCopyWithImpl<$Res>;
  $Res call({String categoryId, String menuItemId});
}

/// @nodoc
class _$CategoryMenuItemModelCopyWithImpl<$Res>
    implements $CategoryMenuItemModelCopyWith<$Res> {
  _$CategoryMenuItemModelCopyWithImpl(this._value, this._then);

  final CategoryMenuItemModel _value;
  // ignore: unused_field
  final $Res Function(CategoryMenuItemModel) _then;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? menuItemId = freezed,
  }) {
    return _then(_value.copyWith(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: menuItemId == freezed
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CategoryMenuItemModelCopyWith<$Res>
    implements $CategoryMenuItemModelCopyWith<$Res> {
  factory _$CategoryMenuItemModelCopyWith(_CategoryMenuItemModel value,
          $Res Function(_CategoryMenuItemModel) then) =
      __$CategoryMenuItemModelCopyWithImpl<$Res>;
  @override
  $Res call({String categoryId, String menuItemId});
}

/// @nodoc
class __$CategoryMenuItemModelCopyWithImpl<$Res>
    extends _$CategoryMenuItemModelCopyWithImpl<$Res>
    implements _$CategoryMenuItemModelCopyWith<$Res> {
  __$CategoryMenuItemModelCopyWithImpl(_CategoryMenuItemModel _value,
      $Res Function(_CategoryMenuItemModel) _then)
      : super(_value, (v) => _then(v as _CategoryMenuItemModel));

  @override
  _CategoryMenuItemModel get _value => super._value as _CategoryMenuItemModel;

  @override
  $Res call({
    Object? categoryId = freezed,
    Object? menuItemId = freezed,
  }) {
    return _then(_CategoryMenuItemModel(
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: menuItemId == freezed
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryMenuItemModel implements _CategoryMenuItemModel {
  _$_CategoryMenuItemModel(
      {required this.categoryId, required this.menuItemId});

  factory _$_CategoryMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryMenuItemModelFromJson(json);

  @override
  final String categoryId;
  @override
  final String menuItemId;

  @override
  String toString() {
    return 'CategoryMenuItemModel(categoryId: $categoryId, menuItemId: $menuItemId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryMenuItemModel &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.menuItemId, menuItemId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(menuItemId));

  @JsonKey(ignore: true)
  @override
  _$CategoryMenuItemModelCopyWith<_CategoryMenuItemModel> get copyWith =>
      __$CategoryMenuItemModelCopyWithImpl<_CategoryMenuItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryMenuItemModelToJson(this);
  }
}

abstract class _CategoryMenuItemModel implements CategoryMenuItemModel {
  factory _CategoryMenuItemModel(
      {required final String categoryId,
      required final String menuItemId}) = _$_CategoryMenuItemModel;

  factory _CategoryMenuItemModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryMenuItemModel.fromJson;

  @override
  String get categoryId => throw _privateConstructorUsedError;
  @override
  String get menuItemId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoryMenuItemModelCopyWith<_CategoryMenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
