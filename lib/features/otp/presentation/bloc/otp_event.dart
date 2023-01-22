// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();
}

class OtpResetVerifyInitiated extends OtpEvent {
  final OtpResetVerifyReq otpResetVerifyReq;
  const OtpResetVerifyInitiated({
    required this.otpResetVerifyReq,
  });
  @override
  List<Object?> get props => [otpResetVerifyReq];
}
