part of 'edit_menu_cubit.dart';

class EditMenuState extends Equatable {
  final MenuModel? menu;
  final EditResourceStatus status;
  final Failure? failure;

  const EditMenuState({
    required this.menu,
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [menu, status, failure];

  bool get isSuccess => status == EditResourceStatus.success;
  bool get isError => status == EditResourceStatus.error;
  bool get isUpdating => status == EditResourceStatus.updating;

  factory EditMenuState.initial() {
    return const EditMenuState(
      failure: null,
      menu: null,
      status: EditResourceStatus.initial,
    );
  }

  EditMenuState copyWith({
    MenuModel? menu,
    EditResourceStatus? status,
    Failure? failure,
  }) {
    return EditMenuState(
      menu: menu ?? this.menu,
      status: status ?? this.status,
      failure: failure,
    );
  }
}
