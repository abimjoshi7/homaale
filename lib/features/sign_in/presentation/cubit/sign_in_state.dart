// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_cubit.dart';

abstract class SignInCubitState extends Equatable {
  const SignInCubitState();
}

class SignInInitial extends SignInCubitState {
  @override
  List<Object?> get props => [];
}

class SignInSuccess extends SignInCubitState {
  final UserLoginRes userLoginRes;
  const SignInSuccess({
    required this.userLoginRes,
  });
  @override
  List<Object?> get props => [userLoginRes];
}

class SignInFailure extends SignInCubitState {
  @override
  List<Object?> get props => [];
}
