import 'package:cipher/features/sign_up/domain/repositories/user_sign_up_repo.dart';

class CreateUserWithEmailUsecase {
  CreateUserWithEmailUsecase(this.userSignUpRepo);
  final UserSignUpRepo userSignUpRepo;

  Future<dynamic> call(String email, String password) async {
    final res = await userSignUpRepo.createUserWithEmail(
      email: email,
      password: password,
    );
    return res;
  }
}
