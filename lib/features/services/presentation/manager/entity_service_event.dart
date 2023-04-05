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
  final String? serviceId;
  final bool? isFilter;

  const EntityServiceInitiated({
    this.page,
    this.order,
    this.isDateSort,
    this.isBudgetSort,
    this.serviceId,
    this.isFilter,
  });
  @override
  List<Object?> get props => [page, order, isDateSort, isBudgetSort, serviceId, isFilter];
}

class FetchServicesList extends EntityServiceEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SingleEntityServiceInitiated extends EntityServiceEvent {
  final String id;

  const SingleEntityServiceInitiated(this.id);
  @override
  List<Object?> get props => [id];
}
