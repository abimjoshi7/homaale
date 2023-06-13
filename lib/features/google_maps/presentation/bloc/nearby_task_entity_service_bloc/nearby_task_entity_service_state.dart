// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'nearby_task_entity_service_bloc.dart';

@immutable
class NearbyTaskEntityServiceState extends Equatable {
  final TheStates? theStates;
  final List<TaskEntityService>? nearbyTaskEntityServiceList;
  final List<TaskEntityService>? activeList;
  final LatLng? location;
  final NearbyTaskEntityServiceReq? request;
  NearbyTaskEntityServiceState({
    this.theStates = TheStates.initial,
    this.nearbyTaskEntityServiceList,
    this.activeList,
    this.location,
    this.request,
  });
  NearbyTaskEntityServiceState copyWith({
    TheStates? theStates,
    List<TaskEntityService>? nearbyTaskEntityServiceList,
    List<TaskEntityService>? activeList,
    LatLng? location,
    NearbyTaskEntityServiceReq? request,
  }) {
    return NearbyTaskEntityServiceState(
      theStates: theStates ?? this.theStates,
      nearbyTaskEntityServiceList:
          nearbyTaskEntityServiceList ?? this.nearbyTaskEntityServiceList,
      activeList: activeList ?? this.activeList,
      location: location ?? this.location,
      request: request ?? this.request,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      nearbyTaskEntityServiceList,
      activeList,
      location,
      request,
    ];
  }
}
