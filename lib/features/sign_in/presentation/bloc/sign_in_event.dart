// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInWithPhoneSelected extends SignInEvent {}

class SignInWithEmailSelected extends SignInEvent {}

class SignInWithPhoneInitiated extends SignInEvent {
  const SignInWithPhoneInitiated({
    required this.userLoginReq,
  });
  final UserLoginReq userLoginReq;
}

class SignInWithEmailInitiated extends SignInEvent {
  const SignInWithEmailInitiated({
    required this.userLoginReq,
  });
  final UserLoginReq userLoginReq;
}

class SignOutInitiated extends SignInEvent {}

class SignInValErrorStatusChanged extends SignInEvent {
  // final bool hasValidationErrors;
  // SignInValErrorStatusChanged({
  //   required this.hasValidationErrors,
  // });
}
