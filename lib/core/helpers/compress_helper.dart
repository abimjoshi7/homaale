import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';

class CompressHelper {
  final _config = Configuration(
    pngCompression: PngCompression.bestCompression,
    jpgQuality: 30,
  );

  // compress file synchronously
  int compressFileSync(String path) {
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
    return output.sizeInBytes;
  }

  // compress file asynchronously
  Future<int> compressFileAsync(String path) async {
    final file = File(path);

    final input = ImageFile(
      rawBytes: file.readAsBytesSync(),
      filePath: file.path,
    );
    final output = await compressInQueue(
      ImageFileConfiguration(
        input: input,
        config: _config,
      ),
    );

    log('Input size = ${file.lengthSync()}');
    log('Output size = ${output.sizeInBytes}');

    return output.sizeInBytes;
  }
}
