import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  static String? accessToken;
  static String? refreshToken;

  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
  );

  static Future<String?> getCachedString(String key) async => _storage
      .read(key: key)
      .whenComplete(() => log('Succesfully retrieved data.'));

  static Future<void> setCachedString(String key, String value) async {
    await _storage
        .write(key: key, value: value)
        .whenComplete(() => log('Succesfully cached data.'));
  }

  static Future<void> clearCachedData(String key) async {
    await _storage.delete(
      key: key,
    );
  }

  static Future<void> clearAllCachedData() async {
    await _storage.deleteAll();
  }

  // static Future<void> getTokens() async {
  //   await getCachedString(CacheHelper.accessToken)
  //       .then((value) => accessToken = value);
  //   await getCachedString(kRefreshToken).then((value) => refreshToken = value);
  // }

  Future<void> test() async {}
}
