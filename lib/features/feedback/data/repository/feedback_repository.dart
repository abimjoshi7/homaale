import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

import '../models/feedback.dart';

class FeedbackRepository {
  final _dio = DioHelper();

  Future<List<Feedback>> fetchFeedback() async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'support/feedback/category/options/',
        token: CacheHelper.accessToken,
      );
      // return res as Map<String, dynamic>;
      final model = List<Feedback>.from(
        res.map((e) => Feedback.fromJson(e as Map<String, dynamic>)).toList()
            as Iterable,
      );
      return model;
    } catch (e) {
      log("Person details in chat error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> PostFeedback(
      String subject, String description) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {'subject': subject, 'description': description},
        url: 'support/feedback/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Person details in chat error: $e");
      rethrow;
    }
  }
}
