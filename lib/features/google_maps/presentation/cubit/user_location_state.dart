part of 'user_location_cubit.dart';

@immutable
class UserLocationState extends Equatable {
  final TheStates theStates;
  final LatLng? location;
  final String? address;
  final LatLng? tempLocation;
  UserLocationState({
    this.theStates = TheStates.initial,
    this.location,
    this.address,
    this.tempLocation,
  });

  UserLocationState remove({
    TheStates? theStates,
    LatLng? location,
    String? address,
  }) {
    return UserLocationState(
     theStates: theStates ?? this.theStates,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }

  UserLocationState copyWith({
    TheStates? theStates,
    LatLng? location,
    String? address,
    LatLng? tempLocation,
  }) {
    return UserLocationState(
      theStates: theStates ?? this.theStates,
      location: location ?? this.location,
      address: address ?? this.address,
      tempLocation: tempLocation ?? this.tempLocation,
    );
  }

  @override
  List<Object?> get props => [theStates, location, address, tempLocation];
}
