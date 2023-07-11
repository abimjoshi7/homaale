import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/data/connected_account.dart';

class ConnectedAccountRepo {
  final _dio = DioHelper();

  Future<List<Map<String, dynamic>>> fetchConnectedAccounts() async {
    try {
      final result = await _dio.getDatawithCredential(
        url: kConnectedAccountPath,
        token: CacheHelper.accessToken,
      );
      return List.from(
        result as Iterable,
      );
    } catch (e) {
      throw Exception("Cannot fetch connected accounts");
    }
  }

  Future<List<ConnectedAccount>> getConnectedAccounts() async =>
      fetchConnectedAccounts().then(
        (value) => value
            .map(
              (e) => ConnectedAccount.fromJson(e),
            )
            .toList(),
      );
}
