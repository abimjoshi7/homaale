import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_req.dart';
import 'package:cipher/features/google_maps/domain/maps_repository.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:dependencies/dependencies.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
part 'nearby_task_entity_service_event.dart';
part 'nearby_task_entity_service_state.dart';

class NearbyTaskEntityServiceBloc
    extends Bloc<NearbyTaskEntityServiceEvent, NearbyTaskEntityServiceState> {
  final MapsRepository _repository = MapsRepository();
  NearbyTaskEntityServiceBloc() : super(NearbyTaskEntityServiceState()) {
    on<NearbyTaskEntityServiceSelected>((event, emit) async {
      try {
        emit(state.copyWith(
          theStates: TheStates.loading,
        ));
        if (state.nearbyTaskEntityServiceList == null) {
          await _repository
              .getNearbyTaskEntityService(location: event.location)
              .then((value) {
            if (value.result!.isNotEmpty) {
              final activeList = _repository.filterTaskEntityService(
                value.result!,
                event.slug,
              );
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  activeList: activeList,
                ),
              );
            }
          });
        }
        if (state.nearbyTaskEntityServiceList != null) {
          final activeList = _repository.filterTaskEntityService(
              state.nearbyTaskEntityServiceList!, event.slug);
          emit(
            state.copyWith(
              theStates: TheStates.success,
              activeList: activeList,
            ),
          );
        }
      } catch (e) {
        log("map error: $e");
        emit(state.copyWith(
          theStates: TheStates.failure,
          nearbyTaskEntityServiceList: [],
        ));
      }
    });
  }
}
