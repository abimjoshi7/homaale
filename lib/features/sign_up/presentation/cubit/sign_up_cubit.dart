import 'package:cipher/networking/models/response/user_sign_up_res.dart';
import 'package:cipher/networking/network_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.networkHelper) : super(SignUpInitial());
  final NetworkHelper networkHelper;

  Future<void> signUpWithPhone(String phoneNumber, String password) async {
    try {
      final res = await networkHelper.createUserWithPhone(
        phoneNumber: phoneNumber,
        password: password,
      );
      emit(
        SignUpSuccess(
          userSignUpRes: res,
        ),
      );
    } catch (e) {
      emit(
        SignUpFailure(),
      );
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      final res = await networkHelper.createUserWithEmail(
        email: email,
        password: password,
      );
      emit(
        SignUpSuccess(
          userSignUpRes: res,
        ),
      );
    } catch (e) {
      emit(
        SignUpFailure(),
      );
    }
  }
}
