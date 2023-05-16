import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';

import '../../../../../../core/cache/cache_helper.dart';

class UserDeactiveRepository {
  final _dio = DioHelper();
  Future<Map<String, dynamic>> PostUserDeactiveAction(
      {required String reason}) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'reason': reason},
        url: 'user/deactivate/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("de-active details error: $e");
      rethrow;
    }
  }
}
