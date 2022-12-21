import 'package:dio/dio.dart';

abstract class UserSignUpRepo {
  Future<Response<dynamic>> createUserWithPhone({
    required String phoneNumber,
    required String password,
  });
  Future<Response<dynamic>> createUserWithEmail({
    required String email,
    required String password,
  });
}
