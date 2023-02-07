part of 'single_entity_service_cubit.dart';

abstract class SingleEntityServiceState extends Equatable {
  const SingleEntityServiceState();
}

class SingleEntityServiceInitial extends SingleEntityServiceState {
  @override
  List<Object> get props => [];
}

class SingleEntityServiceLoadSuccess extends SingleEntityServiceState {
  final Result result;

  const SingleEntityServiceLoadSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class SingleEntityServiceLoadFailure extends SingleEntityServiceState {
  @override
  List<Object> get props => [];
}
