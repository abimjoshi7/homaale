import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_response.dart';

class MapsRespository {
  final _dioHelper = DioHelper();

  Future<NearbyTaskEntityServiceResponseDTO> fetchTaskEntityServiceNearMe(
      {required Map<String, dynamic> req}) async {
    try {
      final res = await _dioHelper.getDatawithCredential(
        url: kTaskEntityService,
        query: {
          "near_by": true,
          "city": "Kathmandu",
          "country": "Nepal",
          "latitude": 27.7172,
          "longitude": 85.3240,
          "radius": 10000,
        },
        token: CacheHelper.accessToken,
      );
      
      return NearbyTaskEntityServiceResponseDTO.fromJson(
          res as Map<String, dynamic>);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
