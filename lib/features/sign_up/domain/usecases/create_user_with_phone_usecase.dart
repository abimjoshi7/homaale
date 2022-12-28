import 'package:cipher/features/sign_up/domain/repositories/user_sign_up_repo.dart';

class CreateUserWithPhoneUsecase {
  CreateUserWithPhoneUsecase(this.userSignUpRepo);
  final UserSignUpRepo userSignUpRepo;

  Future<dynamic> call(String phone, String password) async {
    final res = await userSignUpRepo.createUserWithPhone(
      phoneNumber: phone,
      password: password,
    );
    return res;
  }
}
