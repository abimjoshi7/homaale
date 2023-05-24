// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'nearby_task_entity_service_bloc.dart';

@immutable
abstract class NearbyTaskEntityServiceEvent extends Equatable {}

class NearbyTaskEntityServiceSelected extends NearbyTaskEntityServiceEvent {
  final LatLng location;
  final MapFilterStatus slug;
  NearbyTaskEntityServiceSelected({
    required this.location,
    required this.slug,
  });
  @override
  List<Object?> get props => [location, slug];
}
