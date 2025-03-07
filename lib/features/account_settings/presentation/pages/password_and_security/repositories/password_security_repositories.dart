import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/models/password_security.dart';

class PasswordSecurityRepositories {
  Future<PasswordSecurity> changePassword(
    PasswordSecurity passwordSecurity,
  ) async {
    final res = await DioHelper().postDataWithCredential(
      data: passwordSecurity.toJson(),
      url: 'user/password/change/',
      token: CacheHelper.accessToken,
    );
    return PasswordSecurity.fromJson(res as Map<String, dynamic>);
  }
}
