part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {
  final UserModel userModel;

  const SignUpSuccess(this.userModel);
  @override
  List<Object?> get props => [userModel];
}

class SignUpFailure extends SignUpState {
  final String error;

  const SignUpFailure(this.error);
  @override
  List<Object?> get props => [error];
}
