import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class LocaleHelper {
  static Future<List<Map<String, dynamic>>> getCountryCode() async {
    final x = await DioHelper().getDatawithCredential(
      url: 'locale/client/country/options/',
      token: CacheHelper.accessToken,
    );
    return x as List<Map<String, dynamic>>;
  }

  static Future<List<Map<String, dynamic>>> getCityCode({
    String? countryCode,
  }) async {
    final x = await DioHelper().getDatawithCredential(
      url: 'locale/client/city/options/',
      token: CacheHelper.accessToken,
      query: {
        'country': countryCode,
      },
    );
    return x as List<Map<String, dynamic>>;
  }

  void as() {}
}
