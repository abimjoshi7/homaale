// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/data/connected_account.dart';
import 'package:cipher/features/account_settings/data/repositories/connected_account_repo.dart';

part 'connected_account_state.dart';

class ConnectedAccountCubit extends Cubit<ConnectedAccountState> {
  ConnectedAccountCubit(
    this.repo,
  ) : super(
          ConnectedAccountState(),
        );

  final ConnectedAccountRepo repo;

  Future<void> getList() async {
    emit(
      state.copyWith(
        states: TheStates.loading,
      ),
    );
    final x = await repo.getConnectedAccounts();
    emit(
      state.copyWith(
        states: TheStates.success,
        accountList: x,
      ),
    );
  }
}
