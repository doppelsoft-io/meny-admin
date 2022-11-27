import 'package:doppelsoft_core/doppelsoft_core.dart';

part 'resource_table_item_selector_state.dart';
part 'resource_table_item_selector_cubit.freezed.dart';

class ResourceTableItemSelectorCubit<T>
    extends Cubit<ResourceTableItemSelectorState<T>> {
  ResourceTableItemSelectorCubit() : super(const _Initial(items: []));

  void add(T item) {
    if (!state.items.contains(item)) {
      final updatedItems = List<T>.from(state.items)..add(item);
      emit(_Initial(items: updatedItems));
    }
  }

  void remove(T item) {
    final updatedItems = List<T>.from(state.items)..remove(item);
    emit(_Initial(items: updatedItems));
  }

  void clear() {
    emit(const _Initial(items: []));
  }
}
