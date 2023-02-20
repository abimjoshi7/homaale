import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/task/data/models/post_task_req.dart';

class TaskRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> postTask(
    PostTaskReq postTaskReq,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: postTaskReq.toJson(),
        url: 'task/entity/service/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
