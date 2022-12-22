import 'package:cipher/api_service.dart';
import 'package:cipher/networking/models/request/otp_request.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/models/response/otp_response.dart';
import 'package:cipher/networking/models/response/user_login_res.dart';
import 'package:dio/dio.dart';

class NetworkHelper {
  final _dio = Dio();

  Future<Response<dynamic>> createUserWithEmail(
      {required String email, required String password}) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/signup/",
        data: {"email": email, "password": password},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> createUserWithPhone(
      {required String phoneNumber, required String password}) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/signup/",
        data: {"phone": phoneNumber, "password": password},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserLoginRes> logInUser({required UserLoginReq userLoginReq}) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/login/",
        data: userLoginReq.toJson(),
      );
      return UserLoginRes.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> resetPasswordwithEmail({required String email}) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/",
        data: {"email": email},
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
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/email/verify",
        data: {
          "uid": "string",
          "token": "string",
          "password": "string",
          "confirm_password": "string"
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchOTP({required String phone}) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/",
        data: {"phone": phone},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<OtpRes> verifyOTP({required OtpReq otpReq}) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/reset/otp/verify/",
        data: otpReq.toJson(),
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      return OtpRes.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }
}
