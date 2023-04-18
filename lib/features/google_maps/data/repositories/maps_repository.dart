import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';

class MapsRespository {
  final _dioHelper = DioHelper();

  Future<List<dynamic>?> fetchTaskEntityServiceNearMe(
      {required Map<String, dynamic> req}) async {
    try {
      final res = await _dioHelper.getData(
        url: 'task/entity/service/near-me/',
        query: req,
      );
      if (res != null) {
        return res["result"] as List<dynamic>;
      }
      return null;
    } catch (e) {
      log(e.toString());
    }
  }
}
