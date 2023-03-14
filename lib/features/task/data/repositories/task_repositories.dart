import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/task/data/models/post_task_req.dart';

class TaskRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchMyCreatedEntityServiceTask({
    required bool isTask,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/entity/my-entity-services/',
        query: {
          "is_requested": isTask,
        },
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }

// * List tasks or services by entity service ID
  Future<Map<String, dynamic>> fetchAllTaskList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/entity/service/',
        query: {
          "is_requested": true,
        },
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("All Task List Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchSingleTask({
    required String id,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/entity/service/$id',
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
