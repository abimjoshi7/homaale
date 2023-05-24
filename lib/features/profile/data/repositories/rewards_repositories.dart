import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/profile/data/models/rewards_response_dto.dart';

class RewardsRepositores {
  final _dio = DioHelper();

  Future<RewardsResponseDto> fetchMyRewards([int startIndex = 1]) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'offer/my-rewards/',
        query: {'page': startIndex},
        token: CacheHelper.accessToken,
      );
      if (res != null) {
        return RewardsResponseDto.fromJson(res as Map<String, dynamic>);
      } else {
        throw Exception('Error fetching my rewards');
      }
    } catch (e) {
      rethrow;
    }
  }
}
