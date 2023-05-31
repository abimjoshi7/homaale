part of 'services_bloc.dart';

class ServicesState extends Equatable {
  final TheStates? theStates;
  final List<ServiceList>? serviceList;
  final bool? isServiceListLoaded;
  final ProfessionalServiceModel? professionalServiceModel;

  const ServicesState({
    this.theStates = TheStates.initial,
    this.serviceList = const [],
    this.isServiceListLoaded = false,
    this.professionalServiceModel = const ProfessionalServiceModel(),
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      serviceList,
      isServiceListLoaded,
      professionalServiceModel,
    ];
  }

  ServicesState copyWith({
    TheStates? theStates,
    List<ServiceList>? serviceList,
    bool? isServiceListLoaded,
    ProfessionalServiceModel? professionalServiceModel,
  }) {
    return ServicesState(
      theStates: theStates ?? this.theStates,
      serviceList: serviceList ?? this.serviceList,
      isServiceListLoaded: isServiceListLoaded ?? this.isServiceListLoaded,
      professionalServiceModel:
          professionalServiceModel ?? this.professionalServiceModel,
    );
  }
}
