import 'package:dependencies/dependencies.dart';

class ImagePickHelper {
  final _picker = ImagePicker();

  Future<XFile?> pickImagePath() async {
    final x = await _picker.pickImage(source: ImageSource.gallery);
    return x;
  }

  Future<XFile?> pickVideoPath() async {
    final x = await _picker.pickVideo(source: ImageSource.gallery);
    return x;
  }

  Future<List<XFile?>> pickMultipleImages() async {
    final x = await _picker.pickMultiImage();
    return x;
  }
}
