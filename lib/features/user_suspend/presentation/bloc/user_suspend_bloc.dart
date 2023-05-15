import 'dart:developer';

import 'package:cipher/features/user_suspend/presentation/bloc/user_suspend_event.dart';
import 'package:cipher/features/user_suspend/presentation/bloc/user_suspend_state.dart';
import 'package:dependencies/dependencies.dart';
import '../../../../core/constants/enums.dart';
import '../../data/models/user_account_suspension.dart';
import '../../data/repo/user_suspend_repo.dart';

class UserSuspendBloc extends Bloc<UserSuspendEvent, UserSuspendState> {
  final respositories = UserSuspendRepositories();
  UserSuspendBloc() : super(UserSuspendState()) {
    on<UserSuspendLoaded>(
      (event, emit) async {
        emit(state.copyWith(theStates: TheStates.initial));
        try {
          await respositories
              .fetchSuspendedUser(id: event.userId)
              .then((value) {
            emit(
              state.copyWith(
                theStates: TheStates.success,
                userAccountSuspension: UserAccountSuspension.fromJson(value),
              ),
            );
          });
        } catch (e) {
          log("Item parse error$e");
          emit(state.copyWith(theStates: TheStates.failure));
        }
      },
    );
  }
}
