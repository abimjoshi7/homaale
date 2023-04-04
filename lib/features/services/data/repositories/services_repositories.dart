import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class ServicesRepositories {
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

  Future<List<Map<String, dynamic>>> fetchServiceCategoryList([int? categoryId]) async {
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
    int? page,
    String? order,
  }) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          url: 'task/entity/service/',
          query: {
            'is_requested': false,
            'page': page,
            'ordering': order,
          },
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: 'task/entity/service/',
          query: {
            'is_requested': false,
            'page': page,
            'ordering': order,
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

  // Future<Map<String, dynamic>> createTaskEntityService(
  //   AddServiceReq addServiceReq,
  // ) async {
  //   try {
  //     final res = await _dio.postDataWithCredential(
  //       data: addServiceReq.toJson(),
  //       url: 'task/entity/service/',
  //       token: CacheHelper.accessToken,
  //     );
  //     return res as Map<String, dynamic>;
  //   } catch (e) {
  //     log(
  //       e.toString(),
  //     );
  //     rethrow;
  //   }
  // }

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
        e.toString(),
      );
      rethrow;
    }
  }
}
