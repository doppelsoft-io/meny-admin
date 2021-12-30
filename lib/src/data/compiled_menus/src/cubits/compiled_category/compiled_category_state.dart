part of 'compiled_category_cubit.dart';

enum CompiledCategoryStatus {
  initial,
  loading,
  success,
  error,
}

class CompiledCategoryState extends Equatable {
  final CompiledCategoryStatus status;
  final List<CategoryModel>? categories;
  final Failure? failure;

  const CompiledCategoryState({
    required this.status,
    required this.categories,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, categories, failure];

  factory CompiledCategoryState.initial() {
    return const CompiledCategoryState(
      categories: null,
      status: CompiledCategoryStatus.initial,
      failure: null,
    );
  }

  CompiledCategoryState copyWith({
    CompiledCategoryStatus? status,
    List<CategoryModel>? categories,
    Failure? failure,
  }) {
    return CompiledCategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      failure: failure,
    );
  }
}
