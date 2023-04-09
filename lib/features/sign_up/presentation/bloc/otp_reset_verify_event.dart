// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_reset_verify_bloc.dart';

abstract class OtpResetVerifyEvent extends Equatable {
  const OtpResetVerifyEvent();
}

class OtpResetVerifyInitiated extends OtpResetVerifyEvent {
  final Map<String,dynamic> initiateEvent;
  const OtpResetVerifyInitiated({
    required this.initiateEvent,
  });
  @override
  List<Object?> get props => [initiateEvent];
}

class OtpResendSignUpInitiated extends OtpResetVerifyEvent {
  final String phoneNumber;
  OtpResendSignUpInitiated({
    required this.phoneNumber,
  });
  @override
  List<Object?> get props => [phoneNumber];
}
