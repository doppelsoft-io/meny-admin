part of 'compiled_menu_cubit.dart';

enum CompiledMenuStatus {
  initial,
  loading,
  success,
  error,
}

class CompiledMenuState extends Equatable {
  final CompiledMenuStatus status;
  final MenuEntity? menu;
  final Failure? failure;

  const CompiledMenuState({
    required this.status,
    required this.menu,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, menu, failure];

  factory CompiledMenuState.initial() {
    return const CompiledMenuState(
      menu: null,
      status: CompiledMenuStatus.initial,
      failure: null,
    );
  }

  CompiledMenuState copyWith({
    CompiledMenuStatus? status,
    MenuEntity? menu,
    Failure? failure,
  }) {
    return CompiledMenuState(
      status: status ?? this.status,
      menu: menu ?? this.menu,
      failure: failure,
    );
  }
}
