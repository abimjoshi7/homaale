import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/core/constants/google_maps_constants.dart';
import 'package:cipher/core/constants/user_location_constants.dart';
import 'package:cipher/features/google_maps/domain/maps_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'user_location_state.dart';

class UserLocationCubit extends Cubit<UserLocationState> {
  final _repository = MapsRepository();
  UserLocationCubit() : super(UserLocationState());

  Future<void> getUserLocation() async {
    final LatLng? _location = await _repository.fetchCachedUserLocation();
    if (_location != null) {
      await getAddress(_location);
    } else {
      emit(state.copyWith(location: _location ?? kUserLocation));
    }
  }

  Future<void> storeUserLocation(LatLng location) async =>
      await cacheUserLocation(location)
          .then((value) async => await getAddress(location));

  Future<void> getAddress(LatLng? location) async {
    if (location != null) {
      await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      ).then(
        (value) => emit(
          state.copyWith(
            location: location,
            address:
                '${value.first.locality}, ${value.first.administrativeArea}',
          ),
        ),
      );
    }
  }

  Future<void> setTempLocation({required String address}) async {
    try {
      await _repository
          .fetchLocationFromTextAddress(
        address: address,
      )
          .then((value) {
        if (value.isNotEmpty) {
          emit(state.copyWith(
              tempLocation: LatLng(
            value.first.geometry!.location!.lat!,
            value.first.geometry!.location!.lng!,
          )));
        }
      });
    } catch (e) {
      emit(
        state.copyWith(
          theStates: TheStates.failure,
        ),
      );
    }
  }

  void removeTempLocation() {
    emit(state.remove(
      theStates: state.theStates,
      location: state.location,
      address: state.address,
    ));
  }
}
