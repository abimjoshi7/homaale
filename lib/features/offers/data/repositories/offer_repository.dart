import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class OfferRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchOffers() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: "offer/serviceoffer/all/",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
