part of 'entity_service_bloc.dart';

abstract class EntityServiceState extends Equatable {
  const EntityServiceState();
}

class EntityServiceInitial extends EntityServiceState {
  @override
  List<Object> get props => [];
}

class EntityServiceLoadSuccess extends EntityServiceState {
  final EntityServiceModel service;

  const EntityServiceLoadSuccess(this.service);
  @override
  List<Object> get props => [service];
}

class EntityServiceLoadFailure extends EntityServiceState {
  @override
  List<Object> get props => [];
}
