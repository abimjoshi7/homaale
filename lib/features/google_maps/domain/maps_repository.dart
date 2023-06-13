import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/features/google_maps/data/maps_geocode_location_res.dart';
import 'package:cipher/features/google_maps/data/maps_query_auto_complete_res.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_req.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_response.dart';
import 'package:cipher/features/google_maps/data/repositories/maps_repository.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsRepository {
  final _repository = MapsRepositories();
  final LatLng _center = const LatLng(27.7172, 85.3240);
  String kCurrentLocation = "CurrentUserLocation";

  List<TaskEntityService> filterTaskEntityService(
      List<TaskEntityService> nearbyTaskEntityServiceList,
      MapFilterStatus status) {
    if (status == MapFilterStatus.service || status == MapFilterStatus.task) {
      return nearbyTaskEntityServiceList
          .where((element) =>
              element.isRequested == (status == MapFilterStatus.service)
                  ? false
                  : true)
          .toList();
    }
    return nearbyTaskEntityServiceList;
  }

  Future<NearbyTaskEntityServiceResponseDTO> getNearbyTaskEntityService(
      {required LatLng location}) async {
    final x = await _repository.fetchTaskEntityServiceNearMe(
      req: NearbyTaskEntityServiceReq(
        longitude: location.longitude,
        latitude: location.latitude,
      ).toJson(),
    );
    return NearbyTaskEntityServiceResponseDTO.fromJson(x);
  }

  Future<LatLng?> fetchCachedUserLocation() async {
    final LatLng? _location =
        await CacheHelper.getCachedString(kCurrentLocation).then((value) {
      if (value != null) {
        final position = LatLng.fromJson(jsonDecode(value)) as LatLng;
        return position;
      }
      return null;
    });
    return _location;
  }

  Future<List<MapsQueryAutoCompleteRes>> fetchMapAutoCompleteQueries(
      {required String query}) async {
    final x = await _repository.getMapAutoCompleteQueries(query: query);
    if (x["status"] == "OK") {
      return (x["predictions"] as List)
          .map((e) =>
              MapsQueryAutoCompleteRes.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<List<MapsGeocodeLocationRes>> fetchLocationFromTextAddress(
      {required String address}) async {
    final x = await _repository.getLocationFromTextAddress(address: address);
    if (x["status"] == "OK") {
      return (x["results"] as List)
          .map(
            (e) => MapsGeocodeLocationRes.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }
    return [];
  }
}
