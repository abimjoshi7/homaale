// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'user_location_cubit.dart';

@immutable
class UserLocationState extends Equatable {
  final LatLng? location;
  final String? address;
  UserLocationState({
    this.location,
    this.address,
  });

  UserLocationState copyWith({
    LatLng? location,
    String? address,
  }) {
    return UserLocationState(
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }

  @override
  List<Object?> get props => [location, address];
}
