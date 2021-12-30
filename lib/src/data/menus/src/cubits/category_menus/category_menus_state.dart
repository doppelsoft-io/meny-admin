part of 'category_menus_cubit.dart';

class CategoryMenusState extends Equatable {
  final List<MenuEntity> menus;
  final Failure? failure;

  const CategoryMenusState({
    required this.menus,
    required this.failure,
  });

  @override
  List<Object?> get props => [menus, failure];

  factory CategoryMenusState.initial() {
    return const CategoryMenusState(
      menus: [],
      failure: null,
    );
  }

  CategoryMenusState copyWith({
    List<MenuEntity>? menus,
    Failure? failure,
  }) {
    return CategoryMenusState(
      menus: menus ?? this.menus,
      failure: failure,
    );
  }
}
