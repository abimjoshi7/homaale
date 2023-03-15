import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';

class ContentClientRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchContentClientStatement({
    required String slug,
  }) async {
    try {
      final x = await _dio.getData(
        url: '/landingpage/content/$slug/',
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
