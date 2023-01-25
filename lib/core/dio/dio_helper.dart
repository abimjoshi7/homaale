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
      baseUrl: sandbox,
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

  Future<dynamic> getDatawithCredential({
    Map<String, dynamic>? query,
    required String url,
    String? token,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        url,
        queryParameters: query,
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

      log('DIO GET WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postDataWithCredential({
    required dynamic data,
    required String url,
    required String? token,
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
      log('DIO POST WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> patchDataWithCredential({
    required Map<String, dynamic> data,
    required String url,
    required String? token,
  }) async {
    try {
      final response = await dio.patch(
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
      log('DIO PATCH WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> deleteDataWithCredential({
    required int id,
    required String url,
    required String? token,
  }) async {
    try {
      final response = await dio.delete(
        '$url$id/',
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
      log('DIO PATCH WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postMultiFormData({
    required String url,
    String? path,
    required String? token,
  }) async {
    try {
      final formData = FormData.fromMap(
        {
          'medias': [await MultipartFile.fromFile(path!)],
        },
      );

      final response = await dio.post<dynamic>(
        url,
        data: formData,
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
      log('DIO POST MULTI FORM DATA ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postFormData({
    required String url,
    required String? token,
    required Map<String, dynamic> map,
  }) async {
    try {
      final formData = FormData.fromMap(
        map,
      );
      final response = await dio.post<dynamic>(
        url,
        data: formData,
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
      log('DIO POST FORM DATA ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> patchFormData({
    required String url,
    required String? token,
    required Map<String, dynamic> map,
  }) async {
    try {
      final formData = FormData.fromMap(
        map,
      );
      final response = await dio.patch(
        url,
        data: formData,
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
      log('DIO PATCH FORM DATA ERROR: ${e.response?.data}');
    }
  }
}
