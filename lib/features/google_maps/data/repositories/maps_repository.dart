import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/third_party_credentials.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class MapsRepositories {
  final _dioHelper = DioHelper();

  Future<Map<String, dynamic>> fetchTaskEntityServiceNearMe(
      {required Map<String, dynamic> req}) async {
    try {
      final res = await _dioHelper.getDatawithCredential(
        url: kTaskEntityService,
        query: req,
        token: CacheHelper.accessToken,
      );

      return res as Map<String, dynamic>;
    } catch (e) {
      log("maps log test" + e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getMapAutoCompleteQueries(
      {required String query}) async {
    try {
      final res = await _dioHelper.getMapDataWithCredential(
          url: "place/queryautocomplete/json",
          query: {
            "input": query,
            "key": mapsAPIKey,
          });
      return res as Map<String, dynamic>;
    } catch (e) {
      log("maps auto correct test" + e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getLocationFromTextAddress(
      {required String address}) async {
    try {
      final res = await _dioHelper
          .getMapDataWithCredential(url: "geocode/json", query: {
        "address": address,
        "key": mapsAPIKey,
      });
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Maps Geocode Test" + e.toString());
      rethrow;
    }
  }
}
