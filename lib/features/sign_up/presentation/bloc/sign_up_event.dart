part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpRequestedWithEmail extends SignUpEvent {
  final UserModel userModel;

  const SignUpRequestedWithEmail(this.userModel);
  @override
  List<Object?> get props => [userModel];
}

class SignUpRequestedWithPhone extends SignUpEvent {
  final UserModel userModel;

  const SignUpRequestedWithPhone(this.userModel);
  @override
  List<Object?> get props => [userModel];
}
