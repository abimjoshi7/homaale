import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/marketing/data/models/marketing_ads_dto.dart';

class MarketingRepository {
  final _dio = DioHelper();

  Future<MarketingAdsDto> fetchMarketingAds([int startIndex = 1]) async {
    try {
      final res = await _dio.getDatawithCredential(
        url: 'marketing/advertisement/',
        token: CacheHelper.accessToken,
        query: {
          'page': startIndex,
          'page_size': 10,
          'type': 'image',
        },
      );
      return MarketingAdsDto.fromJson(res as Map<String, dynamic>);
    } catch (_) {
      throw Exception('error fetching marketing ads list');
    }
  }
}
