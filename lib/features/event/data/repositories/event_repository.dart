import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/event/data/models/req/create_event_req.dart';
import 'package:cipher/features/event/data/models/req/create_schedule_req.dart';

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

  Future<Map<String, dynamic>> createEvent(
      {required CreateEventReq req}) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: req,
        url: 'event/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createSchedule({
    required CreateScheduleReq req,
  }) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: req,
        url: 'event/schedule/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
