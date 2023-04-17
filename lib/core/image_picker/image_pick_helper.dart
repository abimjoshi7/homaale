import 'package:dependencies/dependencies.dart';

class ImagePickHelper {
  final _picker = ImagePicker();

  Future<XFile?> pickImagePath({
    bool isCamera = true,
  }) async {
    final x = await _picker.pickImage(

      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    return x;
  }

  Future<XFile?> pickVideoPath({
    bool isCamera = true,
  }) async {
    final x = await _picker.pickVideo(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    return x;
  }

  Future<List<XFile?>> pickMultipleImages() async {
    final x = await _picker.pickMultiImage();
    return x;
  }
}
