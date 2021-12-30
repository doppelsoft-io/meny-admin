part of 'delete_category_cubit.dart';

enum DeleteCategoryStatus {
  initial,
  deleting,
  success,
  error,
}

class DeleteCategoryState extends Equatable {
  final DeleteCategoryStatus status;
  final Failure? failure;
  const DeleteCategoryState({
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, failure];

  bool get isDeleting => status == DeleteCategoryStatus.deleting;

  factory DeleteCategoryState.initial() {
    return const DeleteCategoryState(
      status: DeleteCategoryStatus.initial,
      failure: null,
    );
  }

  DeleteCategoryState copyWith({
    DeleteCategoryStatus? status,
    Failure? failure,
  }) {
    return DeleteCategoryState(
      status: status ?? this.status,
      failure: failure,
    );
  }
}
