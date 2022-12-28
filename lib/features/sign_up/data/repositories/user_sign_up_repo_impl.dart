import 'package:cipher/features/sign_up/data/datasources/remote_data_source.dart';
import 'package:cipher/features/sign_up/domain/repositories/user_sign_up_repo.dart';

class UserSignUpRepoImpl implements UserSignUpRepo {
  UserSignUpRepoImpl(this.remoteDataSource);
  final RemoteDataSource remoteDataSource;
  @override
  Future<dynamic> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    final res =
        await remoteDataSource.createUserWithEmailRemote(email, password);
    return res;
  }

  @override
  Future<dynamic> createUserWithPhone({
    required String phoneNumber,
    required String password,
  }) async {
    final res =
        await remoteDataSource.createUserWithPhoneRemote(phoneNumber, password);
    return res;
  }
}
