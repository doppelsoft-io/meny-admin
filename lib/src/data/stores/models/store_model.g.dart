// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      name: json['name'] as String,
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      roles: Map<String, String>.from(json['roles'] as Map),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'users': instance.users,
      'roles': instance.roles,
      'createdAt': instance.createdAt.toIso8601String(),
    };
