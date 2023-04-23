import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/saved/data/models/req/saved_add_req.dart';

class SavedRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchSavedList(String? type) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kBookmarkPath,
        token: CacheHelper.accessToken,
        query: {
          "type": type,
        },
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> addSaved(
    SavedAddReq? savedAddReq,
  ) async {
    try {
      final response = await _dio.postDataWithCredential(
        data: savedAddReq?.toJson(),
        url: kBookmarkPath,
        token: CacheHelper.accessToken,
      );
      return response as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
