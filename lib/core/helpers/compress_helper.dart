// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:dependencies/dependencies.dart';

class CompressHelper {
  Future<File> compressFileAsync(File file) async {
    File newFile;
    // Get the application directory path
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;

    // Create a new file name and path
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String filePath = '$appDirPath/$fileName.jpeg';

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      filePath,
      quality: 20,
    );

    if (result != null) {
      newFile = File(result.path);
      print('Input size = ${file.lengthSync()}');
      print('Input File Path = ${file.path}');
      print('Output size = ${newFile.lengthSync()}');
      print('Output File Path = ${newFile.path}');

      return newFile;
    } else {
      throw Exception("Compression Error");
    }
  }
}
