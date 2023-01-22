import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/data/models/task_category_list_res.dart';
import 'package:cipher/networking/models/request/tasker_profile_create_req.dart';
import 'package:cipher/networking/models/response/tasker_profile_retrieve_res.dart';

class UserDataRepositories {
  final _dio = DioHelper();

  Future<TaskerProfileRetrieveRes> fetchUserData() async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);

    final x = await _dio.getDatawithCredential(
      url: 'tasker/profile/',
      token: tokenP ?? token,
    );
    return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
  }

  Future<TaskerProfileRetrieveRes> addUserData(
    TaskerProfileCreateReq taskerProfileCreateReq,
  ) async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);

    final x = await _dio.postDataWithCredential(
      data: taskerProfileCreateReq.toJson(),
      url: 'tasker/profile/',
      token: tokenP ?? token!,
    );
    return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
  }

  Future<TaskCategoryListRes> getTaskCategoryList() async {
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final token = await CacheHelper.getCachedString(kAccessToken);

    final x = await _dio.getDatawithCredential(
      url: 'task/cms/task-category/list/',
      token: token ?? tokenP,
    );
    return TaskCategoryListRes.fromJson(
      x as Map<String, dynamic>,
    );
  }
}
