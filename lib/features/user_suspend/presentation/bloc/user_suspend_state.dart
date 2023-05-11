import 'package:dependencies/dependencies.dart';

import '../../data/models/user_account_suspension.dart';


import '../../../../core/constants/enums.dart';

class UserSuspendState extends Equatable {
  final TheStates? theStates;
  final UserAccountSuspension? userAccountSuspension;
  const UserSuspendState({
    this.theStates,
    this.userAccountSuspension,
  });

  UserSuspendState copyWith({
    TheStates? theStates,
    UserAccountSuspension? userAccountSuspension,
  }) {
    return UserSuspendState(
      theStates: theStates ?? this.theStates,
      userAccountSuspension:
          userAccountSuspension ?? this.userAccountSuspension,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        userAccountSuspension,
      ];
}
