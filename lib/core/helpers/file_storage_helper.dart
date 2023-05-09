import 'dart:io';

import 'package:dependencies/dependencies.dart';

class FileStorageHelper {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/transaction_data.csv');
  }

  Future<File> writeData(String data) async {
    final file = await _localFile;

    return file.writeAsString(data, mode: FileMode.append);
  }
}
