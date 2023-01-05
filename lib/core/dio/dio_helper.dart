// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/api_service.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioHelper {
  static late Dio dio;
  final storage = const FlutterSecureStorage();

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
      await storage.delete(key: kErrorLog).whenComplete(
            () async => storage.write(
              key: kErrorLog,
              value: e.response?.data
                  .toString()
                  .replaceAll(RegExp(r'[^\w\s]+'), ''),
            ),
          );

      log('DIO GET ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postData({
    dynamic data,
    required String url,
  }) async {
    try {
      final response = await dio.post<dynamic>(url, data: data);
      return response.data;
    } on DioError catch (e) {
      await storage.delete(key: kErrorLog).whenComplete(
            () async => storage.write(
              key: kErrorLog,
              value: e.response?.data
                  .toString()
                  .replaceAll(RegExp(r'[^\w\s]+'), ''),
            ),
          );
      log('DIO POST ERROR: ${e.response?.data}');
    }
  }
}
