import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/task/data/models/apply_task_req.dart';

class TaskRepositories {
  final _dio = DioHelper();

// // * List tasks or services by entity service ID
//   Future<Map<String, dynamic>> fetchAllTaskList({
//     int? page,
//     List<String>? order,
//     String? serviceId,
//     String? city,
//   }) async {
//     var orders = order != null && order.isNotEmpty ? order.join(',') : '';
//     try {
//       if (!CacheHelper.isLoggedIn) {
//         final res = await _dio.getData(
//           url: kTaskEntityService,
//           query: {
//             "is_requested": true,
//             "page": page,
//             "ordering": orders,
//             "page_size": 10,
//             'service': serviceId,
//             'city': city
//           },
//         );
//         return res as Map<String, dynamic>;
//       } else {
//         final res = await _dio.getDatawithCredential(
//           url: 'task/entity/service/',
//           query: {
//             "is_requested": true,
//             "page": page,
//             "ordering": orders,
//             "page_size": 10,
//             'service': serviceId,
//             'city': city
//           },
//           token: CacheHelper.accessToken,
//         );
//         return res as Map<String, dynamic>;
//       }
//     } catch (e) {
//       log("All Task List Fetch Error: $e");
//       rethrow;
//     }
//   }

  Future<Map<String, dynamic>> bookTask(
    ApplyTaskReq applyTaskReq,
  ) async {
    try {
      final data = applyTaskReq.toJson();

      final res = await _dio.postDataWithCredential(
        data: data,
        url: 'task/entity/service-booking/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> singleTaskAppliedCount(
      {required String id}) async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: 'task/entity/service/tasker-count/$id',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: 'task/entity/service/tasker-count/$id',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
