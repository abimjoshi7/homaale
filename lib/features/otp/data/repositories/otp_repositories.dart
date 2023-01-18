import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_up/data/models/otp_reset_verify_res.dart';

class OtpRepositories {
  final _dio = DioHelper();

  Future<void> verifyOTP({
    required String phone,
    required String otp,
    required String scope,
  }) async {
    try {
      final res = await _dio.postData(
        url: 'user/reset/otp/verify/',
        data: {
          'phone': phone,
          'otp': otp,
          'scope': scope,
        },
      );
      print(res);
      // return OtpResetVerifyRes.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}
