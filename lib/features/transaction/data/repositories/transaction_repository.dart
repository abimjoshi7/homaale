import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/core/helpers/file_storage_helper.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';

class TransactionRepository {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> fetchTransactions({
    int? pageNumber = 1,
    String? dateAfter,
    String? dateBefore,
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
  }) async =>
      await fetchTransactions(
        pageNumber: pageNumber,
        status: status,
        dateBefore: dateBefore,
        dateAfter: dateAfter,
        transactionType: transactionType,
        paymentMethod: paymentMethod,
      ).then(
        (value) => TransactionsRes.fromJson(
          value,
        ),
      );

  Future downloadCSV() async {
    try {
      final String res = await _dio.getDatawithCredential(
        url: "payment/transaction-csv/",
        token: CacheHelper.accessToken,
      ) as String;
      log(res);

      FileStorageHelper().writeData(
        res,
      );
    } catch (e) {
      throw Exception("CSV download error: $e");
    }
  }
}
