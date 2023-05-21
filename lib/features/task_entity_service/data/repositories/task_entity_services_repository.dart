import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/api_constants.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/task_entity_service/data/models/req/applicant_model.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/data/models/res/task_entity_service_res.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';

class TaskEntityServiceRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchTaskEntityServices({
    bool? isTask,
    int? page,
    List<String>? order,
    String? serviceId,
    String? city,
  }) async {
    var orders = order != null && order.isNotEmpty ? order.join(',') : '';
    try {
      final req = {
        "is_requested": isTask,
        "page": page,
        "ordering": orders,
        "page_size": kPageSize,
        'service': serviceId,
        'city': city
      };
      if (isTask == null) req.remove("is_requested");
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          url: kTaskEntityService,
          query: req,
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: kTaskEntityService,
          query: req,
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log("Task Entity Services Fetch Error: $e");
      throw Exception("Task Entity Services Fetch Error");
    }
  }

  Future<TaskEntityServiceModel> getTaskEntityServices({
    bool? isTask,
    int? page,
    List<String>? order,
    String? serviceId,
    String? city,
  }) async =>
      await fetchTaskEntityServices(
        isTask: isTask,
        page: page,
        serviceId: serviceId,
        city: city,
        order: order,
      ).then(
        (value) => TaskEntityServiceModel.fromJson(
          value,
        ),
      );

  Future<Map<String, dynamic>> fetchMyTaskEntityService({
    required bool isTask,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kMyTaskEntityServices,
        query: {
          "is_requested": isTask,
        },
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("My Task Entity Service Fetch Error: $e");
      throw Exception("My Task Entity Service Fetch Error");
    }
  }

  Future<SelfCreatedTaskService> getMyTaskEntityService(bool isTask) async =>
      await fetchMyTaskEntityService(isTask: isTask).then(
        (value) => SelfCreatedTaskService.fromJson(
          value,
        ),
      );

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

  Future<Map<String, dynamic>> fetchApplicants({
    required String? id,
  }) async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: '$kApplicantsPath$id/',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: '$kApplicantsPath$id/',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        'Applicants Fetch Error' + e.toString(),
      );
      throw "Applicants Fetch Error";
    }
  }

  Future<ApplicantModel> getApplicants(String id) async =>
      await fetchApplicants(id: id).then(
        (value) => ApplicantModel.fromJson(
          value,
        ),
      );
}
