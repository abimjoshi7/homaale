part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpRequestedWithEmail extends SignUpEvent {
  const SignUpRequestedWithEmail(this.userModel);
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}

class SignUpRequestedWithPhone extends SignUpEvent {
  const SignUpRequestedWithPhone(this.userModel);
  final UserModel userModel;
  @override
  List<Object?> get props => [userModel];
}
