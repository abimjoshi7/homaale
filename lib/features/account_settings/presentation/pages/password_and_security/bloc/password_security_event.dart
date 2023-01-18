// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'password_security_bloc.dart';

abstract class PasswordSecurityEvent extends Equatable {
  const PasswordSecurityEvent();
}

class PasswordSecurityInitiated extends PasswordSecurityEvent {
  final PasswordSecurity passwordSecurity;
  const PasswordSecurityInitiated({
    required this.passwordSecurity,
  });
  @override
  List<Object?> get props => [passwordSecurity];
}
