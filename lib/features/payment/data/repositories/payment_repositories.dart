
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
        data: {
          'order':uuid
        },
        url: "payment/intent/$provider/",
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

}
