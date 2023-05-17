// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'nearby_task_entity_service_cubit.dart';

@immutable
class NearbyTaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final List<TaskEntityService>? nearbyTaskEntityServiceList;
  final NearbyTaskEntityServiceReq? request;
  NearbyTaskEntityServiceState({
    this.theStates = TheStates.initial,
    this.nearbyTaskEntityServiceList,
    this.request,
  });
  NearbyTaskEntityServiceState copyWith({
    TheStates? theStates,
    List<TaskEntityService>? nearbyTaskEntityServiceList,
    NearbyTaskEntityServiceReq? request,
    bool? isViewMapOnly,
  }) {
    return NearbyTaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      nearbyTaskEntityServiceList:
          nearbyTaskEntityServiceList ?? this.nearbyTaskEntityServiceList,
      request: request ?? this.request,
    );
  }

  @override
  List<Object?> get props =>
      [theStates, nearbyTaskEntityServiceList, request];
}
