part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpPhoneInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpEmailInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpWithPhoneSuccess extends SignUpState {
  final UserSignUpRes userSignUpRes;
  const SignUpWithPhoneSuccess({
    required this.userSignUpRes,
  });

  @override
  List<Object?> get props => [userSignUpRes];
}

class SignUpWithEmailSuccess extends SignUpState {
  final UserSignUpRes userSignUpRes;
  const SignUpWithEmailSuccess({
    required this.userSignUpRes,
  });

  @override
  List<Object?> get props => [userSignUpRes];
}

class SignUpFailure extends SignUpState {
  @override
  List<Object?> get props => [];
}
