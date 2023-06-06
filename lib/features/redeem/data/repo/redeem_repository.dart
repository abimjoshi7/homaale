import 'dart:developer';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import '../models/redeem_items_detail.dart';
import '../models/redeem_submit_response.dart';
import '../models/request_redeem_list.dart';

class RedeemRepositories {
  final _dio = DioHelper();

  Future<RequestRedeemList> fetchRedeemList(String? offer_type,
      [int startIndex = 1]) async {
    try {
      final response = await _dio.getDatawithCredential(
        query: {'has_redeem_points': true, 'offer_type': offer_type,'page':startIndex},
        url:
            'offer/serviceoffer/all/',
                // '?has_redeem_points=true&offer_type=$offer_type',
        token: CacheHelper.accessToken,
      );

      final res = response as Map<String, dynamic>;

      log('response of redeem list: $res');

      final redeemResponse = RequestRedeemList.fromJson(res);

      return redeemResponse;
    } catch (e) {
      log('Error response of redeem list: $e');

      throw Exception('error fetching redeem');
    }
  }

  Future<RedeemItemsDetail> fetchRedeemItemDetails(
    int? redeemId,
  ) async {
    try {
      final response = await _dio.getDatawithCredential(
        url: 'offer/$redeemId/',
        token: CacheHelper.accessToken,
      );
      // return res as Map<String, dynamic>;

      final res = response as Map<String, dynamic>;

      log('response of redeem list: $res');

      final redeemResponse = RedeemItemsDetail.fromJson(res);

      return redeemResponse;


    } catch (e) {
      log('Error response of redeem list: $e');

      throw Exception('error fetching redeem');
    }
  }

  Future<RedeemSubmitResponse> submitRedeem(int? redeemId) async {
    try {
      final response = await _dio.postDataWithCredential(
        url: 'offer/redeem-points/$redeemId/',
        token: CacheHelper.accessToken,
        data: redeemId,
      );

      final res = response as Map<String, dynamic>;

      final redeemSubmit = RedeemSubmitResponse.fromJson(res);

      return redeemSubmit;
    } catch (e) {
      log('error submitting ratings: $e');
      throw Exception('error submitting redeem');
    }
  }
}
