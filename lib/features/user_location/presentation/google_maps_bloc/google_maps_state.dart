part of 'google_maps_bloc.dart';

@immutable
class GoogleMapsState extends Equatable {
  final TheStates theStates;
  final List<MapsQueryAutoCompleteRes> autoCompleteQueries;
  final LatLng? tempLocation;
  GoogleMapsState({
    this.theStates = TheStates.initial,
    this.autoCompleteQueries = const [],
    this.tempLocation,
  });
  @override
  List<Object?> get props => [theStates, autoCompleteQueries, tempLocation];

  GoogleMapsState copyWith({
    TheStates? theStates,
    List<MapsQueryAutoCompleteRes>? autoCompleteQueries,
    LatLng? tempLocation,
  }) {
    return GoogleMapsState(
      theStates: theStates ?? this.theStates,
      autoCompleteQueries: autoCompleteQueries ?? this.autoCompleteQueries,
      tempLocation: tempLocation ?? this.tempLocation,
    );
  }
}
