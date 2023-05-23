import 'package:cipher/features/google_maps/domain/maps_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'user_location_state.dart';

class UserLocationCubit extends Cubit<UserLocationState> {
  final _repository = MapsRepository();
  UserLocationCubit() : super(UserLocationState());

  Future<void> getUserLocation() async {
    final LatLng _location = await _repository.fetchCachedUserLocation();
    emit(state.copyWith(
      location: _location,
    ));
  }
}
