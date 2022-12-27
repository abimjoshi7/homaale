import 'package:cipher/features/sign_up/domain/repositories/user_sign_up_repo.dart';
import 'package:dio/dio.dart';

class CreateUserWithPhoneUsecase {
  final UserSignUpRepo userSignUpRepo;

  CreateUserWithPhoneUsecase(this.userSignUpRepo);

  Future<Response> call(String phone, String password) async {
    final res = await userSignUpRepo.createUserWithPhone(
        phoneNumber: phone, password: password);
    return res;
  }
}
