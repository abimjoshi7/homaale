import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';

class BookingRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> bookServiceOrTask(
    BookEntityServiceReq bookEntityService,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: bookEntityService.toJson(),
        url: kCreateBookings,
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

// ! incomplete parameters
  Future<Map<String, dynamic>> fetchOthersBookingList() async {
    try {
      final x = await _dio.getDatawithCredential(
        query: {},
        url: kCreateBookings,
        token: CacheHelper.accessToken,
      );
      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchMyServiceTaskBookingList({
    required bool isTask,
    String? status,
  }) async {
    try {
      final x = await _dio.getDatawithCredential(
        url: kMyBookingList,
        query: {
          "is_requested": isTask,
          "status": status,
        },
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
        url: '$kCreateBookings$id',
        token: CacheHelper.accessToken,
      );

      return x as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteBooking(int id) async {
    try {
      await _dio.deleteDataWithCredential(
        id: id,
        url: kCreateBookings,
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> cancelBooking(int id) async {
    try {
      await _dio.postDataWithCredential(
        data: {},
        url: '$kCreateBookingsCancel$id',
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> approveBooking(int id) async {
    try {
      await _dio.postDataWithCredential(
        data: {
          "booking": id,
        },
        url: kCreateBookingsApproval,
        token: CacheHelper.accessToken,
      );
    } catch (e) {
      rethrow;
    }
  }
}
