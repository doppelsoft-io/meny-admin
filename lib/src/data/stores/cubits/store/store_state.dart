part of 'store_cubit.dart';

enum StoreStatus {
  initial,
  loaded,
  error,
}

class StoreState extends Equatable {
  final StoreStatus status;
  final StoreModel? store;
  final Failure? failure;

  const StoreState({
    required this.status,
    required this.store,
    required this.failure,
  });

  @override
  List<Object?> get props => [status, store, failure];

  factory StoreState.initial() {
    return StoreState(
      status: StoreStatus.initial,
      store: null,
      failure: null,
    );
  }

  StoreState copyWith({
    StoreStatus? status,
    StoreModel? store,
    Failure? failure,
  }) {
    return StoreState(
      status: status ?? this.status,
      store: store ?? this.store,
      failure: failure,
    );
  }
}
