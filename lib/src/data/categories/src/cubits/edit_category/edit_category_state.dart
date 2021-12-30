part of 'edit_category_cubit.dart';

class EditCategoryState extends Equatable {
  final CategoryEntity? category;
  final EditResourceStatus status;
  final Failure? failure;

  const EditCategoryState({
    required this.category,
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [category, status, failure];

  bool get isSuccess => status == EditResourceStatus.success;
  bool get isError => status == EditResourceStatus.error;
  bool get isUpdating => status == EditResourceStatus.updating;

  factory EditCategoryState.initial() {
    return const EditCategoryState(
      category: null,
      failure: null,
      status: EditResourceStatus.initial,
    );
  }

  EditCategoryState copyWith({
    CategoryEntity? category,
    EditResourceStatus? status,
    Failure? failure,
  }) {
    return EditCategoryState(
      category: category ?? this.category,
      status: status ?? this.status,
      failure: failure,
    );
  }
}
