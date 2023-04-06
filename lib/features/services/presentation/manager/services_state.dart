part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final TheStates? theStates;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  final List<ServiceList>? serviceList;
  final bool? isServiceListLoaded;
  final EntityServiceModel? service;
  final bool? isDateSort;
  final bool? isBudgetSort;
  final ProfessionalServiceModel? professionalServiceModel;

  const ServicesState({
    this.theStates = TheStates.initial,
    this.selfCreatedTaskServiceModel,
    this.serviceList,
    this.isServiceListLoaded = false,
    this.service,
    this.isDateSort,
    this.isBudgetSort,
    this.professionalServiceModel,
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      selfCreatedTaskServiceModel,
      serviceList,
      isServiceListLoaded,
      service,
      isDateSort,
      isBudgetSort,
      professionalServiceModel,
    ];
  }

  ServicesState copyWith({
    TheStates? theStates,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
    List<ServiceList>? serviceList,
    bool? isServiceListLoaded,
    EntityServiceModel? service,
    bool? isDateSort,
    bool? isBudgetSort,
    ProfessionalServiceModel? professionalServiceModel,
  }) {
    return ServicesState(
      theStates: theStates ?? this.theStates,
      selfCreatedTaskServiceModel:
          selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
      serviceList: serviceList ?? this.serviceList,
      isServiceListLoaded: isServiceListLoaded ?? this.isServiceListLoaded,
      service: service ?? this.service,
      isDateSort: isDateSort ?? this.isDateSort,
      isBudgetSort: isBudgetSort ?? this.isBudgetSort,
      professionalServiceModel:
          professionalServiceModel ?? this.professionalServiceModel,
    );
  }
}
