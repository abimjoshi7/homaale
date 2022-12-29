import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static Future<void> persistString({String? key, String? value}) async {
    final prefs = await SharedPreferences.getInstance();
    final res = await prefs.setString(key!, value!);
    if (res == true) {
      if (kDebugMode) {
        print('Saved Successfully');
      }
    } else {
      if (kDebugMode) {
        print('Error while saving');
      }
    }
  }

  static Future<String?> fetchString({String? key}) async {
    final prefs = await SharedPreferences.getInstance().then(
      (value) => value.getString(
        key!,
      ),
    );

    return prefs;
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
