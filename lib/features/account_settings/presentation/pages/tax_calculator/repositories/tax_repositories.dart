import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/models/tax_req.dart';

class TaxRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> postTaxCalculate(TaxReq req) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: req,
        url: 'support/tax-calculator/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
