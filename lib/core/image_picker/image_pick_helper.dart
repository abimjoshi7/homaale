import 'package:image_picker/image_picker.dart';

class ImagePickHelper {
  final _picker = ImagePicker();

  Future<XFile?> pickImagePath() async {
    final x = await _picker.pickImage(source: ImageSource.gallery);
    return x;
  }
}
