import 'package:cipher/api_service.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
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
}
