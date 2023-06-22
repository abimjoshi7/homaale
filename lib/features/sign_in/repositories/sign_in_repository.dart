import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_in/models/facebook_login_res.dart';
import 'package:cipher/features/sign_in/models/google_login_res.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/models/user_login_res.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_req.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_res.dart';

import '../../../core/cache/cache_helper.dart';

class SignInRepository {
  final _dioHelper = DioHelper();

  Future<UserLoginRes> initiateSignIn(UserLoginReq userLoginReq) async {
    try {
      final z = await _dioHelper.postData(
        url: 'user/login/',
        data: userLoginReq.toJson(),
      );
      return UserLoginRes.fromJson(z as Map<String, dynamic>);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resetPasswordWithPhone({
    required String phone,
  }) async {
    try {
      final res = await _dioHelper.postData(
        data: {
          "phone": phone,
        },
        url: 'user/reset/',
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resetPasswordWithEmail({
    required String email,
  }) async {
    try {
      final res = await _dioHelper.postData(
        data: {
          "email": email,
        },
        url: 'user/reset/',
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> changePhone({
    required String phone,
    required String password,
  }) async {
    try {
      final res = await _dioHelper.postDataWithCredential(
        data: {
          "phone": phone,
          "password": password,
        },
        url: 'tasker/change-phone/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log(
        'error ' + e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> changeEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _dioHelper.postDataWithCredential(
        data: {
          "email": email,
          "password": password,
        },
        url: 'tasker/change-email/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<OtpResetVerifyRes> verifyOtpReset(
    OtpResetVerifyReq otpResetVerifyReq,
  ) async {
    try {
      final x = await _dioHelper.postData(
        url: 'user/reset/otp/verify/',
        data: otpResetVerifyReq.toMap(),
      );
      return OtpResetVerifyRes.fromJson(x as Map<String, dynamic>);
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<FacebookLoginRes> sendFacebookReq(
    Map<String, dynamic> userData,
  ) async {
    try {
      final x = await _dioHelper.postData(
        data: jsonEncode(userData),
        url: 'user/register/social/facebook/',
      );

      return FacebookLoginRes.fromJson(
        x as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<GoogleLoginRes> sendGoogleLoginReq(Map<String, dynamic> map) async {
    try {
      final x = await _dioHelper.postData(
        data: map,
        url: 'user/register/social/google_oauth2/',
      );

      return GoogleLoginRes.fromJson(
        x as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }
}
