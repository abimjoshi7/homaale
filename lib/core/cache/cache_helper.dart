import 'dart:developer';

import 'package:dependencies/dependencies.dart';

class CacheHelper {
  static String? accessToken;
  static String? refreshToken;
  static bool? hasProfile;
  static bool isLoggedIn = false;
  static bool? isKycVerified;

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<String?> getCachedString(String key) async =>
      _storage.read(key: key).whenComplete(
            () => log(
              'Successfully retrieved data.',
            ),
          );

  static Future<void> setCachedString(String key, String value) async {
    await _storage.write(key: key, value: value).whenComplete(
          () => log(
            'Successfully cached data.',
          ),
        );
  }

  static Future<void> clearCachedData(String key) async {
    await _storage.delete(
      key: key,
    );
  }

  static Future<void> clearAllCachedData() async {
    accessToken = null;
    refreshToken = null;

    await _storage.delete(key: isLoggedIn.toString());
  }

  Future<void> test() async {}
}
