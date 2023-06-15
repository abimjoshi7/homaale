import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class TaskerRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchAllTaskers({int? page}) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          query: {
            "page": page,
            "page_size": 10,
          },
          url: 'tasker/',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          query: {
            "page": page,
            "page_size": 10,
          },
          url: 'tasker/',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log("All Tasker Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchSingleTasker({required String id}) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          url: 'tasker/profile/$id',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: 'tasker/profile/$id',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      log("Single Tasker Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getSingleTaskerService({
    required String createdBy,
  }) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          query: {
            'created_by': createdBy,
            'is_requested': false,
          },
          url: 'task/entity/service/',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          query: {
            'created_by': createdBy,
            'is_requested': false,
          },
          url: 'task/entity/service/',
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

  Future<Map<String, dynamic>> getSingleTaskerTask({
    required String createdBy,
  }) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          query: {
            'created_by': createdBy,
            'is_requested': true,
          },
          url: 'task/entity/service/',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          query: {
            'created_by': createdBy,
            'is_requested': true,
          },
          url: 'task/entity/service/',
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

  Future<Map<String, dynamic>> getSingleTaskerReviews({
    required String userId,
    String? rating,
    String? order,
  }) async {
    try {
      if (!CacheHelper.isLoggedIn) {
        final res = await _dio.getData(
          url: 'task/rating/list/$userId/?page=1&rating=${rating ?? ''}&ordering=${order ?? ''}',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: 'task/rating/list/$userId/?page=1&rating=${rating ?? ''}&ordering=${order ?? ''}',
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
