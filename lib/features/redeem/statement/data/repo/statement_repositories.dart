import 'package:cipher/core/dio/dio_helper.dart';

import '../../../../../core/cache/cache_helper.dart';

class StatementRepositories {
  final _dio = DioHelper();
  Future<Map<String, dynamic>> getRedeemStatementList() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'tasker/redeem-statement/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getRedeemStatementStatus(String status) async {
    try {
      final res = await _dio.getDatawithCredential(
        query: {'status': status},
        url: 'tasker/redeem-statement/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
