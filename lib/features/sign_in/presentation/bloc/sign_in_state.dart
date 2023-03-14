part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInPhoneInitial extends SignInState {}

class SignInEmailInitial extends SignInState {}

class SignInSuccess extends SignInState {
  const SignInSuccess({
    required this.userLoginRes,
  });
  final UserLoginRes userLoginRes;

  @override
  List<Object> get props => [userLoginRes];

  Map<String, dynamic> toJson() {
    return {
      'value': userLoginRes,
    };
  }
}

class SignInFailure extends SignInState {}
