// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'password_security_bloc.dart';

abstract class PasswordSecurityState extends Equatable {
  const PasswordSecurityState();
}

class PasswordSecurityInitial extends PasswordSecurityState {
  @override
  List<Object?> get props => [];
}

class PasswordSecuritySuccess extends PasswordSecurityState {
  final PasswordSecurity passwordSecurity;
  const PasswordSecuritySuccess({
    required this.passwordSecurity,
  });
  @override
  List<Object?> get props => [passwordSecurity];
}

class PasswordSecurityFailure extends PasswordSecurityState {
  @override
  List<Object?> get props => [];
}
