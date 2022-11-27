part of 'bulk_delete_menu_items_cubit.dart';

@freezed
class BulkDeleteMenuItemsState with _$BulkDeleteMenuItemsState {
  const factory BulkDeleteMenuItemsState.initial() = _Initial;
  const factory BulkDeleteMenuItemsState.deleting() = _Deleting;
  const factory BulkDeleteMenuItemsState.success() = _Success;
  const factory BulkDeleteMenuItemsState.error({
    required Exception exception,
  }) = _Error;
}
