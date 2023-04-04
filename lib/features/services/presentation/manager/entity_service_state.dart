part of 'entity_service_bloc.dart';

class EntityServiceState extends Equatable {
  final TheStates? theStates;
  final EntityServiceModel? service;
  final bool? isDateSort;
  final bool? isBudgetSort;

  EntityServiceState({
    this.theStates = TheStates.initial,
    this.service,
    this.isDateSort = false,
    this.isBudgetSort = false,
  });

  EntityServiceState copyWith({
    TheStates? theStates,
    EntityServiceModel? service,
    bool? isDateSort,
    bool? isBudgetSort,
  }) {
    return EntityServiceState(
      theStates: theStates ?? this.theStates,
      service: service ?? this.service,
      isDateSort: isDateSort ?? this.isDateSort,
      isBudgetSort: isBudgetSort ?? this.isBudgetSort,
    );
  }

  @override
  List<Object?> get props => [theStates, service, isDateSort, isBudgetSort];
}
