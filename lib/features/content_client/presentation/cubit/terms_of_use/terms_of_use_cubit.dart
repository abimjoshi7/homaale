import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/data/model/content_client.dart';
import 'package:cipher/features/content_client/data/repositories/content_client_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'terms_of_use_state.dart';

class TermsOfUseCubit extends Cubit<TermsOfUseState> {
  final _repositories = ContentClientRepositories();
  TermsOfUseCubit() : super(TermsOfUseState());
  final String _storageKey = "kTermsOfUse";

  Future<void> getTermsOfUseStatement() async {
    final String? _storageKeyValue;
    try {
      final response = await _repositories.fetchContentClientStatement(
        slug: 'terms-conditions',
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
            contentClient: x.copyWith(hasdata: true),
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
                (ContentClient.fromJson(jsonDecode(x) as Map<String, dynamic>))
                    .copyWith(hasdata: true),
          ),
        );
      } else {
        emit(
          state.copyWith(
            theStates: TheStates.failure,
            contentClient: const ContentClient(
                content: 'Could not load data.', hasdata: false),
          ),
        );
      }
    }
  }
}
