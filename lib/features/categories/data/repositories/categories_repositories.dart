import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class CategoriesRepositories {
  final _dio = DioHelper();

  Future<dynamic> fetchCategories() async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await _dio.getDatawithCredential(
        url: 'task/cms/hero-category/',
        token: token ?? tokenP,
      );
      return x;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
