part of 'otp_bloc.dart';

abstract class OtpFetchState extends Equatable {
  const OtpFetchState();
}

class OtpFetchInitial extends OtpFetchState {
  @override
  List<Object?> get props => [];
}

class OtpFetchSuccess extends OtpFetchState {
  final successState;
  const OtpFetchSuccess({required this.successState});
  @override
  List<Object?> get props => [successState];
}

class OtpFetchFailure extends OtpFetchState {
  final String error;
  const OtpFetchFailure({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
