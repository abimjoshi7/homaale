// import 'package:cipher/core/cache/cache_helper.dart';
// import 'package:cipher/core/constants/constants.dart';
// import 'package:cipher/core/dio/dio_helper.dart';

// class SavedRepository {
//   final _dio = DioHelper();

//   Future fetchSavedList() async {
//     await _dio.getDatawithCredential(
//       url: kBookmarkPath,
//       token: CacheHelper.accessToken,
//     );
//   }

//   Future addSaved(
//     String modelType,
//     String id,
//   ) async {
//     final response = await _dio.postDataWithCredential(
//       data: {
//         "model": modelType,
//         "object_id": id,
//       },
//       url: kBookmarkPath,
//       token: CacheHelper.accessToken,
//     );
//     print(response);
//   }
// }
