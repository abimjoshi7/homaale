import 'dart:io';
import 'dart:math';

import 'package:dependencies/dependencies.dart';

class FileStorageHelper {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/${path.hashCode}.csv');
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
