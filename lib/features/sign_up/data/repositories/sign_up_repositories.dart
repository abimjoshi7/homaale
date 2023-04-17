import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_res.dart';
import 'package:cipher/features/sign_up/data/models/user_sign_up_res.dart';

class SignUpRepositories {
  final _dio = DioHelper();

  Future<UserSignUpRes?> initiateSignUpEmail({
    required String email,
    required String password,
  }) async {
    final res = await _dio.postData(
      url: 'user/signup/',
      data: {
        'email': email,
        'password': password,
      },
    );
    return UserSignUpRes.fromJson(
      res as Map<String, dynamic>,
    );
  }

  Future<UserSignUpRes?> initiateSignUpPhone({
    required String phone,
    required String password,
  }) async {
    final res = await _dio.postData(
      url: 'user/signup/',
      data: {
        'phone': '+977$phone',
        'password': password,
      },
    );
    return UserSignUpRes.fromJson(
      res as Map<String, dynamic>,
    );
  }

  Future<OtpResetVerifyRes> verifyOTPSignUp({
    required Map<String, dynamic> otpResetVerifyReq,
  }) async {
    try {
      final res = await _dio.postData(
        url: 'user/reset/otp/verify/',
        data: otpResetVerifyReq,
      );
      return OtpResetVerifyRes.fromJson(res as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future resendOTPSignUp({
    required String phoneNumber,
  }) async {
    try {
      final res = await _dio.postData(
        data: {"phone": "$phoneNumber"},
        url: 'user/resend/otp/activation/',
      );
      log("resend OTP test: " + res.toString());
      return res;
    } catch (e) {
      log('Could not resend OTP: $e');
      rethrow;
    }
  }

  Future resendEmailSignUp({required String email}) async {
    final res = await _dio.postData(
      data: {"email": "$email"},
      url: "user/resend/email/activation/",
    );
    log("resend Verification Email test: " + res.toString());
    if (res != null) {
      return res;
    }
  }
}
