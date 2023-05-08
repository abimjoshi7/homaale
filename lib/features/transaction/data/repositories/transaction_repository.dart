import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class TransactionRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> getTransactions(
    int pageNumber, {
    DateTime? dateAfter,
    DateTime? dateBefore,
    String? status,
    String? transactionType,
    int? paymentMethod,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kTransactionPath,
        token: CacheHelper.accessToken,
        query: {
          "page": pageNumber,
          "date_after": dateAfter,
          "date_before": dateBefore,
          "status": status,
          "transaction_type": transactionType,
          "payment_method": paymentMethod,
        },
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Transactions Fetch Error: $e");
      rethrow;
    }
  }
}
