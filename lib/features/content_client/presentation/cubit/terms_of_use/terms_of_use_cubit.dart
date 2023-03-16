import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/data/model/content_client.dart';
import 'package:cipher/features/content_client/data/repositories/content_client_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'terms_of_use_state.dart';

class TermsOfUseCubit extends Cubit<TermsOfUseState> {
  final repositories = ContentClientRepositories();
  TermsOfUseCubit() : super(const TermsOfUseState());

  Future<void> getTermsOfUseStatement() async {
    try {
      final response = await repositories.fetchContentClientStatement(
        slug: 'terms-conditions',
      );
      final x = ContentClient.fromJson(response);
      log('term-of-use: $x');

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
