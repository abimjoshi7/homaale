import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class EventRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> retrieveEvent({required String id}) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'event/$id/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
