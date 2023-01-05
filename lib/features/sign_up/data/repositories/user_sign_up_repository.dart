// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/response/user_sign_up_res.dart';

class UserRepository {
  final DioHelper dio;
  UserRepository({
    required this.dio,
  });

  Future<UserSignUpRes?> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final res = await dio.postData(
        url: 'user/signup/',
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
}
