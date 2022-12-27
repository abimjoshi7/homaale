import 'package:cipher/features/sign_up/domain/repositories/user_sign_up_repo.dart';
import 'package:dio/dio.dart';

class CreateUserWithEmailUsecase {
  final UserSignUpRepo userSignUpRepo;

  CreateUserWithEmailUsecase(this.userSignUpRepo);

  Future<Response> call(String email, String password) async {
    final res = await userSignUpRepo.createUserWithEmail(
        email: email, password: password);
    return res;
  }
}
