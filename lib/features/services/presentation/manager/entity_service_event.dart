part of 'entity_service_bloc.dart';

abstract class EntityServiceEvent extends Equatable {
  const EntityServiceEvent();
}

class EntityServiceInitiated extends EntityServiceEvent {
  final String id;

  const EntityServiceInitiated(this.id);
  @override
  List<Object?> get props => [id];
}

class SingleEntityServiceInitiated extends EntityServiceEvent {
  final String id;

  const SingleEntityServiceInitiated(this.id);
  @override
  List<Object?> get props => [id];
}
