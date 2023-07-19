import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/booking_history_req.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/bookings/data/models/reject_req.dart';

class BookingRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> bookServiceOrTask(
    BookEntityServiceReq bookEntityService,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: bookEntityService.toJson(),
        url: kBooking,
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  // API to show waiting list items details of box view
  Future<Map<String, dynamic>> fetchSingleBooking({
    required int id,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: "$kBooking$id/",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      print("error 1 $e");
      rethrow;
    }
  }

  // API to show items details of bookings view
  Future<Map<String, dynamic>> fetchBooking({
    required String id,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: "task/entity/service/task/$id",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  // API to show waiting list in box view
  Future<Map<String, dynamic>> fetchMyBookingsList({int? page}) async {
    try {
      final x = await _dio.getDatawithCredential(
        query: {
          "page": page,
          "is_accepted": false,
          "status": "pending",
        },
        url: kMyBookingList,
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchBookingsList({
    bool? isTask,
    String? status,
    int? page,
    bool isSelf = true,
  }) async {
    try {
      final x = await _dio.getDatawithCredential(
        query: {
          "page": page,
          "is_requested": isTask,
          "status": status,
          "assigned_to_me": isSelf,
        },
        url: kBookingList,
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
      final res = await _dio.patchDataWithCredential(
        data: editBookingReq.toJson(),
        url: '$kBooking$id/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteBooking(int id) async {
    try {
      final res = await _dio.deleteDataWithCredential(
        id: id,
        url: kBooking,
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log('delete error: ' + e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> cancelBooking(int id) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {},
        url: '$kCreateBookingsCancel$id/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> approveBooking(ApproveReq approveReq) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: approveReq.toJson(),
        url: '$kCreateBookingsApproval',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> rejectBooking(RejectReq rejectReq) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: rejectReq.toJson(),
        url: '$kCreateBookingsDecline',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> bookingHistory(
      BookingHistoryReq bookingHistoryReq) async {
    try {
      final query = bookingHistoryReq.toJson();
      log('booking api $query');
      final res = await _dio.getDatawithCredential(
        query: bookingHistoryReq.toJson(),
        url: '/task/entity/service/task/list/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log('booking api error : ${e.toString()}');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateStatus(
      {required String status, required String id}) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {
          "status": status,
          "task": id,
        },
        url: 'task/entity/service/task/status/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log('booking status update api error : ${e.toString()}');
      rethrow;
    }
  }

  Future<void> archiveTaskEntityService({required String id}) async {
    try {
      await _dio.postDataWithCredential(
        data: {
          "is_active": false,
          "id": id,
        },
        url: '/task/entity/service-archive/',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log("Archive Task Entity Service Failure:${e.toString()}");
      rethrow;
    }
  }

  Future<void> updateNegotiationBookingPrice({
    required String budget,
    required int id,
  }) async {
    try {
      await _dio.patchDataWithCredential(
        data: {
          "price": budget,
        },
        url: "/task/entity/service-booking/negotiate/$id/",
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      log("Failure to update Negotiation Booking Price:${e.toString()}");
      rethrow;
    }
  }
}
