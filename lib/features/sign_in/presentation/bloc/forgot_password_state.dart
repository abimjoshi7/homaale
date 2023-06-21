part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}
class changePhoneInitial extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordWithEmailSuccess extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordWithPhoneSuccess extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;
  const ForgotPasswordFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class ForgotPasswordResetSuccess extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}
class changeEmailSuccess extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}
class changePhoneSuccess extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class ForgotPasswordResetFailure extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}

class changePhoneFailure extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}
class changeEmailFailure extends ForgotPasswordState {
  @override
  List<Object?> get props => [];
}
