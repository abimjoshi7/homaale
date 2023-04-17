part of 'resend_verification_bloc.dart';

@immutable
abstract class ResendVerificationState extends Equatable {}

class ResendVerificationInitial extends ResendVerificationState {
  @override
  List<Object?> get props => [];
}

class ResendVerificationWithEmailSuccess extends ResendVerificationState {
  @override
  List<Object?> get props => [];
}

class ResendVerificationWithPhoneSuccess extends ResendVerificationState {
  @override
  List<Object?> get props => [];
}

class ResendVerificationFailure extends ResendVerificationState {
  final String? error;
  ResendVerificationFailure({this.error});
  @override
  List<Object?> get props => [error];
}
