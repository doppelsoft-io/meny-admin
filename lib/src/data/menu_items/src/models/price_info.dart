import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:meny/src/data/menu_items/src/models/price_override.dart';

part 'price_info.freezed.dart';
part 'price_info.g.dart';

@freezed
class PriceInfo with _$PriceInfo {
  @JsonSerializable(explicitToJson: true)
  factory PriceInfo({
    required int price,
    List<PriceOverride>? overrides,
  }) = _PriceInfo;

  factory PriceInfo.fromJson(Map<String, dynamic> json) =>
      _$PriceInfoFromJson(json);
}
