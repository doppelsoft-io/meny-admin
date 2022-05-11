part of 'resources_cubit.dart';

abstract class ResourcesState extends Equatable {
  const ResourcesState({this.resources = const []});
  final List<dynamic> resources;

  @override
  List<Object> get props => [resources];
}

class ResourcesInitial extends ResourcesState {}

class ResourcesLoading extends ResourcesState {}

class ResourcesLoaded extends ResourcesState {
  const ResourcesLoaded(this.resources);

  @override
  final List<dynamic> resources;

  @override
  List<Object> get props => [resources];
}

class ResourcesFailure extends ResourcesState {
  const ResourcesFailure(this.failure);
  final Failure failure;

  @override
  List<Object> get props => [failure];
}
