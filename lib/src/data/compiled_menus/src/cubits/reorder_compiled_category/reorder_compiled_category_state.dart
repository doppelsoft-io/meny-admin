part of 'reorder_compiled_category_cubit.dart';

enum ReorderCompiledCategoryStatus {
  initial,
  reordering,
  success,
  error,
}

class ReorderCompiledCategoryState extends Equatable {
  const ReorderCompiledCategoryState({
    required this.status,
    required this.failure,
  });

  factory ReorderCompiledCategoryState.initial() {
    return const ReorderCompiledCategoryState(
      failure: null,
      status: ReorderCompiledCategoryStatus.initial,
    );
  }

  final ReorderCompiledCategoryStatus status;
  final Failure? failure;

  ReorderCompiledCategoryState copyWith({
    ReorderCompiledCategoryStatus? status,
    Failure? failure,
  }) {
    return ReorderCompiledCategoryState(
      status: status ?? this.status,
      failure: failure,
    );
  }

  @override
  List<Object?> get props => [status, failure];
}
