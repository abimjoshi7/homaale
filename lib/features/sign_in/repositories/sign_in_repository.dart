import 'dart:developer';

import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/models/user_login_res.dart';
import 'package:cipher/features/sign_in/models/user_reset_create.dart';

class SignInRepository {
  final _dioHelper = DioHelper();

  Future<UserLoginRes> initiateSignIn(UserLoginReq userLoginReq) async {
    try {
      final z = await _dioHelper.postData(
        url: 'user/login/',
        data: userLoginReq.toJson(),
      );
      log(
        z.toString(),
      );
      return UserLoginRes.fromJson(z as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resetPasswordwithPhone({
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
      rethrow;
    }
  }

  Future<Map<String, dynamic>> resetPasswordwithEmail({
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
      rethrow;
    }
  }
}
