part of 'edit_menu_item_cubit.dart';

class EditMenuItemState extends Equatable {
  final MenuItemEntity? item;
  final EditResourceStatus status;
  final Failure? failure;

  const EditMenuItemState({
    required this.item,
    required this.status,
    required this.failure,
  });

  @override
  List<Object?> get props => [item, status, failure];

  bool get isSuccess => status == EditResourceStatus.success;
  bool get isError => status == EditResourceStatus.error;
  bool get isUpdating => status == EditResourceStatus.updating;

  factory EditMenuItemState.initial() {
    return const EditMenuItemState(
      item: null,
      status: EditResourceStatus.initial,
      failure: null,
    );
  }

  EditMenuItemState copyWith({
    MenuItemEntity? item,
    EditResourceStatus? status,
    Failure? failure,
  }) {
    return EditMenuItemState(
      item: item ?? this.item,
      status: status ?? this.status,
      failure: failure,
    );
  }
}
