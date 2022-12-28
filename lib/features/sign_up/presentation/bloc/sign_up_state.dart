part of 'sign_up_bloc.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {
  const SignUpSuccess(this.userModel);
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}

class SignUpFailure extends SignUpState {
  const SignUpFailure(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
