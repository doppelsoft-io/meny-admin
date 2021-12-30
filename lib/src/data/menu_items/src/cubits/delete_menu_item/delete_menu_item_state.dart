part of 'delete_menu_item_cubit.dart';

enum DeleteMenuItemStatus {
  initial,
  deleting,
  success,
  error,
}

class DeleteMenuItemState extends Equatable {
  final DeleteMenuItemStatus status;
  final Failure? failure;

  const DeleteMenuItemState({
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [
        status,
        failure,
      ];

  bool get isDeleting => status == DeleteMenuItemStatus.deleting;

  factory DeleteMenuItemState.initial() {
    return const DeleteMenuItemState(
      status: DeleteMenuItemStatus.initial,
      failure: null,
    );
  }

  DeleteMenuItemState copyWith({
    DeleteMenuItemStatus? status,
    Failure? failure,
  }) {
    return DeleteMenuItemState(
      status: status ?? this.status,
      failure: failure,
    );
  }
}
