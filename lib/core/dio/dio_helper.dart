// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/app/api_end_points.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    final options = BaseOptions(
      baseUrl: baseIPSecondary,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      receiveDataWhenStatusError: true,
    );

    dio = Dio(options);
  }

  Future<dynamic> getData({
    Map<String, dynamic>? query,
    required String url,
  }) async {
    try {
      final response = await dio.get<dynamic>(url, queryParameters: query);
      return response.data;
    } on DioError catch (e) {
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data.toString().replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );

      log('DIO GET ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postData({
    required dynamic data,
    required String url,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        url,
        data: jsonEncode(data),
      );
      return response.data;
    } on DioError catch (e) {
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data.toString().replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO POST ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postDataWithCredential({
    required dynamic data,
    required String url,
    required String token,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        url,
        data: jsonEncode(data),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data.toString().replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO POST ERROR: ${e.response?.data}');
    }
  }
}
