import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:dependencies/dependencies.dart';

class UploadRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchFileStore(List<XFile?>? filePath) async {
    try {
      final response = await _dio.postMultiFormData(
        pathList: filePath?.map((e) => e?.path ?? "").toList(),
        url: 'task/filestore/',
        token: CacheHelper.accessToken,
      );
      return response as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
