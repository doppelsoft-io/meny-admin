part of 'menu_item_categories_cubit.dart';

class MenuItemCategoriesState extends Equatable {
  final List<CategoryEntity> categories;
  final Failure? failure;

  const MenuItemCategoriesState({
    required this.categories,
    required this.failure,
  });

  @override
  List<Object?> get props => [categories, failure];

  factory MenuItemCategoriesState.initial() {
    return const MenuItemCategoriesState(
      categories: [],
      failure: null,
    );
  }

  MenuItemCategoriesState copyWith({
    List<CategoryEntity>? categories,
    Failure? failure,
  }) {
    return MenuItemCategoriesState(
      categories: categories ?? this.categories,
      failure: failure,
    );
  }
}
