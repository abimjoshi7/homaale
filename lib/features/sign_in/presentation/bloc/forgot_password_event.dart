// ignore_for_file: public_member_api_docs, sort_constructors_first
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
class changeEmailInitiated extends ForgotPasswordEvent {
  final String email;
  final String password;

  const changeEmailInitiated(this.email, this.password);
  @override
  List<Object?> get props => [email,password];
}

class ForgotPasswordPhoneInitiated extends ForgotPasswordEvent {
  final String phone;

  const ForgotPasswordPhoneInitiated(this.phone);
  @override
  List<Object?> get props => [phone];
}
class changePhoneInitiated extends ForgotPasswordEvent {
  final String phone;
  final String password;

  const changePhoneInitiated(this.phone, this.password);
  @override
  List<Object?> get props => [phone,password];
}

class ForgotPasswordPhoneResetInitiated extends ForgotPasswordEvent {
  final OtpResetVerifyReq otpResetVerifyReq;
  const ForgotPasswordPhoneResetInitiated(
    this.otpResetVerifyReq,
  );
  @override
  List<Object?> get props => [otpResetVerifyReq];
}
