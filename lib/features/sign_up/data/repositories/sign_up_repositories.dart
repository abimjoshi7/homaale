import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_req.dart';
import 'package:cipher/features/sign_up/data/models/user_sign_up_res.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_res.dart';

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
    // required String phone,
    // required String otp,
    // required String scope,
    // required String password,
    // required String confirmPassword,
    required OtpResetVerifyReq otpResetVerifyReq,
  }) async {
    try {
      final res = await _dio.postData(
        url: 'user/reset/otp/verify/',
        // data: {
        //   'phone': phone,
        //   'otp': otp,
        //   'scope': scope,
        //   'password': password,
        //   'confirm_password': confirmPassword,
        // },
        data: otpResetVerifyReq.toMap(),
      );
      return OtpResetVerifyRes.fromJson(res as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
