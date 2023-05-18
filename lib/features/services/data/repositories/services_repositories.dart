import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class ServicesRepositories {
  final _dio = DioHelper();

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
}
