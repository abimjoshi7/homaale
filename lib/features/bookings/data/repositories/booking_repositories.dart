import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/bookings/data/models/models.dart';

class BookingRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> bookServiceOrTask(
    BookEntityServiceReq bookEntityService,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: bookEntityService.toJson(),
        url: 'task/entity/service-booking/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchMyServiceBookingList() async {
    try {
      final x = await _dio.getDatawithCredential(
        url: 'task/entity/service-mybooking/',
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> editBooking(
    int id,
    EditBookingReq editBookingReq,
  ) async {
    try {
      final x = await _dio.patchDataWithCredential(
        data: editBookingReq.toJson(),
        url: 'task/entity/service-booking/$id',
        token: CacheHelper.accessToken,
      );
      log(
        "Edit Booking Reponse: $x",
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      log("Edit Booking Error: $e");
      rethrow;
    }
  }

  Future<void> deleteBooking(int id) async {
    try {
      final x = await _dio.deleteDataWithCredential(
        id: id,
        url: 'task/entity/service-booking/',
        token: CacheHelper.accessToken,
      );
      log(
        x.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelBooking(int id) async {
    try {
      final x = await _dio.postDataWithCredential(
        data: {},
        url: 'task/entity/service-booking/cancel/$id',
        token: CacheHelper.accessToken,
      );
      log(
        x.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> approveBooking(int id) async {
    try {
      final x = await _dio.postDataWithCredential(
        data: {
          "booking": id,
        },
        url: 'task/entity/service-booking/approval/',
        token: CacheHelper.accessToken,
      );
      log(
        x.toString(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
