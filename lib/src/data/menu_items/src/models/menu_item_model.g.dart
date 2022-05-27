// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuItemModel _$$_MenuItemModelFromJson(Map<String, dynamic> json) =>
    _$_MenuItemModel(
      name: json['name'] as String,
      priceInfo: PriceInfo.fromJson(json['priceInfo'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_MenuItemModelToJson(_$_MenuItemModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'priceInfo': instance.priceInfo.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
