part of 'resources_cubit.dart';

abstract class ResourcesState extends Equatable {
  final List<dynamic> resources;
  const ResourcesState({this.resources = const []});

  @override
  List<Object> get props => [resources];
}

class ResourcesInitial extends ResourcesState {}

class ResourcesLoading extends ResourcesState {}

class ResourcesLoaded extends ResourcesState {
  @override
  final List<dynamic> resources;

  const ResourcesLoaded(this.resources);

  @override
  List<Object> get props => [resources];
}

class ResourcesFailure extends ResourcesState {
  final Failure failure;

  const ResourcesFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
