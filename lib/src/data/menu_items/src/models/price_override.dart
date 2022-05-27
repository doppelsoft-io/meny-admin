import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_override.freezed.dart';
part 'price_override.g.dart';

@freezed
class PriceOverride with _$PriceOverride {
  @JsonSerializable(explicitToJson: true)
  factory PriceOverride({
    required int price,
  }) = _PriceOverride;

  factory PriceOverride.fromJson(Map<String, dynamic> json) =>
      _$PriceOverrideFromJson(json);
}
