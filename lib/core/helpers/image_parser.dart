import 'dart:io';

import 'package:dependencies/dependencies.dart';

Future<File?> downloadNetworkImage(String imageUrl) async {
  try {
    final dio = Dio();
    final response = await dio.get(imageUrl,
        options: Options(responseType: ResponseType.bytes));
    if (response.statusCode == 200) {
      // Get the temporary directory using path_provider
      final appDir = await getTemporaryDirectory();

      // Create a new file in the temporary directory with a unique name
      final file =
          File('${appDir.path}/${DateTime.now().millisecondsSinceEpoch}.png');

      // Write the downloaded image to the file
      await file.writeAsBytes(response.data as List<int>);

      return file;
    }
  } catch (e) {
    print('Error downloading image: $e');
  }

  return null;
}

Future<List<File?>> downloadAllNetworkImage(List<String> imagesUrl) async {
  try {
    final fileList = <File?>[];
    final dio = Dio();
    for (var element in imagesUrl) {
      final response = await dio.get(element,
          options: Options(responseType: ResponseType.bytes));
      if (response.statusCode == 200) {
        // Get the temporary directory using path_provider
        final appDir = await getTemporaryDirectory();

        // Create a new file in the temporary directory with a unique name
        final file =
            File('${appDir.path}/${DateTime.now().millisecondsSinceEpoch}.png');

        // Write the downloaded image to the file
        await file.writeAsBytes(response.data as List<int>);

        fileList.add(file);
      }
    }
    return fileList;
  } catch (e) {
    print('Error downloading images list: $e');
  }

  return [];
}
