import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/api_constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class UploadRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> uploadImage(String imagePath) async {
    try {
      final res = await _dio.postMultiFormData(
        url: kFileStore,
        token: CacheHelper.accessToken,
        path: imagePath,
      );
      if (res["status"] == "success") return res as Map<String, dynamic>;
      return {};
    } catch (e) {
      rethrow;
    }
  }

	
}
