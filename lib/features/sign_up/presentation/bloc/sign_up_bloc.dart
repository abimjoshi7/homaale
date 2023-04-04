import 'dart:convert';
import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/sign_up/data/models/user_sign_up_res.dart';
import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignupBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepositories _signUpRepositories;
  SignupBloc(
    this._signUpRepositories,
  ) : super(
          const SignUpState(),
        ) {
    on<SignUpWithPhoneSelected>(
      (event, emit) => emit(
        state.copyWith(
          isPhoneNumber: true,
          theStates: TheStates.initial,
          identifierFormFieldValue: event.phone,
        ),
      ),
    );

    on<SignUpWithEmailSelected>(
      (event, emit) => emit(
        state.copyWith(
          isPhoneNumber: false,
          theStates: TheStates.initial,
          identifierFormFieldValue: event.email,
        ),
      ),
    );

    on<SignUpWithEmailInitiated>(
      (event, emit) async {
        try {
          final x = await _signUpRepositories.initiateSignUpEmail(
            email: event.email,
            password: event.password,
          );
          if (x != null) {
            emit(
              state.copyWith(
                userSignUpRes: x,
                theStates: TheStates.success,
                isPhoneNumber: false,
              ),
            );
          }
        } catch (e) {
          final err = await CacheHelper.getCachedString(kErrorLog);
          final errRes = jsonDecode(err!) as Map<String, dynamic>;
          log("erro test" + errRes.toString());
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              errorMsg: '',
              isPhoneNumber: false,
            ),
          );
        }
      },
    );

    on<SignUpWithPhoneInitiated>(
      (event, emit) async {
        try {
          final x = await _signUpRepositories.initiateSignUpPhone(
            phone: event.phone,
            password: event.password,
          );
          emit(
            state.copyWith(
              userSignUpRes: x,
              theStates: TheStates.success,
              isPhoneNumber: true,
            ),
          );
        } catch (e) {
          final err = await CacheHelper.getCachedString(kErrorLog);
          log("error test log:" + err.toString());
          // final error = jsonDecode(err!).toString();
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              errorMsg: err,
              isPhoneNumber: true,
            ),
          );
        }
      },
    );
  }
}
