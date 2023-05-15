import 'dart:developer';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/dio/dio_helper.dart';

class BookingCancelRepository {
  final _dio = DioHelper();
  Future<Map<String, dynamic>> PostCancelAction(
      int bookingId, String reason, String description) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {
          'cancellation_reason': reason,
          'cancellation_description': description
        },
        url: 'entity/service-booking/cancel/$bookingId/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Cancellation details error: $e");
      rethrow;
    }
  }
}
