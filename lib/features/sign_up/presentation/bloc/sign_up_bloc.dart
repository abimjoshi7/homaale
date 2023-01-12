import 'package:cipher/features/sign_up/data/repositories/sign_up_repositories.dart';
import 'package:cipher/features/sign_up/data/models/user_sign_up_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignupBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepositories _signUpRepositories;
  SignupBloc(
    this._signUpRepositories,
  ) : super(SignUpPhoneInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignUpWithPhoneSelected>(
      (event, emit) => emit(
        SignUpPhoneInitial(),
      ),
    );

    on<SignUpWithEmailSelected>(
      (event, emit) => emit(
        SignUpEmailInitial(),
      ),
    );

    on<SignUpWithPhoneInitiated>(
      (event, emit) async {
        final x = await _signUpRepositories.initiateSignUpPhone(
          phone: event.phone,
          password: event.password,
        );
        if (x != null) {
          emit(
            SignUpWithPhoneSuccess(
              userSignUpRes: x,
            ),
          );
        } else {
          emit(
            SignUpFailure(),
          );
        }
      },
    );

    on<SignUpWithEmailInitiated>(
      (event, emit) async {
        final x = await _signUpRepositories.initiateSignUpEmail(
          email: event.email,
          password: event.password,
        );
        if (x != null) {
          emit(
            SignUpWithEmailSuccess(
              userSignUpRes: x,
            ),
          );
        } else {
          emit(
            SignUpFailure(),
          );
        }
      },
    );
  }
}
