import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/categories/data/models/category.dart';

class CategoriesRepositories {
  final _dio = DioHelper();

  Future<List<Category>> fetchCategoriesList() async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final x = await _dio.getData(
          url: 'task/cms/task-category/list/',
        );
        return (x as List<dynamic>)
            .map(
              (e) => Category.fromMap(e as Map<String, dynamic>),
            )
            .toList();
      } else {
        final x = await _dio.getDatawithCredential(
          url: 'task/cms/task-category/list/',
          token: CacheHelper.accessToken,
        );
        return (x as List<dynamic>)
            .map(
              (e) => Category.fromMap(e as Map<String, dynamic>),
            )
            .toList();
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<List<dynamic>> fetchTopCategory() async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          query: {
            'page': -1,
          },
          url: 'task/top-categories/',
        );
        return res as List<dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          query: {
            'page': -1,
          },
          url: 'task/top-categories/',
          token: CacheHelper.accessToken,
        );
        return res as List<dynamic>;
      }
    } catch (e) {
      log('top category error' + e.toString());
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchNestedCategory() async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: 'task/task-category/nested/',
        );
        return List<Map<String, dynamic>>.from(res as Iterable);
      } else {
        final res = await _dio.getDatawithCredential(
          url: 'task/task-category/nested/',
          token: CacheHelper.accessToken,
        );
        return List<Map<String, dynamic>>.from(res as Iterable);
      }
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
