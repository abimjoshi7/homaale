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
  static late Dio dioGoogleMaps;

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
    dioGoogleMaps = Dio(
      options.copyWith(baseUrl: googleMapsUrl),
    );
    dio = Dio(options);

    /// Dio interceptors
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print(
            'REQUEST[${options.method}] => PATH: ${options.path} => DATA: ${options.data ?? options.queryParameters}');

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
              if (nonFieldErrors is List<dynamic> && nonFieldErrors.isNotEmpty) {
                final errorMessage = nonFieldErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Error: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Error: ${nonFieldErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('booking')) {
              final bookingError = responseData['booking'];
              if (bookingError is List<dynamic> && bookingError.isNotEmpty) {
                final errorMessage = bookingError.first.join('.');
                Fluttertoast.showToast(
                    msg: "Booking Error: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Booking Error: ${bookingError}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('issued_date')) {
              final issuedDateError = responseData['issued_date'];
              if (issuedDateError is List<dynamic> && issuedDateError.isNotEmpty) {
                final errorMessage = issuedDateError.join('.');
                Fluttertoast.showToast(
                    msg: "Issued Date Error: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Issued Date Error: ${issuedDateError}",
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
              if (oldPasswordError is List<dynamic> && oldPasswordError.isNotEmpty) {
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
              if (passswordErrors is List<dynamic> && passswordErrors.isNotEmpty) {
                final errorMessage = passswordErrors.join('.');
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
                    msg: "Password Error: ${passswordErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('phone')) {
              final phoneErrors = responseData['phone'];
              if (phoneErrors is List<dynamic> && phoneErrors.isNotEmpty) {
                final errorMessage = phoneErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Phone number Error: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Phone number Error: ${phoneErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('budget_type')) {
              final budgetTypeErrors = responseData['budget_type'];
              if (budgetTypeErrors is List<dynamic> && budgetTypeErrors.isNotEmpty) {
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
              if (usernameErrors is List<dynamic> && usernameErrors.isNotEmpty) {
                final errorMessage = usernameErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Username: ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Username: ${usernameErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('detail')) {
              final detailstTypeErrors = responseData['detail'];
              if (detailstTypeErrors is List<dynamic> && detailstTypeErrors.isNotEmpty) {
                final errorMessage = detailstTypeErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Detail : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Detail: ${detailstTypeErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('merchant')) {
              final detailstTypeErrors = responseData['merchant']['amount'];
              if (detailstTypeErrors is List<dynamic> && detailstTypeErrors.isNotEmpty) {
                final errorMessage = detailstTypeErrors.join('.');
                Fluttertoast.showToast(
                    msg: "amount : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "amount: ${detailstTypeErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('order')) {
              final detailstTypeErrors = responseData['order'];
              if (detailstTypeErrors is List<dynamic> && detailstTypeErrors.isNotEmpty) {
                final errorMessage = detailstTypeErrors.join('.');
                Fluttertoast.showToast(
                    msg: "order : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "order: ${detailstTypeErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('end_time')) {
              final endTimeErrors = responseData['end_time'];
              if (endTimeErrors is List<dynamic> && endTimeErrors.isNotEmpty) {
                final errorMessage = endTimeErrors.join('.');
                Fluttertoast.showToast(
                    msg: "End Time : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "End Time: ${endTimeErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('start_date')) {
              final startDateErrors = responseData['start_date'];
              if (startDateErrors is List<dynamic> && startDateErrors.isNotEmpty) {
                final errorMessage = startDateErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Start Date : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Start Date: ${startDateErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('requirements')) {
              final highlightsError = responseData['requirements'];
              if (highlightsError is List<dynamic> && highlightsError.isNotEmpty) {
                final errorMessage = highlightsError.join('.');
                Fluttertoast.showToast(
                    msg: "Highlights : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "Highlights: ${highlightsError}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('tasks')) {
              final taskExpiredDateErrors = responseData['tasks'];
              if (taskExpiredDateErrors is List<dynamic> && taskExpiredDateErrors.isNotEmpty) {
                final errorMessage = taskExpiredDateErrors.join('.');
                Fluttertoast.showToast(
                    msg: "Tasks : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "tasks: ${taskExpiredDateErrors}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              }
            } else if (responseData is Map<String, dynamic> &&
                responseData.containsKey('city')) {
              final cityTypeErrors = responseData['city'];
              if (cityTypeErrors is List<dynamic> && cityTypeErrors.isNotEmpty) {
                final errorMessage = cityTypeErrors.join('.');
                Fluttertoast.showToast(
                    msg: "city : ${errorMessage}",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: kColorLightGrey,
                    textColor: Colors.white,
                    fontSize: 16.0);

                return handler.next(err);
              } else {
                Fluttertoast.showToast(
                    msg: "city: ${cityTypeErrors}",
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
              if (usernameErrors is List<dynamic> && usernameErrors.isNotEmpty) {
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
            Fluttertoast.showToast(
                msg: "Success: Congratulations",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: kColorLightGrey,
                textColor: Colors.white,
                fontSize: 16.0);
            break;
          case 403:
            // Handle 403 Forbidden
            // Your code here
            return handler.next(err);
          case 404:
            // Handle 403 Forbidden
            // Your code here
            return handler.next(err);
          case 500:
            // Handle 500 Internal Server Error
            // Your code here
            return handler.next(err);
          default:
            // Handle other error status codes
            // Your code here
            return handler.next(err);
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
    } catch (e) {
      rethrow;
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
    } catch (e) {
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
    } catch (e) {
      log("dio err:$e");
      rethrow;
    }
  }

  Future<dynamic> getMapDataWithCredential({
    Map<String, dynamic>? query,
    required String url,
  }) async {
    try {
      final response = await dioGoogleMaps.get<dynamic>(
        url,
        queryParameters: query,
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
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
    } catch (e) {
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
