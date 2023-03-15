part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
<<<<<<< HEAD
  final String? identifierFormFieldValue;
=======
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
  final bool isPhoneNumber;
  final TheStates? theStates;
  final UserSignUpRes? userSignUpRes;
  final String? errorMsg;

  const SignUpState({
<<<<<<< HEAD
    this.identifierFormFieldValue,
=======
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
    this.isPhoneNumber = true,
    this.theStates,
    this.userSignUpRes,
    this.errorMsg,
  });

  SignUpState copyWith({
<<<<<<< HEAD
    String? identifierFormFieldValue,
=======
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
    bool? isPhoneNumber,
    TheStates? theStates,
    UserSignUpRes? userSignUpRes,
    String? errorMsg,
  }) {
    return SignUpState(
<<<<<<< HEAD
      identifierFormFieldValue:
          identifierFormFieldValue ?? this.identifierFormFieldValue,
=======
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
      isPhoneNumber: isPhoneNumber ?? this.isPhoneNumber,
      theStates: theStates ?? this.theStates,
      userSignUpRes: userSignUpRes ?? this.userSignUpRes,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
<<<<<<< HEAD
  List<Object?> get props {
    return [
      identifierFormFieldValue,
      isPhoneNumber,
      theStates,
      userSignUpRes,
      errorMsg,
    ];
  }
=======
  List<Object?> get props =>
      [isPhoneNumber, theStates, userSignUpRes, errorMsg];
>>>>>>> 3c8e9b4 (fixed bloc state class for sign up)
}
