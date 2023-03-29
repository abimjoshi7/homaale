import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class NotificationRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> getAllNotification() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'notification/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> markNotificationAllRead(int? id) async {
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
