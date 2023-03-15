part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final TheStates? theStates;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  final AddServiceRes? addServiceRes;
  final List<ServiceList>? list;

  const ServicesState({
    this.theStates,
    this.selfCreatedTaskServiceModel,
    this.addServiceRes,
    this.list,
  });

  @override
  List<Object?> get props => [
        theStates,
        selfCreatedTaskServiceModel,
        addServiceRes,
        list,
      ];

  ServicesState copyWith({
    TheStates? theStates,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
    AddServiceRes? addServiceRes,
    List<ServiceList>? list,
  }) {
    return ServicesState(
      theStates: theStates ?? this.theStates,
      selfCreatedTaskServiceModel:
          selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
      addServiceRes: addServiceRes ?? this.addServiceRes,
      list: list ?? this.list,
    );
  }
}
