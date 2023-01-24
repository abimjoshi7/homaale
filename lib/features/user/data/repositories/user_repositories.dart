import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';

class UserRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchuser() async {
    try {
      log(CacheHelper.accessToken!);
      final x = await _dio.getDatawithCredential(
        url: 'tasker/profile/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<Map<String, dynamic>> adduser(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        data: taskerProfileCreateReq.toJson(),
        url: 'tasker/profile/',
        token: CacheHelper.accessToken!,
      );
      return x as Map<String, dynamic>;
      // return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<TaskerProfileRetrieveRes> edituser(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        data: taskerProfileCreateReq.toJson(),
        url: 'tasker/profile/',
        token: CacheHelper.accessToken,
      );
      return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }

  Future<TaskerProfileRetrieveRes> deleteuser(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      final x = await _dio.postDataWithCredential(
        data: taskerProfileCreateReq.toJson(),
        url: 'tasker/profile/',
        token: CacheHelper.accessToken,
      );
      return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
    } catch (e) {
      log(
        e.toString(),
      );
      rethrow;
    }
  }
}
