import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class NotificationRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> getAllNotification(int? page) async {
    try {
      final res = await _dio.getDatawithCredential(
        query: {'page': page},
        url: 'notification/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> markNotificationAllRead() async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {},
        url: 'notification/read/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }
}
