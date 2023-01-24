part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadSuccess extends UserState {
  final TaskerProfileRetrieveRes user;
  const UserLoadSuccess({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class UserLoadFailure extends UserState {
  @override
  List<Object?> get props => [];
}

class UserAddSuccess extends UserState {
  @override
  List<Object?> get props => [];
}

class UserAddFailure extends UserState {
  @override
  List<Object?> get props => [];
}

class UserEditSuccess extends UserState {
  @override
  List<Object?> get props => [];
}

class UserEditFailure extends UserState {
  @override
  List<Object?> get props => [];
}
