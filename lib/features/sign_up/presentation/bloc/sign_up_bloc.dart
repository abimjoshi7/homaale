import 'package:cipher/features/sign_up/data/models/user_model.dart';
import 'package:cipher/features/sign_up/domain/usecases/create_user_with_email_usecase.dart';
import 'package:cipher/features/sign_up/domain/usecases/create_user_with_phone_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final CreateUserWithEmailUsecase createUserWithEmailUsecase;
  final CreateUserWithPhoneUsecase createUserWithPhoneUsecase;
  SignUpBloc(this.createUserWithEmailUsecase, this.createUserWithPhoneUsecase)
      : super(SignUpInitial()) {
    on<SignUpRequestedWithEmail>(
      (event, emit) async {
        final res = await _onSignUpRequestedWithEmail(
          event.userModel.email!,
          event.userModel.password!,
        );
        if (res.statusCode == 201) {
          emit(
            SignUpSuccess(
              UserModel.fromJson(res.data),
            ),
          );
        } else {
          emit(SignUpFailure(res.statusMessage!));
        }
      },
    );

    on<SignUpRequestedWithPhone>(
      (event, emit) async {
        final res = await _onSignUpRequestedWithPhone(
          event.userModel.phone!,
          event.userModel.password!,
        );
        if (res.statusCode == 201) {
          emit(
            SignUpSuccess(
              UserModel.fromJson(res.data),
            ),
          );
        } else {
          emit(SignUpFailure(res.statusMessage!));
        }
      },
    );
  }

  Future<Response> _onSignUpRequestedWithEmail(
      String email, String password) async {
    final res = await createUserWithEmailUsecase.call(email, password);
    return res;
  }

  Future<Response> _onSignUpRequestedWithPhone(
      String phone, String password) async {
    final res = await createUserWithPhoneUsecase.call(phone, password);
    return res;
  }
}
