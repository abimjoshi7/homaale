import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

import '../model/support_ticket_type_options.dart';

class SupportRepository {
  final _dioHelper = DioHelper();

  Future fetchSupportTickets(Map<String, dynamic> queryParams) async {
    final res = await _dioHelper.getDatawithCredential(
      url: '/support/support-ticket/',
      token: CacheHelper.accessToken,
      query: queryParams,
    );
    return res['result'];
  }

  Future<List<SupportTicketTypeOptions>> fetchFeedback() async {
    try {
      final res = await _dioHelper.getDatawithCredential(
        url: 'support/support-ticket-type/options/',
        token: CacheHelper.accessToken,
      );
      final model = List<SupportTicketTypeOptions>.from(
        res
            .map((e) =>
                SupportTicketTypeOptions.fromJson(e as Map<String, dynamic>))
            .toList() as Iterable,
      );
      return model;
    } catch (e) {
      log("Support report details error: $e");
      rethrow;
    }
  }

  Future<Map<String, dynamic>> PostSupportTicketReport(
      String model,
      String description, String reason, String objectId, int type) async {
    try {
      final res = await _dioHelper.postDataWithCredential(
        data: {
          'model': model ?? "",
          'description': description,
          'reason': reason,
          'object_id': objectId,
          'type': type
        },
        url: 'support/support-ticket/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Feedback details error: $e");
      rethrow;
    }
  }
}
