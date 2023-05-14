import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/wallet/data/models/wallet_history_res.dart';
import 'package:cipher/features/wallet/data/models/wallet_model.dart';

class WalletRepository {
  final _dio = DioHelper();

  Future<List<dynamic>> fetchMyWallet() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kMyWallet,
        token: CacheHelper.accessToken,
      );
      return res as List<dynamic>;
    } catch (e) {
      log("My Wallet fetch error: $e");
      throw Exception("My wallet fetch error");
    }
  }

  Future<Map<String, dynamic>> fetchWalletHistory({
    DateTime? createdAt,
    DateTime? endDate,
    DateTime? startDate,
    required int page,
  }) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: kWalletHistory,
        token: CacheHelper.accessToken,
        query: {
          "created_at": createdAt,
          "end_date": endDate,
          "start_date": startDate,
          "page": page,
        },
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Wallet history fetch error: $e");
      throw Exception("Fetching wallet history failed");
    }
  }

  Future<List<WalletModel>> getMyWallet() async {
    List<WalletModel> wallList = [];
    var res = await fetchMyWallet();
    res.forEach((element) {
      wallList.add(WalletModel.fromJson(element as Map<String, dynamic>));
    });

    return wallList;
  }

  Future<WalletHistoryRes> getWalletHistory(DateTime? createdAt, DateTime? endDate, DateTime? startDate,
          [int startIndex = 1]) async =>
      await fetchWalletHistory(
        createdAt: createdAt,
        endDate: endDate,
        startDate: startDate,
        page: startIndex,
      ).then(
        (value) => WalletHistoryRes.fromJson(value),
      );
}
