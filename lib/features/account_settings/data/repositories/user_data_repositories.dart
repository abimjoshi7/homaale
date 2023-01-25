// import 'package:cipher/core/cache/cache_helper.dart';
// import 'package:cipher/core/dio/dio_helper.dart';
// import 'package:cipher/features/account_settings/data/models/task_category_list_res.dart';
// import 'package:cipher/features/user/data/models/tasker_profile_create_req.dart';
// import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';

// class UserRepositories {
//   final _dio = DioHelper();

//   Future<Map<String, dynamic>> fetchuser() async {
//     try {
//       final x = await _dio.getDatawithCredential(
//         url: 'tasker/profile/',
//         token: CacheHelper.accessToken,
//       );
//       return x as Map<String, dynamic>;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<TaskerProfileRetrieveRes> adduser(
//     TaskerProfileCreateReq taskerProfileCreateReq,
//   ) async {
//     try {
//       final x = await _dio.postDataWithCredential(
//         data: taskerProfileCreateReq.toJson(),
//         url: 'tasker/profile/',
//         token: CacheHelper.accessToken,
//       );
//       return TaskerProfileRetrieveRes.fromJson(x as Map<String, dynamic>);
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<TaskCategoryListRes> getTaskCategoryList() async {
//     try {
//       final x = await _dio.getDatawithCredential(
//         url: 'task/cms/task-category/list/',
//         token: CacheHelper.accessToken,
//       );
//       return TaskCategoryListRes.fromJson(
//         x as Map<String, dynamic>,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
