part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String? identifierFormFieldValue;
  final bool isPhoneNumber;
  final TheStates? theStates;
  final UserSignUpRes? userSignUpRes;
  final String? errorMsg;

  const SignUpState({
    this.identifierFormFieldValue,
    this.isPhoneNumber = true,
    this.theStates,
    this.userSignUpRes,
    this.errorMsg,
  });

  SignUpState copyWith({
    String? identifierFormFieldValue,
    bool? isPhoneNumber,
    TheStates? theStates,
    UserSignUpRes? userSignUpRes,
    String? errorMsg,
  }) {
    return SignUpState(
      identifierFormFieldValue:
          identifierFormFieldValue ?? this.identifierFormFieldValue,
      isPhoneNumber: isPhoneNumber ?? this.isPhoneNumber,
      theStates: theStates ?? this.theStates,
      userSignUpRes: userSignUpRes ?? this.userSignUpRes,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props {
    return [
      identifierFormFieldValue,
      isPhoneNumber,
      theStates,
      userSignUpRes,
      errorMsg,
    ];
  }
}
