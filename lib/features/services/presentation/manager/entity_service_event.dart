part of 'entity_service_bloc.dart';

abstract class EntityServiceEvent extends Equatable {
  const EntityServiceEvent();
}

class EntityServiceInitiated extends EntityServiceEvent {
  const EntityServiceInitiated();
  @override
  List<Object?> get props => [];
}

class SingleEntityServiceInitiated extends EntityServiceEvent {
  final String id;

  const SingleEntityServiceInitiated(this.id);
  @override
  List<Object?> get props => [id];
}
