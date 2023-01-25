import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_res.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_topics.dart';

class SupportHelpRepositories {
  Future<List<SupportHelpTopics>> getHelpTopicList() async {
    final res = await DioHelper().getDatawithCredential(
      url: 'support/help/topic/',
      query: {
        'page': -1,
      },
      token: CacheHelper.accessToken,
    );
    final x = res
        .map((e) => SupportHelpTopics.fromJson(e as Map<String, dynamic>))
        .toList();
    return List<SupportHelpTopics>.from(x as List);
  }

  Future<SupportHelpRes> addSupportHelp(SupportHelpReq supportHelpReq) async {
    final res = await DioHelper().postDataWithCredential(
      data: supportHelpReq.toJson(),
      url: 'support/help/',
      token: CacheHelper.accessToken,
    );
    return SupportHelpRes.fromJson(res as Map<String, dynamic>);
  }
}
