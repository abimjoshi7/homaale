// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'entity_service_bloc.dart';

abstract class EntityServiceEvent extends Equatable {
  const EntityServiceEvent();
}

class EntityServiceInitiated extends EntityServiceEvent {
  final int? page;
  final List<String>? order;
  final bool? isDateSort;
  final bool? isBudgetSort;

  const EntityServiceInitiated({
    this.page,
    this.order,
    this.isDateSort,
    this.isBudgetSort,
  });
  @override
  List<Object?> get props => [page, order, isDateSort, isBudgetSort];
}

class SingleEntityServiceInitiated extends EntityServiceEvent {
  final String id;

  const SingleEntityServiceInitiated(this.id);
  @override
  List<Object?> get props => [id];
}
