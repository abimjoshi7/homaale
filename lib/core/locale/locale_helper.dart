import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class LocaleHelper {
  static Future<void> getCountryCode() async {
    final token = await CacheHelper.getCachedString(kAccessToken);
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final x = await DioHelper().getDatawithCredential(
      url: 'locale/client/country/options/',
      token: token ?? tokenP,
    );
    return x.first['code'];
  }

  static Future<void> getCityCode({String? countryCode}) async {
    final token = await CacheHelper.getCachedString(kAccessToken);
    final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
    final x = await DioHelper().getDatawithCredential(
      url: 'locale/client/country/options/',
      token: token ?? tokenP,
      query: {
        'country': countryCode,
      },
    );
    return x.first['code'];
  }
}
