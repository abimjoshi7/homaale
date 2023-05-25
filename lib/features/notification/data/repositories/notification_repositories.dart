import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/notification/data/models/all_notification_list.dart';

class NotificationRepositories {
  final _dio = DioHelper();

  Future<AllNotificationList> getAllNotification([int startIndex = 1]) async {
    try {
      final res = await _dio.getDatawithCredential(
        query: {'page': startIndex},
        url: 'notification/',
        token: CacheHelper.accessToken,
      );
      return AllNotificationList.fromJson(res as Map<String, dynamic>);
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
