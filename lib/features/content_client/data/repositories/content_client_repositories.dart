import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
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

  Future<String?> fetchCachedContentClientStatement({
    required String storageKey,
  }) async {
    try {
      final x = await CacheHelper.getCachedString(storageKey);

      return x;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> storeCachedContentClientStatement({
    required String storageKey,
    required String storageKeyValue,
  }) async {
    try {
      await CacheHelper.setCachedString(storageKey, storageKeyValue);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
