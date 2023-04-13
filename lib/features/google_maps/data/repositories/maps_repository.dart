import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/google_maps/data/nearby_task_entity_services_req.dart';

class MapsRespository {
  final _dioHelper = DioHelper();

  Future fetchTaskEntityServiceNearMe({required Map<String,dynamic> req}) async {
    try {
      final res = await _dioHelper.getData(
        url: 'task/entity/service/near-me/',
        query: req,
      );

      return res;
    } catch (e) {
      log(e.toString());
    }
  }
}
