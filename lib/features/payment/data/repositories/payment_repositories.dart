import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class PaymentRepositories {
  final _dio = DioHelper();
  Future<Map<String, dynamic>> postPaymentIntent(
    String provider,
    String uuid,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'order': uuid},
        url: "payment/intent/$provider/",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
  Future<Map<String, dynamic>> postPaymentZeroAmount(
    String uuid,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'order': uuid},
        url: "payment/payment/claim/",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postPaymentVerify(
    String provider,
    String pidx,
  ) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'verification_id': pidx},
        url: "payment/verify/$provider/",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPaymentTypeList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'payment/cms/payment-method/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
