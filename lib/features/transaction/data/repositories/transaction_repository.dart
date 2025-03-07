import 'dart:developer';
import 'dart:io';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/core/helpers/file_storage_helper.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';
import 'package:dependencies/dependencies.dart';

class TransactionRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchTransactions({
    int? pageNumber = 1,
    String? dateAfter,
    String? dateBefore,
    String? status,
    String? transactionType,
    int? paymentMethod,
    String? searchQuery,
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
          "search": searchQuery,
        },
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Transactions Fetch Error: $e");
      throw Exception("Transactions fetching failed.");
    }
  }

  Future<TransactionsRes> getTransactions({
    int? pageNumber = 1,
    String? dateAfter,
    String? dateBefore,
    String? status,
    String? transactionType,
    int? paymentMethod,
    String? searchQuery,
  }) async =>
      await fetchTransactions(
              pageNumber: pageNumber,
              status: status,
              dateBefore: dateBefore,
              dateAfter: dateAfter,
              transactionType: transactionType,
              paymentMethod: paymentMethod,
              searchQuery: searchQuery)
          .then(
        (value) => TransactionsRes.fromJson(
          value,
        ),
      );

  Future<String> downloadCSV() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kTransactionDownloadPath,
        token: CacheHelper.accessToken,
      );

      return res as String;
    } catch (e) {
      throw Exception("CSV download error: $e");
    }
  }
}
