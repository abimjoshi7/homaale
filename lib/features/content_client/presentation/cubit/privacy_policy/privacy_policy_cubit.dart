import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/data/model/content_client.dart';
import 'package:cipher/features/content_client/data/repositories/content_client_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  final _repositories = ContentClientRepositories();
  PrivacyPolicyCubit() : super(const PrivacyPolicyState());
  final String _storageKey = "kPrivacyPolicy";

  Future<void> getPrivacyPolicyStatement() async {
    final String? _storageKeyValue;
    try {
      final response = await _repositories.fetchContentClientStatement(
        slug: 'privacy-policy',
      );
      final ContentClient x = ContentClient.fromJson(response);

      if (x.id != null) {
        _storageKeyValue = jsonEncode(x.toJson());
        await _repositories.storeCachedContentClientStatement(
          storageKey: _storageKey,
          storageKeyValue: _storageKeyValue,
        );
        emit(
          state.copyWith(
            contentClient: x,
            theStates: TheStates.success,
          ),
        );
      }
    } catch (e) {
      final String? x = await _repositories.fetchCachedContentClientStatement(
        storageKey: _storageKey,
      );
      if (x != null) {
        emit(
          state.copyWith(
            theStates: TheStates.failure,
            contentClient:
                ContentClient.fromJson(jsonDecode(x) as Map<String, dynamic>),
          ),
        );
      } else {
        emit(
          state.copyWith(
            theStates: TheStates.failure,
            contentClient: const ContentClient(content: 'Could not load data.'),
          ),
        );
      }
    }
  }
}
