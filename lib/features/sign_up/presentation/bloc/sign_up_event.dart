// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpWithPhoneSelected extends SignUpEvent {
  final String? phone;
  const SignUpWithPhoneSelected({
    this.phone,
  });
  @override
  List<Object?> get props => [phone];
}

class SignUpWithEmailSelected extends SignUpEvent {
  final String? email;
  const SignUpWithEmailSelected({
    this.email,
  });
  @override
  List<Object?> get props => [email];
}

class SignUpWithPhoneInitiated extends SignUpEvent {
  final String phone;
  final String password;
  const SignUpWithPhoneInitiated({
    required this.phone,
    required this.password,
  });
  @override
  List<Object?> get props => [phone, password];
}

class SignUpWithEmailInitiated extends SignUpEvent {
  final String email;
  final String password;
  const SignUpWithEmailInitiated({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [email, password];
}
