import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/user_login_req.dart';
import 'package:cipher/networking/models/response/user_login_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInCubitState> {
  SignInCubit() : super(SignInInitial());
  final storage = const FlutterSecureStorage();

  Future<void> initiateSignIn(UserLoginReq userLoginReq) async {
    emit(SignInInitial());
    final z = await DioHelper().postData(
      url: 'user/login/',
      data: userLoginReq.toJson(),
    );
    if (z != null) {
      emit(
        SignInSuccess(
          userLoginRes: UserLoginRes.fromJson(z as Map<String, dynamic>),
        ),
      );
    } else {
      emit(SignInFailure());
    }
  }
}
