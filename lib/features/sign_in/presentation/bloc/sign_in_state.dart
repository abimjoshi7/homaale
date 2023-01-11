part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInPhoneInitial extends SignInState {}

class SignInEmailInitial extends SignInState {}

class SignInWithPhoneSuccess extends SignInState {
  const SignInWithPhoneSuccess({
    required this.userLoginRes,
  });
  final UserLoginRes userLoginRes;

  @override
  List<Object> get props => [userLoginRes];
}

class SignInWithPhoneFailure extends SignInState {
  final String error;

  const SignInWithPhoneFailure(this.error);

  @override
  List<Object> get props => [error];
}

class SignInWithEmailLoading extends SignInState {}

class SignInWithEmailSuccess extends SignInState {}

class SignInWithEmailFailure extends SignInState {}
