import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';

class FilePickHelper {
  static Future<File?> filePicker() async {
    File? file;
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
    } else {
      // User canceled the picker
      log('Cancelled action');
    }
    return file;
  }

  void test() {}
}
