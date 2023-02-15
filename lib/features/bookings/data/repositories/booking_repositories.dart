import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list.dart';

class BookingRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> bookEntityService(
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

  Future<Map<String, dynamic>> fetchMyBookingList() async {
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
}
