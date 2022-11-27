part of 'resource_table_item_selector_cubit.dart';

@freezed
class ResourceTableItemSelectorState<T>
    with _$ResourceTableItemSelectorState<T> {
  const factory ResourceTableItemSelectorState.initial({
    required List<T> items,
  }) = _Initial;
}
