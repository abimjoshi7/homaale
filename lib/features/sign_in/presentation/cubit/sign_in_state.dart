// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInState {
  final UserLoginRes userLoginRes;
  const SignInSuccess({
    required this.userLoginRes,
  });
  @override
  List<Object?> get props => [userLoginRes];
}

class SignInFailure extends SignInState {
  @override
  List<Object?> get props => [];
}
