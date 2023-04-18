

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _keyDarkMode = 'dark';
  final String _keyLight = 'light';

  Future setDarkMode(String key) async {
    await storage.write(key: _keyDarkMode, value: key);
  }

  Future<String?> getDarkTheme() async {
    return await storage.read(key: _keyDarkMode);
  }

  Future setLightTheme(String key) async {
    await storage.write(key: _keyLight, value: key);
  }

  Future<String?> getLightTheme() async {
    return await storage.read(key: _keyLight);
  }
}
