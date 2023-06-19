import 'dart:io';
import 'dart:math';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class FileStorageHelper {
  Future<bool> _checkPermission(TargetPlatform platform) async {
    if (platform == TargetPlatform.android) {
      DeviceInfoPlugin plugin = DeviceInfoPlugin();
      AndroidDeviceInfo android = await plugin.androidInfo;
      if (android.version.sdkInt < 33) {
        if (await Permission.storage.request().isGranted) {
          return true;
        } else if (await Permission.storage.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.audio.request().isDenied) {
          return false;
        }
      } else {
        if (await Permission.photos.request().isGranted) {
          return true;
        } else if (await Permission.photos.request().isPermanentlyDenied) {
          await openAppSettings();
        } else if (await Permission.photos.request().isDenied) {
          return false;
        }
      }
    }
    return false;
  }

  Future<String?> get _localPath async {
    final _permission = await _checkPermission(TargetPlatform.android);
    if (_permission) {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    }
    throw Exception("Cannot find path. Permission or Directory Path Error");
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/${DateTime.now().millisecondsSinceEpoch}.csv');
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;
    return file.writeAsString(data, mode: FileMode.append);
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
