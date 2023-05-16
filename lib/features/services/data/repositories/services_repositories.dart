import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class ServicesRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchMyCreatedEntityServiceTask({
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
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchServiceCategoryList(
      [int? categoryId]) async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: 'task/service/list/',
          // url: 'task/service/list/options/',
          query: {
            // 'page': -1,
            'category_id': categoryId,
          },
        );
        return List.from(res as Iterable);
      } else {
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
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchEntityServices({
    String? serviceId,
    String? city,
    int? page,
    List<String>? order,
  }) async {
    var orders = order != null && order.isNotEmpty ? order.join(',') : '';
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          url: kTaskEntityService,
          query: {
            'is_requested': false,
            'page': page,
            'ordering': orders,
            'service': serviceId,
            'city': city,
          },
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: kTaskEntityService,
          query: {
            'is_requested': false,
            'page': page,
            'ordering': orders,
            'service': serviceId,
            'city': city,
          },
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

  Future<Map<String, dynamic>> fetchProfessionalService({
    int? pageNumber,
  }) async {
    try {
      final res = await _dio.getData(
        query: {
          'page': pageNumber ?? 1,
        },
        url: 'task/professional-service/',
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchApplicants({
    required String? id,
  }) async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: 'task/entity/service/applicants/$id/',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: 'task/entity/service/applicants/$id/',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log(
        'aplicant error' + e.toString(),
      );
      rethrow;
    }
  }
}
