import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_in/models/user_login_req.dart';
import 'package:cipher/features/sign_in/models/user_login_res.dart';

class SignInRepository {
  final _dioHelper = DioHelper();

  Future<UserLoginRes> initiateSignIn(UserLoginReq userLoginReq) async {
    final z = await _dioHelper.postData(
      url: 'user/login/',
      data: userLoginReq.toJson(),
    );
    print(z);
    return UserLoginRes.fromJson(z as Map<String, dynamic>);
    // if (z != null) {
    //   emit(
    //     SignInSuccess(
    //       userLoginRes: UserLoginRes.fromJson(z as Map<String, dynamic>),
    //     ),
    //   );
    // } else {
    //   emit(SignInFailure());
    // }
  }
}
