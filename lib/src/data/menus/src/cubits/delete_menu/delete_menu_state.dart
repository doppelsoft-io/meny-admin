part of 'delete_menu_cubit.dart';

enum DeleteMenuStatus {
  initial,
  deleting,
  success,
  error,
}

class DeleteMenuState extends Equatable {
  final DeleteMenuStatus status;
  final Failure? failure;
  const DeleteMenuState({
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [
        status,
        failure,
      ];

  bool get isDeleting => status == DeleteMenuStatus.deleting;

  factory DeleteMenuState.initial() {
    return const DeleteMenuState(
      status: DeleteMenuStatus.initial,
      failure: null,
    );
  }

  DeleteMenuState copyWith({
    DeleteMenuStatus? status,
    Failure? failure,
  }) {
    return DeleteMenuState(
      status: status ?? this.status,
      failure: failure,
    );
  }
}
