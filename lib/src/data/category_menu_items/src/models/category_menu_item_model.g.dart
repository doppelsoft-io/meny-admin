// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryMenuItemModel _$$_CategoryMenuItemModelFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryMenuItemModel(
      categoryId: json['categoryId'] as String,
      menuItemId: json['menuItemId'] as String,
      position: json['position'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CategoryMenuItemModelToJson(
        _$_CategoryMenuItemModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'menuItemId': instance.menuItemId,
      'position': instance.position,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
