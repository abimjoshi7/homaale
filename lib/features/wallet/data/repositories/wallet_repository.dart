import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class WalletRepository {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> fetchMyWallet() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: "wallet/mywallet/",
        token: CacheHelper.accessToken,
      );
      return res as List<Map<String, dynamic>>;
    } catch (e) {
      rethrow;
    }
  }
}
