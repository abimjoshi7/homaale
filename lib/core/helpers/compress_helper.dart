// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';

class CompressHelper {
  final _config = Configuration(
    pngCompression: PngCompression.bestCompression,
    jpgQuality: 30,
    outputType: OutputType.jpg,
  );

  // compress file synchronously
  void compressFileSync(String path) {
    final file = File(path);

    final input = ImageFile(
      rawBytes: file.readAsBytesSync(),
      filePath: file.path,
    );
    final output = compress(
      ImageFileConfiguration(
        input: input,
        config: _config,
      ),
    );

    log('Input size = ${file.lengthSync()}');
    log('Output size = ${output.sizeInBytes}');
  }

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

    log('Input size = ${inputFile.lengthSync()}');
    log('Output size = ${output.sizeInBytes}');
    print('File = ${file.path}');
    print('File size = ${file.lengthSync()}');

    return file;
  }
}
