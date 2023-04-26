import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/app/api_end_points.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:dependencies/dependencies.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    final options = BaseOptions(
      baseUrl: sandbox,
      connectTimeout: const Duration(
        seconds: 20,
      ),
      receiveTimeout: const Duration(
        seconds: 20,
      ),
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
      if (e.response?.statusCode == 401) {
        await refreshToken();
        getData(
          url: url,
          query: query,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
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
      if (e.response?.statusCode == 401) {
        await refreshToken();
        postData(
          url: url,
          data: data,
        );
      } else {
        log("API request failed: $e");
      }
      //formatting the error message
      // Remove the braces and split the message into an array of strings
      List<String> errorMsgs = e.response!.data
          .toString()
          .replaceAll('{', '')
          .replaceAll('}', '')
          .split(',');
      // Remove the keys from each string in the array
      for (int i = 0; i < errorMsgs.length; i++) {
        errorMsgs[i] = errorMsgs[i].substring(errorMsgs[i].indexOf(':') + 2);
      }

      final String cleanedMsg = errorMsgs
          .join('\n')
          .replaceAll('[', '')
          .replaceAll(']', '')
          .toTitleCase();

      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          (e.response?.statusCode == 400)
              ? cleanedMsg
              : e.response!.data
                  .toString()
                  .toTitleCase()
                  .replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO POST ERROR: ${e.response?.data}');
      rethrow;
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
      if (e.response?.statusCode == 401) {
        await refreshToken().then(
          (value) => getDatawithCredential(
            url: url,
            query: query,
            token: token,
          ),
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );

      log('DIO GET WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postDataWithCredential({
    required dynamic data,
    required String url,
    required String? token,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.post<dynamic>(
        queryParameters: queryParams,
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
      if (e.response?.statusCode == 401) {
        await refreshToken();
        postDataWithCredential(
          url: url,
          data: data,
          token: token,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
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
      if (e.response?.statusCode == 401) {
        await refreshToken();
        patchDataWithCredential(
          url: url,
          data: data,
          token: token,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO PATCH WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> deleteDataWithCredential({
    int? id,
    required String url,
    required String? token,
    String? sid,
  }) async {
    try {
      final response = await dio.delete(
        '$url${id ?? sid}/',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        await refreshToken();
        deleteDataWithCredential(
          url: url,
          id: id,
          token: token,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO PATCH WITH CREDENTIAL ERROR: ${e.response?.data}');
    }
  }

  Future<dynamic> postMultiFormData({
    required String url,
    String? path,
    required String? token,
    List<String>? pathList,
  }) async {
    try {
      FormData formData;
      if (path != null) {
        formData = FormData.fromMap(
          {
            'medias': [
              await MultipartFile.fromFile(
                path,
              ),
            ],
          },
        );
      } else {
        formData = FormData.fromMap({});
        for (var i = 0; i < (pathList?.length ?? 1); i++) {
          formData.files.addAll(
            [
              MapEntry(
                "medias",
                await MultipartFile.fromFile(
                  pathList?[i] ?? "",
                ),
              ),
            ],
          );
        }
      }
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
      if (e.response?.statusCode == 401) {
        await refreshToken();
        postMultiFormData(
          url: url,
          path: path,
          token: token,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO POST MULTI FORM DATA ERROR: ${e.response?.data}');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postFormData({
    required String url,
    required String? token,
    required Map<String, dynamic> map,
  }) async {
    try {
      final formData = FormData.fromMap(map);
      final response = await dio.post<dynamic>(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        await refreshToken();
        postFormData(
          url: url,
          map: map,
          token: token,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
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
      if (e.response?.statusCode == 401) {
        await refreshToken();
        patchFormData(
          url: url,
          map: map,
          token: token,
        );
      } else {
        log("API request failed: $e");
      }
      await CacheHelper.clearCachedData(kErrorLog).whenComplete(
        () async => CacheHelper.setCachedString(
          kErrorLog,
          e.response!.data
              .toString()
              .toTitleCase()
              .replaceAll(RegExp(r'[^\w\s]+'), ''),
        ),
      );
      log('DIO PATCH FORM DATA ERROR: ${e.response?.data}');
    }
  }

  Future<void> refreshToken([String? token]) async {
    try {
      final response = await dio.post(
        "user/token/refresh/",
        data: {
          "refresh": token ?? CacheHelper.refreshToken,
        },
      );
      CacheHelper.accessToken = await response.data['access'] as String?;
      CacheHelper.refreshToken = await response.data['refresh'] as String?;
    } catch (e) {
      await CacheHelper.clearAllCachedData();
      log("Refresh token request failed: $e");
      rethrow;
    }
  }
}
