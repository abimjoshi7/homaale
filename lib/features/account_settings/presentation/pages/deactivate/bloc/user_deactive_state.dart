import 'package:dependencies/dependencies.dart';
import '../../../../../../core/constants/enums.dart';
import '../data/models/user_deactive_model.dart';

class UserDeactiveState extends Equatable {
  final TheStates? theState;
  final UserDeactiveModel? userDeactiveModel;
  const UserDeactiveState({this.theState, this.userDeactiveModel});

  UserDeactiveState copyWith({
    TheStates? theState,
    UserDeactiveModel? userDeactiveModel,
  }) {
    return UserDeactiveState(
      theState: theState ?? this.theState,
      userDeactiveModel: userDeactiveModel ?? this.userDeactiveModel,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      userDeactiveModel,
    ];
  }
}
