part of 'user_bloc.dart';

class UserState extends Equatable {
  final TheStates? theStates;
  final TaskerProfile? taskerProfile;
  final bool? isEdited;
  const UserState({
    this.theStates = TheStates.initial,
    this.taskerProfile,
    this.isEdited = false,
  });

  UserState copyWith({
    TheStates? theStates,
    TaskerProfile? taskerProfile,
    bool? isEdited,
  }) {
    return UserState(
      theStates: theStates ?? this.theStates,
      taskerProfile: taskerProfile ?? this.taskerProfile,
      isEdited: isEdited ?? this.isEdited,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        taskerProfile,
        isEdited,
      ];
}
