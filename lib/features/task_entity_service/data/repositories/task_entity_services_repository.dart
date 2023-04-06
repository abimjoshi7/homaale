import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/api_constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';

class TaskEntityServiceRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> createTaskEntityService({
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

  Future<Map<String, dynamic>> retrieveSingleTaskEntityService({
    required String serviceId,
  }) async {
    try {
      if (CacheHelper.isLoggedIn == false) {
        final res = await _dio.getData(
          url: '$kTaskEntityServicePath$serviceId',
        );
        return res as Map<String, dynamic>;
      } else {
        final res = await _dio.getDatawithCredential(
          url: '$kTaskEntityServicePath$serviceId',
          token: CacheHelper.accessToken,
        );
        return res as Map<String, dynamic>;
      }
    } catch (e) {
      // log(
      //   e.toString(),
      // );
      rethrow;
    }
  }
}
