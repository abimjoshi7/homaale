// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'sign_in_bloc.dart';

// abstract class SignInState extends Equatable {
//   const SignInState();

//   @override
//   List<Object> get props => [];
// }

// class SignInPhoneInitial extends SignInState {}

// class SignInEmailInitial extends SignInState {}

// class SignInSuccess extends SignInState {
//   const SignInSuccess({
//     required this.userLoginRes,
//   });
//   final UserLoginRes userLoginRes;

//   @override
//   List<Object> get props => [userLoginRes];

//   Map<String, dynamic> toJson() {
//     return {
//       'value': userLoginRes,
//     };
//   }
// }

// class SignInFailure extends SignInState {}

class SignInState extends Equatable {
  final bool isPhoneNumber;
  final bool hasValidationErrors;
  final TheStates? theStates;
  // final bool isLoggedIn;
  final UserLoginRes? userLoginRes;
  SignInState({
    // this.isLoggedIn = false,
    this.isPhoneNumber = true,
    this.hasValidationErrors = false,
    this.theStates,
    this.userLoginRes,
  });

  SignInState copyWith({
    bool? isPhoneNumber,
    bool? hasValidationErrors,
    TheStates? theStates,
    // bool? isLoggedIn,
    UserLoginRes? userLoginRes,
  }) {
    return SignInState(
      isPhoneNumber: isPhoneNumber ?? this.isPhoneNumber,
      hasValidationErrors: hasValidationErrors ?? this.hasValidationErrors,
      theStates: theStates ?? this.theStates,
      // isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userLoginRes: userLoginRes ?? this.userLoginRes,
    );
  }

  @override
  List<Object?> get props {
    return [
      isPhoneNumber,
      hasValidationErrors,
      theStates,
      // isLoggedIn,
      userLoginRes,
    ];
  }
}
