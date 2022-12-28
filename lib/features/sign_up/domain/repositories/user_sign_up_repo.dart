abstract class UserSignUpRepo {
  Future<dynamic> createUserWithPhone({
    required String phoneNumber,
    required String password,
  });
  Future<dynamic> createUserWithEmail({
    required String email,
    required String password,
  });
}
