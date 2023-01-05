// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type, lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:convert';

import 'package:cipher/api_service.dart';
import 'package:cipher/networking/models/request/otp_request.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/models/response/facebook_login_res.dart';
import 'package:cipher/networking/models/response/google_login_res.dart';
import 'package:cipher/networking/models/response/otp_response.dart';
import 'package:cipher/networking/models/response/task_category.dart';
import 'package:cipher/networking/models/response/task_hero_category.dart';
import 'package:cipher/networking/models/response/user_login_res.dart';
import 'package:cipher/networking/models/response/user_sign_up_res.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

class NetworkHelper {
  final _dio = Dio(
    BaseOptions(
      baseUrl: baseIPSecondary,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      receiveDataWhenStatusError: true,
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (e, handler) async {
          if (kDebugMode) {
            print('RESPONSE INTERCEPTOR: ${e.data}');
          }
          await storage.delete(key: 'errorLog');
          handler.next(e);
        },
        onError: (e, handler) async {
          if (kDebugMode) {
            print('ERROR INTERCEPTOR: ${e.response?.data}');
            print('ERROR INTERCEPTOR: ${e.message}');
          }
          await storage.delete(key: 'errorLog').then(
                (value) async => storage.write(
                  key: 'errorLog',
                  value: e.response!.data.values
                      .toString()
                      .replaceAll(RegExp(r'[^\w\s]+'), ''),
                ),
              );
          // }
          handler.next(e);
        },
      ),
    );

  Future<UserSignUpRes> createUserWithPhone({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        'user/signup/',
        data: {
          'phone': phoneNumber,
          'password': password,
        },
      );
      return UserSignUpRes.fromJson(
        res.data as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<UserSignUpRes?> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        'user/signup/',
        data: {
          'email': email,
          'password': password,
        },
      );
      return UserSignUpRes.fromJson(
        res.data as Map<String, dynamic>,
      );
    } catch (e) {}
  }

  Future<UserLoginRes> logInUser({required UserLoginReq userLoginReq}) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/login/',
        data: userLoginReq.toJson(),
      );
      return UserLoginRes.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      if (kDebugMode) {
        print('User Login Error');
      }
      rethrow;
    }
  }

  Future<Response> resetPasswordwithEmail({required String email}) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/',
        data: {'email': email},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPasswordVerifytwithEmail({
    required String uid,
    required String token,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/email/verify',
        data: {
          'uid': 'string',
          'token': 'string',
          'password': 'string',
          'confirm_password': 'string'
        },
      );
      if (kDebugMode) {
        print(res);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchOTP({required String phone}) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/',
        data: {'phone': phone},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getTaskerProfile() async {
    final x = await _dio.get('tasker/profile/');
    print('Status Code:${x.statusCode}');
  }

  Future<OtpRes> verifyOTPSignUp({
    required String phone,
    required String otp,
    required String scope,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/otp/verify/',
        data: {
          'phone': phone,
          'otp': otp,
          'scope': scope,
          'password': password,
          'confirm_password': confirmPassword,
        },
      );
      return OtpRes.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpRes> verifyOTP({
    required String phone,
    required String otp,
    required String scope,
  }) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/otp/verify/',
        data: {
          'phone': phone,
          'otp': otp,
          'scope': scope,
        },
      );
      return OtpRes.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpRes> resetPassword({
    required OtpReq otpReq,
  }) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/otp/verify/',
        data: otpReq.toJson(),
      );
      return OtpRes.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<FacebookLoginRes> sendFacebookReq(
    Map<String, dynamic> userData,
  ) async {
    try {
      final x = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/register/social/facebook/',
        data: jsonEncode(userData),
      );
      return FacebookLoginRes.fromJson(x.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<GoogleLoginRes> sendGoogleLoginReq(Map<String, dynamic> map) async {
    try {
      final x = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/register/social/google_oauth2/',
        data: jsonEncode(map),
      );
      return GoogleLoginRes.fromJson(x.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TaskCategory>> getTaskCategoryList() async {
    try {
      final x = await _dio.get(
        '$baseIPSecondary:$portNumber/api/$versionNumber/task/cms/task-category/list/',
      );
      return (x.data as List<dynamic>)
          .map(
            (e) => TaskCategory.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskHeroCategory> getTaskHeroCategoryList() async {
    try {
      final x = await _dio.get(
        '$baseIPSecondary:$portNumber/api/$versionNumber/task/hero-category/',
      );
      return TaskHeroCategory.fromJson(x.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  // Future<TaskerProfileRes> getTaskerProfile() async {
  //   try {
  //     final x = await _dio.get(
  //       '$baseIPSecondary:$portNumber/api/$versionNumber/tasker/profile/',
  //     );
  //     return TaskerProfileRes.fromJson(x.data as Map<String, dynamic>);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
