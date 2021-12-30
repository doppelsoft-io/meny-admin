// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuEntity _$MenuEntityFromJson(Map<String, dynamic> json) => MenuEntity(
      name: json['name'] as String,
      categoryIds: (json['categoryIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MenuEntityToJson(MenuEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'categoryIds': instance.categoryIds,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
