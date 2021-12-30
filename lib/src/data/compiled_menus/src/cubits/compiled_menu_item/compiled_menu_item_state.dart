part of 'compiled_menu_item_cubit.dart';

enum CompiledMenuItemStatus {
  initial,
  loading,
  success,
  error,
}

class CompiledMenuItemState extends Equatable {
  final CompiledMenuItemStatus status;
  final List<MenuItemModel>? items;
  final Failure? failure;

  const CompiledMenuItemState({
    required this.status,
    required this.items,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, items, failure];

  factory CompiledMenuItemState.initial() {
    return const CompiledMenuItemState(
      items: null,
      status: CompiledMenuItemStatus.initial,
      failure: null,
    );
  }

  CompiledMenuItemState copyWith({
    CompiledMenuItemStatus? status,
    List<MenuItemModel>? items,
    Failure? failure,
  }) {
    return CompiledMenuItemState(
      status: status ?? this.status,
      items: items ?? this.items,
      failure: failure ?? this.failure,
    );
  }
}
