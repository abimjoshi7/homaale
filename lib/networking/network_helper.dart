// ignore_for_file: inference_failure_on_function_invocation, strict_raw_type, lines_longer_than_80_chars, avoid_dynamic_calls

import 'dart:convert';

import 'package:cipher/core/app/api_end_points.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_res.dart';
import 'package:cipher/networking/models/request/otp_request.dart';
import 'package:cipher/networking/models/response/facebook_login_res.dart';
import 'package:cipher/networking/models/response/google_login_res.dart';
import 'package:cipher/networking/models/response/task_category.dart';
import 'package:cipher/networking/models/response/task_hero_category.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkHelper {
  final _dio = Dio(
    BaseOptions(
      baseUrl: sandbox,
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
          await CacheHelper.clearCachedData(kErrorLog);
          handler.next(e);
        },
        onError: (e, handler) async {
          if (kDebugMode) {
            print('ERROR INTERCEPTOR: ${e.response?.data}');
            print('ERROR INTERCEPTOR v2 : ${e.message}');
          }
          await CacheHelper.clearCachedData(kErrorLog).then(
            (value) async => CacheHelper.setCachedString(
              kErrorLog,
              e.response!.data.values
                  .toString()
                  .replaceAll(RegExp(r'[^\w\s]+'), ''),
            ),
          );
          // }
          handler.next(e);
        },
      ),
    );

  // Future<UserSignUpRes> createUserWithPhone({
  //   required String phoneNumber,
  //   required String password,
  // }) async {
  //   try {
  //     final res = await _dio.post(
  //       'user/signup/',
  //       data: {
  //         'phone': phoneNumber,
  //         'password': password,
  //       },
  //     );
  //     return UserSignUpRes.fromJson(
  //       res.data as Map<String, dynamic>,
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<UserSignUpRes?> createUserWithEmail({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     final res = await _dio.post(
  //       'user/signup/',
  //       data: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );
  //     return UserSignUpRes.fromJson(
  //       res.data as Map<String, dynamic>,
  //     );
  //   } catch (e) {}
  // }

  // Future<UserLoginRes> logInUser({required UserLoginReq userLoginReq}) async {
  //   try {
  //     final res = await _dio.post(
  //       '$baseIPSecondary:$portNumber/api/$versionNumber/user/login/',
  //       data: userLoginReq.toJson(),
  //     );
  //     return UserLoginRes.fromJson(res.data as Map<String, dynamic>);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('User Login Error');
  //     }
  //     rethrow;
  //   }
  // }

  // Future<void> resetPasswordVerifytwithEmail({
  //   required String uid,
  //   required String token,
  //   required String password,
  // }) async {
  //   try {
  //     final res = await _dio.post(
  //       '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/email/verify',
  //       data: {
  //         'uid': 'string',
  //         'token': 'string',
  //         'password': 'string',
  //         'confirm_password': 'string'
  //       },
  //     );
  //     if (kDebugMode) {
  //       print(res);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> getTaskerProfile() async {
  //   final x = await _dio.get('tasker/profile/');
  //   print('Status Code:${x.statusCode}');
  // }

  // Future<OtpResetVerifyRes> verifyOTP({
  //   required String phone,
  //   required String otp,
  //   required String scope,
  // }) async {
  //   try {
  //     final res = await _dio.post(
  //       '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/otp/verify/',
  //       data: {
  //         'phone': phone,
  //         'otp': otp,
  //         'scope': scope,
  //       },
  //     );
  //     return OtpResetVerifyRes.fromJson(res.data as Map<String, dynamic>);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<OtpResetVerifyRes> resetPassword({
    required OtpReq otpReq,
  }) async {
    try {
      final res = await _dio.post(
        '$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/otp/verify/',
        data: otpReq.toJson(),
      );
      return OtpResetVerifyRes.fromJson(res.data as Map<String, dynamic>);
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
