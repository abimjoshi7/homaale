part of 'otp_reset_verify_bloc.dart';

abstract class OtpResetVerifyEvent extends Equatable {
  const OtpResetVerifyEvent();
}

class OtpResetVerifyInitiated extends OtpResetVerifyEvent {
  final OtpResetVerifyReq initiateEvent;
  const OtpResetVerifyInitiated({
    required this.initiateEvent,
  });
  @override
  List<Object?> get props => [initiateEvent];
}

