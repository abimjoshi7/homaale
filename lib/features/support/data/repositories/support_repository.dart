import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';

import '../model/support_ticket_type_options.dart';

class SupportRepository {
  final _dioHelper = DioHelper();

  Future<Map<String, dynamic>> fetchSupportTickets() async {
    try {
      final res = await _dioHelper.getDatawithCredential(
        url: 'support/support-ticket/',
        token: CacheHelper.accessToken,
      );
      return res as Map<String, dynamic>;
    } catch (e) {
      log("Support Ticket Fetch Error: $e");
      rethrow;
    }
  }

  Future<List<SupportTicketTypeOptions>> fetchSupportTicketOptions(
      {required String target}) async {
    try {
      final res = await _dioHelper.getDatawithCredential(
        query: {'target': target},
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
      String? model,
      String description,
      String reason,
      String? objectId,
      String typeSlug) async {
    try {
      final res = await _dioHelper.postDataWithCredential(
        data: {
          'model': model,
          'description': description,
          'reason': reason,
          'object_id': objectId,
          'type': typeSlug
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

  Future<Map<String, dynamic>> PostSupportTicketReportWithOutModel(
      String description, String? reason, String typeSlug) async {
    try {
      final res = await _dioHelper.postDataWithCredential(
        data: {'description': description, 'reason': reason, 'type': typeSlug},
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
