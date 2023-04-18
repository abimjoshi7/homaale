part of 'resend_verification_bloc.dart';

@immutable
abstract class ResendVerificationEvent extends Equatable {}

class ResendVerificationWithPhoneInititated extends ResendVerificationEvent {
  final String phone;

  ResendVerificationWithPhoneInititated({required this.phone});
  @override
  List<Object?> get props => [phone];
}

class ResendVerificationWithEmailInitiated extends ResendVerificationEvent {
  final String email;

  ResendVerificationWithEmailInitiated({required this.email});
  @override
  List<Object?> get props => [email];
}
