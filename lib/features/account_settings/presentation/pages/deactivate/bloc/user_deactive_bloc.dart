import 'package:cipher/features/account_settings/presentation/pages/deactivate/bloc/user_deactive_event.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/bloc/user_deactive_state.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/data/models/user_deactive_model.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../../core/constants/enums.dart';
import '../repo/user_deactive_repositories.dart';

class UserDeactiveBloc extends Bloc<UserDeactiveEvent, UserDeactiveState> {
  final repositories = UserDeactiveRepository();

  UserDeactiveBloc() : super(UserDeactiveState()) {
    on<DeactiveActionPost>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.PostUserDeactiveAction(reason: event.reason).then(
          (value) => emit(
            state.copyWith(
              theState: TheStates.success,
              userDeactiveModel: UserDeactiveModel.fromJson(value),
            ),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
  }
}
