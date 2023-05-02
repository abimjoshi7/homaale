import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/following_followers/data/models/following_followers_response_dto.dart';

class FollowFollowersRepositroy {
  final _dio = DioHelper();

  Future<FollowingFollowersResponseDto> fetchFollowFollowing(bool isFollow, [int startIndex = 1]) async {
    try {
      var followingFollowersResponseDto = FollowingFollowersResponseDto();
      if (isFollow) {
        final response = await fetchFollowersList(page: startIndex);
        followingFollowersResponseDto = FollowingFollowersResponseDto.fromJson(response);
      } else {
        final response = await fetchFollowingList(page: startIndex);
        followingFollowersResponseDto = FollowingFollowersResponseDto.fromJson(response);
      }

      return followingFollowersResponseDto;
    } catch (_) {
      throw Exception('error fetching follwer/following list');
    }
  }

  Future<Map<String, dynamic>> fetchFollowersList({required int page}) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'tasker/my-followers/',
        token: CacheHelper.accessToken,
        query: {'page': page},
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> fetchFollowingList({required int page}) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'tasker/my-following/',
        token: CacheHelper.accessToken,
        query: {'page': page},
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> handleFollowUnFollow({required String id, required bool follow}) async {
    try {
      final res = await _dio.postDataWithCredential(
        data: {
          "user": id,
          "follow": follow,
        },
        url: 'tasker/follow/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("All Tasker Fetch Error: $e");
      rethrow;
    }
  }
}
