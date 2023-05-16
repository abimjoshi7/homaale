import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/api_constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/data/models/res/task_entity_service_res.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';

class TaskEntityServiceRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> createTaskEntityService({
    required TaskEntityServiceReq taskEntityServiceReq,
  }) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: taskEntityServiceReq.toJson(),
        url: kTaskEntityService,
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Post TES error: $e");
      throw Exception("POST TES ERROR");
    }
  }

  Future<TaskEntityServiceRes> postTaskEntityService(
    TaskEntityServiceReq req,
  ) async =>
      await createTaskEntityService(
        taskEntityServiceReq: req,
      )
          .then(
            (value) => TaskEntityServiceRes.fromJson(
              value,
            ),
          )
          .onError(
            (error, stackTrace) => throw Exception(
              error,
            ),
          );

  Future<Map<String, dynamic>> fetchSingleTaskEntityService({
    required String serviceId,
  }) async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: '$kTaskEntityService$serviceId',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: '$kTaskEntityService$serviceId',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        "Single Task Entity Service Fetch Error:" + e.toString(),
      );
      throw Exception("Single Task Entity Service Fetch Error");
    }
  }

  Future<TaskEntityService> getSingleTaskEntityService(String id) async =>
      await fetchSingleTaskEntityService(serviceId: id).then(
        (value) => TaskEntityService.fromJson(
          value,
        ),
      );

  Future editTaskEntityService(
    String id,
    TaskEntityServiceReq req,
  ) async {
    try {
      await _dio.patchDataWithCredential(
        data: req.toJson(),
        url: kTaskEntityService + "$id/",
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log("Edit TES error: $e");
      rethrow;
    }
  }

  Future deleteTaskEntityService(
    String id,
  ) async {
    try {
      await _dio.deleteDataWithCredential(
        sid: id,
        url: kTaskEntityService,
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log("Delete TES error: $e");
      rethrow;
    }
  }
}
