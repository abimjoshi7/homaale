import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/wallet/data/models/wallet_history_res.dart';
import 'package:cipher/features/wallet/data/models/wallet_model.dart';

class WalletRepository {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> fetchMyWallet() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kMyWallet,
        token: CacheHelper.accessToken,
      );
      return res as List<Map<String, dynamic>>;
    } catch (e) {
      log("My Wallet fetch error: $e");
      throw Exception("My wallet fetch error");
    }
  }

  Future<Map<String, dynamic>> fetchWalletHistory({
    DateTime? createdAt,
    DateTime? endDate,
    DateTime? startDate,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kWalletHistory,
        token: CacheHelper.accessToken,
        query: {
          "created_at": createdAt,
          "end_date": endDate,
          "start_date": startDate,
        },
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Wallet history fetch error: $e");
      throw Exception("Fetching wallet history failed");
    }
  }

  Future<List<WalletModel>> getMyWallet() async {
    return await fetchMyWallet().then(
      (value) => value
          .map(
            (e) => WalletModel.fromJson(
              e,
            ),
          )
          .toList(),
    );
  }

  Future<WalletHistoryRes> getWalletHistory({
    DateTime? createdAt,
    DateTime? endDate,
    DateTime? startDate,
  }) async =>
      await fetchWalletHistory(
        createdAt: createdAt,
        endDate: endDate,
        startDate: startDate,
      ).then(
        (value) => WalletHistoryRes.fromJson(
          value,
        ),
      );
}
