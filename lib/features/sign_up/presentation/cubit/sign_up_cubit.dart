import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/response/user_sign_up_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> initiateSignUpWithPhone(
    String phoneNumber,
    String password,
  ) async {
    emit(SignUpInitial());
    final x = await DioHelper().postData(
      url: 'user/signup/',
      data: {
        'phone': phoneNumber,
        'password': password,
      },
    );
    if (x == null) {
      emit(SignUpFailure());
    } else {
      emit(
        SignUpSuccess(
          userSignUpRes: UserSignUpRes.fromJson(x as Map<String, dynamic>),
        ),
      );
    }
  }

  Future<void> initiateSignUpWithEmail(
    String username,
    String password,
  ) async {
    emit(SignUpInitial());
    final x = await DioHelper().postData(
      url: 'user/signup/',
      data: {
        'email': username,
        'password': password,
      },
    );
    if (x == null) {
      emit(SignUpFailure());
    } else {
      emit(
        SignUpSuccess(
          userSignUpRes: UserSignUpRes.fromJson(x as Map<String, dynamic>),
        ),
      );
    }
  }
}
