import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/app/api_end_points.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/navigation_constants.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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

    /// Dio interceptors
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print(
            'REQUEST[${options.method}] => PATH: ${options.path} => DATA: ${options.data}');

        if (options.headers.containsKey('requiresAuthorization')) {
          options.headers.remove("requiresAuthorization");
          options.headers
              .addAll({"Authorization": "Bearer ${CacheHelper.accessToken}"});
        }
        return handler.next(options);
      },
      onResponse: (e, handler) {
        print('RESPONSE[${e.statusCode}] => PATH: ${e.requestOptions.path}');
        return handler.next(e);
      },
      onError: (err, handler) async {
        final statusCode = err.response?.statusCode;
        final requestPath = err.requestOptions.path;
        final responseData = err.response?.data;

        print('ERROR[$statusCode] => PATH: $requestPath => MSG: $responseData');

        // Handle specific error status codes
        switch (statusCode) {
          case 400:
            if (responseData is Map<String, dynamic> &&
                responseData.containsKey('non_field_errors')) {
              final nonFieldErrors = responseData['non_field_errors'];
              if (nonFieldErrors is List<dynamic> &&
                  nonFieldErrors.isNotEmpty) {
                final errorMessage = nonFieldErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Password Error: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Password Error: ${nonFieldErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('old_password')) {
              final oldPasswordError = responseData['old_password'];
              if (oldPasswordError is List<dynamic> &&
                  oldPasswordError.isNotEmpty) {
                final errorMessage = oldPasswordError.join('.');
                Fluttertoast.showToast(
                    msg: "Password Error: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Password Error: ${oldPasswordError}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('password')) {
              final passswordErrors = responseData['password'];
              if (passswordErrors is List<dynamic> &&
                  passswordErrors.isNotEmpty) {
                final errorMessage = passswordErrors.join('.');
                // Remove existing cache and add new error msg in cache
                await CacheHelper.clearCachedData(kErrorLog).whenComplete(
                  () async => CacheHelper.setCachedString(
                    kErrorLog,
                    errorMessage.toString(),
                  ),
                );

                return handler.next(err);
              } else {
                // Remove existing cache and add new error msg in cache
                await CacheHelper.clearCachedData(kErrorLog).whenComplete(
                  () async => CacheHelper.setCachedString(
                    kErrorLog,
                    passswordErrors.toString(),
                  ),
                );

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('budget_type')) {
              final budgetTypeErrors = responseData['budget_type'];
              if (budgetTypeErrors is List<dynamic> &&
                  budgetTypeErrors.isNotEmpty) {
                final errorMessage = budgetTypeErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Budget type: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Budget type: ${budgetTypeErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('username')) {
              final usernameErrors = responseData['username'];
              if (usernameErrors is List<dynamic> &&
                  usernameErrors.isNotEmpty) {
                final errorMessage = usernameErrors.join('.');
                // Remove existing cache and add new error msg in cache
                await CacheHelper.clearCachedData(kErrorLog).whenComplete(
                  () async => CacheHelper.setCachedString(
                    kErrorLog,
                    errorMessage.toString(),
                  ),
                );

                return handler.next(err);
              } else {
                // Remove existing cache and add new error msg in cache
                await CacheHelper.clearCachedData(kErrorLog).whenComplete(
                  () async => CacheHelper.setCachedString(
                    kErrorLog,
                    usernameErrors.toString(),
                  ),
                );

                return handler.next(err);
              }
            }
            return handler.next(err);
          case 401:
            // Handle 401 Unauthorized
            try {
              // Make the refresh token API call
              try {
                final dioNew = Dio(options);
                final response = await dioNew.post(
                  "user/token/refresh/",
                  data: {
                    "refresh": CacheHelper.refreshToken,
                  },
                );

                // Update the access and refresh token
                CacheHelper.accessToken =
                    await response.data['access'] as String?;
                CacheHelper.refreshToken =
                    await response.data['refresh'] as String?;
              } catch (_) {
                rethrow;
              }

              // Update the access token in the request headers
              err.requestOptions.headers['Authorization'] =
                  'Bearer ${CacheHelper.accessToken}';

              // Retry the original request
              Response retryResponse =
                  await dio.request(err.requestOptions.path,
                      options: Options(
                        contentType: err.requestOptions.contentType,
                        headers: err.requestOptions.headers,
                        method: err.requestOptions.method,
                      ));

              // Return the retry response
              return handler.resolve(retryResponse);
            } catch (e) {
              print(
                  'OUTSIDE ERROR[$statusCode] => PATH: $requestPath => MSG: $e');

              Navigator.pushNamedAndRemoveUntil(
                navigationKey.currentContext!,
                SignInPage.routeName,
                (route) => false,
              );
              return handler.next(err);
            }
          case 201:
            // Handle 201 Created
            // Your code here
            break;
          case 403:
            // Handle 403 Forbidden
            // Your code here
            break;
          case 500:
            // Handle 500 Internal Server Error
            // Your code here
            break;
          default:
            // Handle other error status codes
            // Your code here
            break;
        }
      },
    ));
  }

  Future<dynamic> getData({
    Map<String, dynamic>? query,
    required String url,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        url,
        queryParameters: query,
      );
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
    } on DioError catch (_) {
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
    } on DioError catch (_) {
      rethrow;
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
            'requiresAuthorization': 'true',
            'Content-Type': 'application/json',
          },
        ),
      );
      return response.data;
    } on DioError catch (_) {
      rethrow;
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
    } on DioError catch (_) {
      rethrow;
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
    } on DioError catch (_) {
      rethrow;
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
    } on DioError catch (_) {
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
    } on DioError catch (_) {
      rethrow;
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
    } on DioError catch (_) {
      rethrow;
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
