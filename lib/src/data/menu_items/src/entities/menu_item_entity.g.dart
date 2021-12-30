// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemEntity _$MenuItemEntityFromJson(Map<String, dynamic> json) =>
    MenuItemEntity(
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$MenuItemEntityToJson(MenuItemEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
    };
