// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'services_bloc.dart';

class ServiceState extends Equatable {
  final TheStates? theStates;
  final SelfCreatedTaskService? selfCreatedTaskServiceModel;
  const ServiceState({
    this.theStates,
    this.selfCreatedTaskServiceModel,
  });

  @override
  List<Object?> get props => [
        theStates,
        selfCreatedTaskServiceModel,
      ];

  ServiceState copyWith({
    TheStates? theStates,
    SelfCreatedTaskService? selfCreatedTaskServiceModel,
  }) {
    return ServiceState(
      theStates: theStates ?? this.theStates,
      selfCreatedTaskServiceModel:
          selfCreatedTaskServiceModel ?? this.selfCreatedTaskServiceModel,
    );
  }
}

abstract class ServicesState extends Equatable {
  const ServicesState();
}

class ServicesInitial extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesLoading extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesLoadSuccess extends ServicesState {
  final List<ServiceList> list;

  const ServicesLoadSuccess(this.list);
  @override
  List<Object> get props => [list];
}

class ServicesLoadFailure extends ServicesState {
  @override
  List<Object> get props => [];
}

// class MyCreatedServicesLoadSuccess extends ServicesState {
//   final MyCreatedServicesRes list;

//   const MyCreatedServicesLoadSuccess(this.list);
//   @override
//   List<Object> get props => [list];
// }

class MyCreatedServicesLoadFailure extends ServicesState {
  @override
  List<Object> get props => [];
}

class ServicesAddSuccess extends ServicesState {
  final AddServiceRes addServiceRes;

  const ServicesAddSuccess(this.addServiceRes);
  @override
  List<Object> get props => [addServiceRes];
}

class ServicesAddFailure extends ServicesState {
  @override
  List<Object> get props => [];
}
