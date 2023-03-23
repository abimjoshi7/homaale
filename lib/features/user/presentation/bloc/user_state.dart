part of 'user_bloc.dart';

class UserState extends Equatable {
  final TheStates? theStates;
  final TaskerProfile? taskerProfile;
  const UserState({
    this.theStates = TheStates.initial,
    this.taskerProfile,
  });

  UserState copyWith({
    TheStates? theStates,
    TaskerProfile? taskerProfile,
  }) {
    return UserState(
      theStates: theStates ?? this.theStates,
      taskerProfile: taskerProfile ?? this.taskerProfile,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        taskerProfile,
      ];
}
