import 'package:cipher/features/sign_in/repositories/sign_in_repository.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/models/response/user_login_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._signInRepository) : super(SignInPhoneInitial()) {
    on<SignInWithPhoneSelected>(
      (event, emit) => emit(
        SignInPhoneInitial(),
      ),
    );
    on<SignInWithEmailSelected>(
      (event, emit) => emit(
        SignInEmailInitial(),
      ),
    );
    on<SignInWithPhoneInitiated>((event, emit) {
      try {
        _signInRepository.initiateSignIn(event.userLoginReq).then(
              (value) => emit(
                SignInWithPhoneSuccess(
                  userLoginRes: value,
                ),
              ),
            );
      } catch (e) {
        print('HAHA');
        emit(
          SignInWithPhoneFailure(
            e.toString(),
          ),
        );
      }
    });
  }
  final SignInRepository _signInRepository;
}
