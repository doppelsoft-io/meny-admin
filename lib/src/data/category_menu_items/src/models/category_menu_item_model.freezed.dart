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
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get menuItemId => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String categoryId,
      String menuItemId,
      int? position,
      DateTime? createdAt});
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
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? menuItemId = freezed,
    Object? position = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: menuItemId == freezed
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_CategoryMenuItemModelCopyWith<$Res>
    implements $CategoryMenuItemModelCopyWith<$Res> {
  factory _$$_CategoryMenuItemModelCopyWith(_$_CategoryMenuItemModel value,
          $Res Function(_$_CategoryMenuItemModel) then) =
      __$$_CategoryMenuItemModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String? id,
      String categoryId,
      String menuItemId,
      int? position,
      DateTime? createdAt});
}

/// @nodoc
class __$$_CategoryMenuItemModelCopyWithImpl<$Res>
    extends _$CategoryMenuItemModelCopyWithImpl<$Res>
    implements _$$_CategoryMenuItemModelCopyWith<$Res> {
  __$$_CategoryMenuItemModelCopyWithImpl(_$_CategoryMenuItemModel _value,
      $Res Function(_$_CategoryMenuItemModel) _then)
      : super(_value, (v) => _then(v as _$_CategoryMenuItemModel));

  @override
  _$_CategoryMenuItemModel get _value =>
      super._value as _$_CategoryMenuItemModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? menuItemId = freezed,
    Object? position = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_CategoryMenuItemModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      menuItemId: menuItemId == freezed
          ? _value.menuItemId
          : menuItemId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryMenuItemModel implements _CategoryMenuItemModel {
  _$_CategoryMenuItemModel(
      {@JsonKey(ignore: true) this.id,
      required this.categoryId,
      required this.menuItemId,
      this.position,
      this.createdAt});

  factory _$_CategoryMenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryMenuItemModelFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String? id;
  @override
  final String categoryId;
  @override
  final String menuItemId;
  @override
  final int? position;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CategoryMenuItemModel(id: $id, categoryId: $categoryId, menuItemId: $menuItemId, position: $position, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryMenuItemModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.categoryId, categoryId) &&
            const DeepCollectionEquality()
                .equals(other.menuItemId, menuItemId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(categoryId),
      const DeepCollectionEquality().hash(menuItemId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(createdAt));

  @JsonKey(ignore: true)
  @override
  _$$_CategoryMenuItemModelCopyWith<_$_CategoryMenuItemModel> get copyWith =>
      __$$_CategoryMenuItemModelCopyWithImpl<_$_CategoryMenuItemModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryMenuItemModelToJson(this);
  }
}

abstract class _CategoryMenuItemModel implements CategoryMenuItemModel {
  factory _CategoryMenuItemModel(
      {@JsonKey(ignore: true) final String? id,
      required final String categoryId,
      required final String menuItemId,
      final int? position,
      final DateTime? createdAt}) = _$_CategoryMenuItemModel;

  factory _CategoryMenuItemModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryMenuItemModel.fromJson;

  @override
  @JsonKey(ignore: true)
  String? get id => throw _privateConstructorUsedError;
  @override
  String get categoryId => throw _privateConstructorUsedError;
  @override
  String get menuItemId => throw _privateConstructorUsedError;
  @override
  int? get position => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryMenuItemModelCopyWith<_$_CategoryMenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
