part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}

class ForgotPasswordEmailInitiated extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordEmailInitiated(this.email);
  @override
  List<Object?> get props => [email];
}

class ForgotPasswordPhoneInitiated extends ForgotPasswordEvent {
  final String phone;

  const ForgotPasswordPhoneInitiated(this.phone);
  @override
  List<Object?> get props => [phone];
}
