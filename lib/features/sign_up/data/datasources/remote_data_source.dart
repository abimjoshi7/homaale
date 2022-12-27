import 'package:cipher/api_service.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<dynamic> createUserWithEmailRemote(String email, String password);
  Future<dynamic> createUserWithPhoneRemote(String phone, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final _dio = Dio();
  @override
  Future createUserWithEmailRemote(String email, String password) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/signup/",
        data: {"email": email, "password": password},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future createUserWithPhoneRemote(String phone, String password) async {
    try {
      final res = await _dio.post(
        "$baseIPSecondary:$portNumber/api/$versionNumber/user/signup/",
        data: {"phone": phone, "password": password},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
