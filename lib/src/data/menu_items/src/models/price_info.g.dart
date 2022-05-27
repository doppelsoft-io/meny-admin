// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceInfo _$$_PriceInfoFromJson(Map<String, dynamic> json) => _$_PriceInfo(
      price: json['price'] as int,
      overrides: (json['overrides'] as List<dynamic>?)
          ?.map((e) => PriceOverride.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PriceInfoToJson(_$_PriceInfo instance) =>
    <String, dynamic>{
      'price': instance.price,
      'overrides': instance.overrides?.map((e) => e.toJson()).toList(),
    };
