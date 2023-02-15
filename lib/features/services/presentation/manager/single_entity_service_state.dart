part of 'single_entity_service_cubit.dart';

abstract class SingleEntityServiceState extends Equatable {
  const SingleEntityServiceState();
}

class SingleEntityServiceInitial extends SingleEntityServiceState {
  @override
  List<Object> get props => [];
}

class SingleEntityServiceLoadSuccess extends SingleEntityServiceState {
  final ServiceModel serviceModel;

  const SingleEntityServiceLoadSuccess(this.serviceModel);
  @override
  List<Object> get props => [
        serviceModel,
      ];
}

class SingleEntityServiceLoadFailure extends SingleEntityServiceState {
  @override
  List<Object> get props => [];
}
