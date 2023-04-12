import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class ChatRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchChatPersonDetails({
    required String id,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'user/chat/$id/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Person details in chat error: $e");
      rethrow;
    }
  }
}
