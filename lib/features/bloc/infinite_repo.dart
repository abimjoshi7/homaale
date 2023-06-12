import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class InifiniteRepo {
  final dio = DioHelper();

  fetchItems(String url, Map<String, dynamic> data, [int startIndex = 1]) async {
    try {
      final dats = data;

      dats.addAll({'page': startIndex});

      final res = await dio.getDatawithCredential(
        url: url,
        token: CacheHelper.accessToken,
        query: dats,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
