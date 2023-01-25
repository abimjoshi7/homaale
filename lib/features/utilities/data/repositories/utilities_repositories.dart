import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class UtilitiesRepositories {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> getInterestsList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/cms/task-category/list/',
        token: CacheHelper.accessToken,
      );
      final map = List<Map<String, dynamic>>.from(res as Iterable);
      return map;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCountriesList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'locale/cms/country/option/',
        token: CacheHelper.accessToken,
      );
      final map = List<Map<String, dynamic>>.from(res as Iterable);
      return map;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCitiesList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'locale/cms/city/options/',
        token: CacheHelper.accessToken,
      );
      final map = List<Map<String, dynamic>>.from(res as Iterable);
      return map;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCurrencyList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'locale/currency/options/',
        token: CacheHelper.accessToken,
      );
      final map = List<Map<String, dynamic>>.from(res as Iterable);
      return map;
    } catch (e) {
      rethrow;
    }
  }
}
