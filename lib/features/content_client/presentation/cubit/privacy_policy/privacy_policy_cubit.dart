import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/data/model/content_client.dart';
import 'package:cipher/features/content_client/data/repositories/content_client_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<PrivacyPolicyState> {
  final repositories = ContentClientRepositories();
  PrivacyPolicyCubit() : super(const PrivacyPolicyState());

  Future<void> getPrivacyPolicyStatement() async {
    try {
      final response = await repositories.fetchContentClientStatement(
        slug: 'privacy-policy',
      );
      final x = ContentClient.fromJson(response);
      log('privacy-policy: $x');

      emit(
        state.copyWith(
          contentClient: x,
          theStates: TheStates.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(theStates: TheStates.failure),
      );
    }
  }
}
