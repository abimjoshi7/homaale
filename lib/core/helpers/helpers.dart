import 'dart:async';
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<File> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(
    byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
  );

  return file;
}
