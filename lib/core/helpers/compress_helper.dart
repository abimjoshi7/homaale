// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';

class CompressHelper {
  final _config = Configuration(
    pngCompression: PngCompression.bestCompression,
    jpgQuality: 15,
    outputType: OutputType.jpg,
  );

  // compress file asynchronously
  Future<File> compressFileAsync(String path) async {
    final inputFile = File(path);

    // Get the application directory path
    Directory appDir = await getApplicationDocumentsDirectory();
    String appDirPath = appDir.path;

    // Create a new file name and path
    String fileName = path.hashCode.toString();
    String filePath = '$appDirPath/$fileName.jpeg';

    final input = ImageFile(
      rawBytes: inputFile.readAsBytesSync(),
      filePath: inputFile.path,
    );
    final output = await compressInQueue(
      ImageFileConfiguration(
        input: input,
        config: _config,
      ),
    );

    File file = await File(filePath);
    await file.writeAsBytes(
      output.rawBytes,
    );

    print('Input size = ${inputFile.lengthSync()}');
    print('Output size = ${output.sizeInBytes}');
    print('File = ${file.path}');
    print('File size = ${file.lengthSync()}');

    return file;
  }
}
