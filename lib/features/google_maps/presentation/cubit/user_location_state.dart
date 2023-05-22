// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_location_cubit.dart';

@immutable
class UserLocationState extends Equatable {
  final LatLng? location;
  UserLocationState({
    this.location,
  });

  UserLocationState copyWith({
    LatLng? location,
  }) {
    return UserLocationState(
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [location];
}
