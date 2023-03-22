import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';

class UserRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchUser() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'tasker/profile/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addUser(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      final x = await _dio.postFormData(
        map: taskerProfileCreateReq.toJson(),
        url: 'tasker/my-profile/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> edituser(
    Map<String, dynamic> taskerProfileCreateReq,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        data: taskerProfileCreateReq,
        url: 'tasker/profile/',
        token: CacheHelper.accessToken,
      );
      log(x.toString());
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<TaskerProfile> deleteuser(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        data: taskerProfileCreateReq.toJson(),
        url: 'tasker/profile/',
        token: CacheHelper.accessToken,
      );
      return TaskerProfile.fromJson(x as Map<String, dynamic>);
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
