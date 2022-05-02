part of 'view_menu_cubit.dart';

class ViewMenuState extends Equatable {
  const ViewMenuState({
    required this.menu,
  });

  factory ViewMenuState.initial() {
    return const ViewMenuState(
      menu: null,
    );
  }

  final MenuModel? menu;

  ViewMenuState copyWith({
    MenuModel? menu,
  }) {
    return ViewMenuState(
      menu: menu ?? this.menu,
    );
  }

  @override
  List<Object?> get props => [menu];
}
