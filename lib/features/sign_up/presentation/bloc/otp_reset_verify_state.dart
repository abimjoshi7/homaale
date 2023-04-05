// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'otp_reset_verify_bloc.dart';

abstract class OtpResetVerifyState extends Equatable {
  const OtpResetVerifyState();
}

class OtpResetVerifyInitial extends OtpResetVerifyState {
  @override
  List<Object?> get props => [];
}

class OtpResetVerifySuccess extends OtpResetVerifyState {
  final OtpResetVerifyRes successState;
  const OtpResetVerifySuccess({required this.successState});
  @override
  List<Object?> get props => [successState];
}

class OtpResetVerifyFailure extends OtpResetVerifyState {
  final String error;
  const OtpResetVerifyFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}


