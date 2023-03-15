part of 'entity_service_bloc.dart';

abstract class EntityServiceEvent extends Equatable {
  const EntityServiceEvent();
}

class EntityServiceInitiated extends EntityServiceEvent {
  final int? page;
  const EntityServiceInitiated({this.page});
  @override
  List<Object?> get props => [page];
}

class SingleEntityServiceInitiated extends EntityServiceEvent {
  final String id;

  const SingleEntityServiceInitiated(this.id);
  @override
  List<Object?> get props => [id];
}
