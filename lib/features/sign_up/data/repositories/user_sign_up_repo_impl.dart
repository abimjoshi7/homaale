import 'package:cipher/features/sign_up/data/datasources/remote_data_source.dart';
import 'package:cipher/features/sign_up/domain/repositories/user_sign_up_repo.dart';
import 'package:dio/dio.dart';

class UserSignUpRepoImpl implements UserSignUpRepo {
  final RemoteDataSource remoteDataSource;

  UserSignUpRepoImpl(this.remoteDataSource);
  @override
  Future<Response> createUserWithEmail(
      {required String email, required String password}) async {
    final res =
        await remoteDataSource.createUserWithEmailRemote(email, password);
    return res;
  }

  @override
  Future<Response> createUserWithPhone(
      {required String phoneNumber, required String password}) async {
    final res =
        await remoteDataSource.createUserWithPhoneRemote(phoneNumber, password);
    return res;
  }
}
