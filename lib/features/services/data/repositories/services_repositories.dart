import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/services/data/models/add_service_req.dart';

class ServicesRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchMyCreatedService() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/entity/my-entity-services/',
        query: {
          "is_requested": false,
        },
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchSingleService({
    required String serviceId,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/entity/service/$serviceId',
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

  Future<List<Map<String, dynamic>>> fetchServices([int? categoryId]) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/service/list/',
        // url: 'task/service/list/options/',
        query: {
          // 'page': -1,
          'category_id': categoryId,
        },
        token: CacheHelper.accessToken,
      );
      return List.from(res as Iterable);
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchEntityServices([
    String? serviceId,
  ]) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/entity/service/',
        query: {
          'service': serviceId,
          'is_requested': false,
        },
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

  Future<Map<String, dynamic>> addEntityService(
    AddServiceReq addServiceReq,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: addServiceReq.toJson(),
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

  Future<Map<String, dynamic>> fetchProfessionalService({
    int? pageNumber = 1,
    int? pageSize = 10,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        query: {
          'page': pageNumber,
          'page_size': pageSize,
        },
        url: 'task/professional-service/',
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
