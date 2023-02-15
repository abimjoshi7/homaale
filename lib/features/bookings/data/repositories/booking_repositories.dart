import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';

class BookingRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> bookEntityService(
    BookEntityServiceReq bookEntityService,
  ) async {
    final res = await _dio.postDataWithCredential(
      data: bookEntityService.toJson(),
      url: 'task/entity/service-booking/',
      token: CacheHelper.accessToken,
    );
    return res as Map<String, dynamic>;
  }

  Future<void> approveBooking(int id) async {
    final x = await _dio.postDataWithCredential(
      data: {
        "booking": id,
      },
      url: 'task/entity/service-booking/approval/',
      token: CacheHelper.accessToken,
    );
    print(x);
  }
}
