part of 'google_maps_bloc.dart';

@immutable
class GoogleMapsEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GoogleMapsSearchQueryInitiated extends GoogleMapsEvent {
  final String query;
  GoogleMapsSearchQueryInitiated({required this.query});
  @override
  List<Object> get props => [query];
}

class GoogleMapsLocationFetchInitiated extends GoogleMapsEvent {
  final String address;
  GoogleMapsLocationFetchInitiated({required this.address});
  @override
  List<Object> get props => [address];
}
