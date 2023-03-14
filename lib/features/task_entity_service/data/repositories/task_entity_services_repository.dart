import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/api_constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';

class TaskEntityServiceRepository {
  final _dio = DioHelper();

  Future createTaskEntityService({
    required TaskEntityServiceReq taskEntityServiceReq,
  }) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: taskEntityServiceReq.toJson(),
        url: kTaskEntityServicePath,
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
