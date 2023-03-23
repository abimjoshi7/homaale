part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final TheStates? theStates;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  final AddServiceRes? addServiceRes;
  final List<ServiceList>? serviceList;
  final bool? isServiceListLoaded;

  const ServicesState({
    this.theStates = TheStates.initial,
    this.selfCreatedTaskServiceModel,
    this.addServiceRes,
    this.serviceList,
    this.isServiceListLoaded = false,
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      selfCreatedTaskServiceModel,
      addServiceRes,
      serviceList,
      isServiceListLoaded,
    ];
  }

  ServicesState copyWith({
    TheStates? theStates,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
    AddServiceRes? addServiceRes,
    List<ServiceList>? serviceList,
    bool? isServiceListLoaded,
  }) {
    return ServicesState(
      theStates: theStates ?? this.theStates,
      selfCreatedTaskServiceModel:
          selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
      addServiceRes: addServiceRes ?? this.addServiceRes,
      serviceList: serviceList ?? this.serviceList,
      isServiceListLoaded: isServiceListLoaded ?? this.isServiceListLoaded,
    );
  }
}
