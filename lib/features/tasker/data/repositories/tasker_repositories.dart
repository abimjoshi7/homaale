import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class TaskerRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchAllTaskers() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'tasker/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("All Tasker Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchSingleTasker({required String id}) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'tasker/profile/$id',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Single Tasker Fetch Error: $e");
      rethrow;
    }
  }
}
