part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final bool isPhoneNumber;
  final TheStates? theStates;
  final UserSignUpRes? userSignUpRes;
  final String? errorMsg;

  const SignUpState({
    this.isPhoneNumber = true,
    this.theStates,
    this.userSignUpRes,
    this.errorMsg,
  });

  SignUpState copyWith({
    bool? isPhoneNumber,
    TheStates? theStates,
    UserSignUpRes? userSignUpRes,
    String? errorMsg,
  }) {
    return SignUpState(
      isPhoneNumber: isPhoneNumber ?? this.isPhoneNumber,
      theStates: theStates ?? this.theStates,
      userSignUpRes: userSignUpRes ?? this.userSignUpRes,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props =>
      [isPhoneNumber, theStates, userSignUpRes, errorMsg];
}
