import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/event/data/models/event_availability.dart';
import 'package:cipher/features/event/data/models/req/create_event_req.dart';
import 'package:cipher/features/event/data/models/req/create_schedule_req.dart';
import 'package:cipher/features/event/data/models/res/single_schedule_res.dart';

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

  Future<void> editEvent(String id, Map<String, dynamic> data) async {
    try {
      await _dio.patchDataWithCredential(
        data: data,
        url: "event/$id/",
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      throw Exception("Event edit failed : $e");
    }
  }

  Future<void> deleteEvent(String id) async {
    try {
      await _dio.deleteDataWithCredential(
        sid: id,
        url: "event/",
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      throw Exception("Event deletion failed : $e");
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

  Future<void> deleteSchedule({
    required String id,
  }) async {
    try {
      await _dio.deleteDataWithCredential(
        sid: id,
        url: 'event/schedule/',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> checkAvailability({
    required EventAvailability eventAvailability,
    required String id,
  }) async {
    try {
      await _dio
          .postDataWithCredential(
            data: eventAvailability,
            url: "event/$id/availability/",
            token: CacheHelper.accessToken,
          )
          .then(
            (value) => print(
              value,
            ),
          );
    } catch (e) {
      rethrow;
    }
  }

  Future<SingleScheduleRes> fetchSingleSchedule({required String id}) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: "event/schedule/$id/",
        token: CacheHelper.accessToken,
      );
      return SingleScheduleRes.fromJson(res as Map<String, dynamic>);
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }

  Future<void> editSchedule(Map<String, dynamic> data, String id) async {
    try {
      await _dio.patchDataWithCredential(
        data: data,
        url: "event/schedule/$id/",
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      throw Exception("Edit Schedule Error: $e");
    }
  }
}
