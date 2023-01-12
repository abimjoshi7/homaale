import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_up/data/models/user_sign_up_res.dart';

class SignUpRepositories {
  final dio = DioHelper();

  Future<UserSignUpRes?> initiateSignUpEmail({
    required String email,
    required String password,
  }) async {
    final res = await dio.postData(
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
    final res = await dio.postData(
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
}
