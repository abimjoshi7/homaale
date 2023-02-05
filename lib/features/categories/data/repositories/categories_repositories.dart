import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/categories/data/models/category.dart';

class CategoriesRepositories {
  final _dio = DioHelper();

  Future<List<Category>> fetchCategoriesList() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'task/cms/task-category/list/',
        token: CacheHelper.accessToken,
      );
      return (x as List<dynamic>)
          .map(
            (e) => Category.fromMap(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchHeroCategory() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/hero-category/',
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

  Future<List<Map<String, dynamic>>> fetchNestedCategory() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/task-category/nested/',
        token: CacheHelper.accessToken,
      );
      return List<Map<String, dynamic>>.from(res as Iterable);

    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
