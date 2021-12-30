part of 'reorder_compiled_category_cubit.dart';

enum ReorderCompiledCategoryStatus {
  initial,
  reordering,
  success,
  error,
}

class ReorderCompiledCategoryState extends Equatable {
  final ReorderCompiledCategoryStatus status;
  final Failure? failure;

  const ReorderCompiledCategoryState({
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, failure];

  factory ReorderCompiledCategoryState.initial() {
    return const ReorderCompiledCategoryState(
      failure: null,
      status: ReorderCompiledCategoryStatus.initial,
    );
  }

  ReorderCompiledCategoryState copyWith({
    ReorderCompiledCategoryStatus? status,
    Failure? failure,
  }) {
    return ReorderCompiledCategoryState(
      status: status ?? this.status,
      failure: failure,
    );
  }
}
