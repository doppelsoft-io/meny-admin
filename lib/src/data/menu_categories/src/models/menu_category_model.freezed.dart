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
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get menuId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String menuId,
      String categoryId,
      int position,
      DateTime? createdAt});
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
    Object? id = freezed,
    Object? menuId = freezed,
    Object? categoryId = freezed,
    Object? position = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_MenuCategoryModelCopyWith<$Res>
    implements $MenuCategoryModelCopyWith<$Res> {
  factory _$$_MenuCategoryModelCopyWith(_$_MenuCategoryModel value,
          $Res Function(_$_MenuCategoryModel) then) =
      __$$_MenuCategoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String menuId,
      String categoryId,
      int position,
      DateTime? createdAt});
}

/// @nodoc
class __$$_MenuCategoryModelCopyWithImpl<$Res>
    extends _$MenuCategoryModelCopyWithImpl<$Res>
    implements _$$_MenuCategoryModelCopyWith<$Res> {
  __$$_MenuCategoryModelCopyWithImpl(
      _$_MenuCategoryModel _value, $Res Function(_$_MenuCategoryModel) _then)
      : super(_value, (v) => _then(v as _$_MenuCategoryModel));

  @override
  _$_MenuCategoryModel get _value => super._value as _$_MenuCategoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? menuId = freezed,
    Object? categoryId = freezed,
    Object? position = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_MenuCategoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      menuId: menuId == freezed
          ? _value.menuId
          : menuId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuCategoryModel implements _MenuCategoryModel {
  _$_MenuCategoryModel(
      {@JsonKey(ignore: true) this.id,
      required this.menuId,
      required this.categoryId,
      this.position = -1,
      this.createdAt});

  factory _$_MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_MenuCategoryModelFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String menuId;
  @override
  final String categoryId;
  @override
  @JsonKey()
  final int position;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MenuCategoryModel(id: $id, menuId: $menuId, categoryId: $categoryId, position: $position, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuCategoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.menuId, menuId) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(menuId),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_MenuCategoryModelCopyWith<_$_MenuCategoryModel> get copyWith =>
      __$$_MenuCategoryModelCopyWithImpl<_$_MenuCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuCategoryModelToJson(this);
  }
}

abstract class _MenuCategoryModel implements MenuCategoryModel {
  factory _MenuCategoryModel(
      {@JsonKey(ignore: true) final String? id,
      required final String menuId,
      required final String categoryId,
      final int position,
      final DateTime? createdAt}) = _$_MenuCategoryModel;

  factory _MenuCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_MenuCategoryModel.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get menuId => throw _privateConstructorUsedError;
  @override
  String get categoryId => throw _privateConstructorUsedError;
  @override
  int get position => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MenuCategoryModelCopyWith<_$_MenuCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
