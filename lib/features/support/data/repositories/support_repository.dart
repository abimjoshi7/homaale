import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

class SupportRepository {
  final _dioHelper = DioHelper();

  Future fetchSupportTickets(Map<String, dynamic> queryParams) async {
    final res = await _dioHelper.getDatawithCredential(
      url: '/support/support-ticket/',
      token: CacheHelper.accessToken,
      query: queryParams,
    );
    // log("Support Ticket Res: $res");
    return res['result'];
  }
}
