import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/data/models/task_category_list_res.dart';
import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';

class UserDataRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchUserData() async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);

      final x = await _dio.getDatawithCredential(
        url: 'tasker/profile/',
        token: tokenP ?? token,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskerProfileRetrieveRes> addUserData(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);

      final x = await _dio.postDataWithCredential(
        data: taskerProfileCreateReq.toJson(),
        url: 'tasker/profile/',
        token: tokenP ?? token!,
      );
      return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskCategoryListRes> getTaskCategoryList() async {
    try {
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);

      final x = await _dio.getDatawithCredential(
        url: 'task/cms/task-category/list/',
        token: token ?? tokenP,
      );
      return TaskCategoryListRes.fromJson(
        x as Map<String, dynamic>,
      );
    } catch (e) {
      rethrow;
    }
  }
}
