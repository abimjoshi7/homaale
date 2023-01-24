import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class LocaleHelper {
  static Future<void> getCountryCode() async {
    final x = await DioHelper().getDatawithCredential(
      url: 'locale/client/country/options/',
      token: CacheHelper.accessToken,
    );
    return x.first['code'];
  }

  static Future<void> getCityCode({String? countryCode}) async {
    final x = await DioHelper().getDatawithCredential(
      url: 'locale/client/country/options/',
      token: CacheHelper.accessToken,
      query: {
        'country': countryCode,
      },
    );
    return x.first['code'];
  }

  void as() {}
}
