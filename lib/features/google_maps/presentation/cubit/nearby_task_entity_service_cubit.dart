import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_req.dart';
import 'package:cipher/features/google_maps/data/repositories/maps_repository.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:dependencies/dependencies.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'nearby_task_entity_service_state.dart';

class NearbyTaskEntityServiceCubit extends Cubit<NearbyTaskEntityServiceState> {
  final MapsRespository _repository = MapsRespository();
  NearbyTaskEntityServiceCubit() : super(NearbyTaskEntityServiceState());

  Future getNearbyTaskEntityService({
    required LatLng location,
  }) async {
    try {
      emit(state.copyWith(
        theStates: TheStates.initial,
      ));
      final x = await _repository.fetchTaskEntityServiceNearMe(
        req: NearbyTaskEntityServiceReq(
          longitude: location.longitude,
          latitude: location.latitude,
        ).toJson(),
      );
      List<TaskEntityService> taskEntityServiceList = [];
      for (var entity in x!) {
        taskEntityServiceList
            .add(TaskEntityService.fromJson(entity as Map<String, dynamic>));
      }

      emit(
        state.copyWith(
          theStates: TheStates.success,
          nearbyTaskEntityServiceList: taskEntityServiceList,
        ),
      );
    } catch (e) {
      log("map error: $e");
      emit(state.copyWith(
        theStates: TheStates.failure,
        // nearbyTaskEntityServiceList: [],
      ));
    }
  }
}
