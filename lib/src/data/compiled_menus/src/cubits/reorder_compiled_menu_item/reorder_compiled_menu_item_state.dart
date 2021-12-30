part of 'reorder_compiled_menu_item_cubit.dart';

enum ReorderCompiledMenuItemStatus {
  initial,
  reordering,
  success,
  error,
}

class ReorderCompiledMenuItemState extends Equatable {
  final ReorderCompiledMenuItemStatus status;
  final Failure? failure;

  const ReorderCompiledMenuItemState({
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, failure];

  factory ReorderCompiledMenuItemState.initial() {
    return const ReorderCompiledMenuItemState(
      failure: null,
      status: ReorderCompiledMenuItemStatus.initial,
    );
  }

  ReorderCompiledMenuItemState copyWith({
    ReorderCompiledMenuItemStatus? status,
    Failure? failure,
  }) {
    return ReorderCompiledMenuItemState(
      status: status ?? this.status,
      failure: failure,
    );
  }
}
