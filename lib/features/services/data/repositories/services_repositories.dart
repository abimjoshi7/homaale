import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class ServicesRepositories {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> fetchServices([int? categoryId]) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/service/list/',
        query: {
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
}
