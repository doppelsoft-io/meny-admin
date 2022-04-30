// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuCategoryModel _$MenuCategoryModelFromJson(Map<String, dynamic> json) {
  return _MenuCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$MenuCategoryModel {
  String get menuId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuCategoryModelCopyWith<MenuCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCategoryModelCopyWith<$Res> {
  factory $MenuCategoryModelCopyWith(
          MenuCategoryModel value, $Res Function(MenuCategoryModel) then) =
      _$MenuCategoryModelCopyWithImpl<$Res>;
  $Res call({String menuId, String categoryId});
}

/// @nodoc
class _$MenuCategoryModelCopyWithImpl<$Res>
    implements $MenuCategoryModelCopyWith<$Res> {
  _$MenuCategoryModelCopyWithImpl(this._value, this._then);

  final MenuCategoryModel _value;
  // ignore: unused_field
  final $Res Function(MenuCategoryModel) _then;

  @override
  $Res call({
    Object? menuId = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MenuCategoryModelCopyWith<$Res>
    implements $MenuCategoryModelCopyWith<$Res> {
  factory _$MenuCategoryModelCopyWith(
          _MenuCategoryModel value, $Res Function(_MenuCategoryModel) then) =
      __$MenuCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String menuId, String categoryId});
}

/// @nodoc
class __$MenuCategoryModelCopyWithImpl<$Res>
    extends _$MenuCategoryModelCopyWithImpl<$Res>
    implements _$MenuCategoryModelCopyWith<$Res> {
  __$MenuCategoryModelCopyWithImpl(
      _MenuCategoryModel _value, $Res Function(_MenuCategoryModel) _then)
      : super(_value, (v) => _then(v as _MenuCategoryModel));

  @override
  _MenuCategoryModel get _value => super._value as _MenuCategoryModel;

  @override
  $Res call({
    Object? menuId = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_MenuCategoryModel(
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuCategoryModel implements _MenuCategoryModel {
  _$_MenuCategoryModel({required this.menuId, required this.categoryId});

  factory _$_MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_MenuCategoryModelFromJson(json);

  @override
  final String menuId;
  @override
  final String categoryId;

  @override
  String toString() {
    return 'MenuCategoryModel(menuId: $menuId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuCategoryModel &&
            const DeepCollectionEquality().equals(other.menuId, menuId) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(menuId),
      const DeepCollectionEquality().hash(categoryId));

  @JsonKey(ignore: true)
  @override
  _$MenuCategoryModelCopyWith<_MenuCategoryModel> get copyWith =>
      __$MenuCategoryModelCopyWithImpl<_MenuCategoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuCategoryModelToJson(this);
  }
}

abstract class _MenuCategoryModel implements MenuCategoryModel {
  factory _MenuCategoryModel(
      {required final String menuId,
      required final String categoryId}) = _$_MenuCategoryModel;

  factory _MenuCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_MenuCategoryModel.fromJson;

  @override
  String get menuId => throw _privateConstructorUsedError;
  @override
  String get categoryId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuCategoryModelCopyWith<_MenuCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
