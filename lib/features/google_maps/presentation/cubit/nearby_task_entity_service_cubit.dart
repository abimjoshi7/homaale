import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_req.dart';
import 'package:cipher/features/google_maps/data/repositories/maps_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'nearby_task_entity_service_state.dart';

class NearbyTaskEntityServiceCubit extends Cubit<NearbyTaskEntityServiceState> {
  final MapsRespository _repository = MapsRespository();
  NearbyTaskEntityServiceCubit() : super(NearbyTaskEntityServiceState());

  Future getNearbyTaskEntityService({
    required LatLng location,
    double radius = 10000,
  }) async {
    try {
      final x = await _repository.fetchTaskEntityServiceNearMe(
        req: {
          "latitude": 27.7172,
          "longitude": 85.3240,
          "radius": 10000,
        },
      );
      log('maps services test: $x');

      emit(
        state.copyWith(
          theStates: TheStates.success,
        ),
      );
    } catch (e) {
      log("map error: $e");
      emit(state.copyWith(
        theStates: TheStates.failure,
      ));
    }
  }
}
