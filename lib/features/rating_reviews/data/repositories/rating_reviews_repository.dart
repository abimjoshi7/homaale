import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_request_dto.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_response_dto.dart';
import 'package:cipher/features/rating_reviews/data/models/rating_submit_response_dto.dart';

class RatingReviewsRepositroy {
  final _dio = DioHelper();

  Future<RatingResponseDto> fetchRatingReviews(String? serviceID,
      [int startIndex = 1]) async {
    try {
      final response = await _dio.getDatawithCredential(
        url: '/task/rating/service/$serviceID/?page=$startIndex',
        token: CacheHelper.accessToken,
      );

      final res = response as Map<String, dynamic>;

      log('ressssss: $res');

      final ratingResponseDto = RatingResponseDto.fromJson(res);

      return ratingResponseDto;
    } catch (e) {
      log('ressssss: $e');

      throw Exception('error fetching ratings');
    }
  }

  Future<RatingSubmitResponseDto> submitRatingReviews(RatingRequestDto ratingRequestDto) async {
    try {
      final response = await _dio.postDataWithCredential(
        url: '/task/rating/',
        data: ratingRequestDto.toJson(),
        token: CacheHelper.accessToken,
      );

      final res = response as Map<String, dynamic>;

      final ratingSubmitResponseDto = RatingSubmitResponseDto.fromJson(res);

      return ratingSubmitResponseDto;
    } catch (e) {
      log('error submiting ratings: $e');
      throw Exception('error submiting ratings');
    }
  }
}
