import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class UserSuspendRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchSuspendedUser({required String id}) async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'user/$id/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
