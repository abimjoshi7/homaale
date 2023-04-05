part of 'entity_service_bloc.dart';

class EntityServiceState extends Equatable {
  final TheStates? theStates;
  final EntityServiceModel? service;
  final List<ServiceList>? serviceList;
  final bool? isDateSort;
  final bool? isBudgetSort;
  final bool? servicesLoaded;
  final bool? isFilter;

  EntityServiceState({
    this.theStates = TheStates.initial,
    this.service,
    this.serviceList,
    this.isDateSort = false,
    this.isBudgetSort = false,
    this.servicesLoaded = false,
    this.isFilter = false,
  });

  EntityServiceState copyWith({
    TheStates? theStates,
    EntityServiceModel? service,
    List<ServiceList>? serviceList,
    bool? isDateSort,
    bool? isBudgetSort,
    bool? servicesLoaded,
    bool? isFilter,
  }) {
    return EntityServiceState(
      theStates: theStates ?? this.theStates,
      service: service ?? this.service,
      serviceList: serviceList ?? this.serviceList,
      isDateSort: isDateSort ?? this.isDateSort,
      isBudgetSort: isBudgetSort ?? this.isBudgetSort,
      servicesLoaded: servicesLoaded ?? this.servicesLoaded,
      isFilter: isFilter ?? this.isFilter,
    );
  }

  @override
  List<Object?> get props => [theStates, service, serviceList, isDateSort, servicesLoaded, isBudgetSort, isFilter];
}
