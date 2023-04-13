// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'nearby_task_entity_service_cubit.dart';

@immutable
class NearbyTaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final NearbyTaskEntityServiceReq? request;
  NearbyTaskEntityServiceState({
    this.theStates = TheStates.initial,
    this.request,
  });
  NearbyTaskEntityServiceState copyWith({
    TheStates? theStates,
    NearbyTaskEntityServiceReq? request,
  }) {
    return NearbyTaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      request: request ?? this.request,
    );
  }

  @override
  List<Object?> get props => [theStates, request];
}
