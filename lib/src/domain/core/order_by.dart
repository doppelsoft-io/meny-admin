import 'package:doppelsoft_core/doppelsoft_core.dart';

part 'order_by.freezed.dart';

@freezed
class OrderBy with _$OrderBy {
  const factory OrderBy({
    @Default('createdAt') String field,
    @Default(true) bool descending,
    int? sortColumnIndex,
  }) = _OrderBy;
}
