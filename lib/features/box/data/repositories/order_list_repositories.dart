import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class OrderListRepositories {
  final _dio = DioHelper();

  Future<Map<String, dynamic>> getAllOrder() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'task/pay/task-list/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getAllOrderRetrive(
    String uuid,
  ) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'payment/order/$uuid/', //7b8eabe2-82ad-4dc3-ac43-82bbdca64783
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Created Service/Task Fetch Error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postCreateOrderId(List<String> uuid) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'tasks': uuid},
        url: 'task/add/cart/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log('Create order id error : $e');
      rethrow;
    }
  }
}
