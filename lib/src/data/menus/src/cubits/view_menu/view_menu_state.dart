part of 'view_menu_cubit.dart';

class ViewMenuState extends Equatable {
  final MenuModel? menu;

  const ViewMenuState({
    required this.menu,
  });

  @override
  List<Object?> get props => [menu];

  factory ViewMenuState.initial() {
    return const ViewMenuState(
      menu: null,
    );
  }

  ViewMenuState copyWith({
    MenuModel? menu,
  }) {
    return ViewMenuState(
      menu: menu ?? this.menu,
    );
  }
}
