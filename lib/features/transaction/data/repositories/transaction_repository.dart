import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class TransactionRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> getTransactions() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kTransactionPath,
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Transactions Fetch Error: $e");
      rethrow;
    }
  }
}
