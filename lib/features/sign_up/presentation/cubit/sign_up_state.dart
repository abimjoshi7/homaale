// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
}

class SignUpInitial extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpSuccess extends SignUpState {
  final UserSignUpRes userSignUpRes;
  const SignUpSuccess({
    required this.userSignUpRes,
  });

  @override
  List<Object?> get props => [userSignUpRes];
}

class SignUpFailure extends SignUpState {
  @override
  List<Object?> get props => [];
}
