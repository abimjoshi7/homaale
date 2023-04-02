import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class ApplyPromoCodeRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> postOfferCode(
    String uuid,
    String code,
    String offer_type,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'code': code, 'offer_type': offer_type, 'order': uuid},
        url: 'offer/applyoffercode/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
