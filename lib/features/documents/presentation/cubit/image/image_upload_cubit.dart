import 'dart:developer';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:dependencies/dependencies.dart';

part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit() : super(ImageUploadInitial());

  Future<void> uploadImage({
    bool isCamera = false,
  }) async {
    try {
      emit(
        ImageUploadLoading(),
      );

      // final imagePath = await MultimediaPickHelper().pickImagePath(
      //   isCamera: isCamera,
      // );
      // final response = await DioHelper().postMultiFormData(
      //   path: imagePath!.path,
      //   url: 'task/filestore/',
      //   token: CacheHelper.accessToken,
      // );
      // if (response['status'] == 'success') {
      //   emit(
      //     ImageUploadSuccess(
      //       list: response['data'] as List<dynamic>,
      //       imagePathList: [imagePath],
      //     ),
      //   );
      // }
    } catch (e) {
      log(e.toString());
      emit(
        ImageUploadFailure(),
      );
    }
  }

  Future<void> uploadVideo({
    bool isCamera = false,
  }) async {
    try {
      emit(
        VideoUploadLoading(),
      );

      //   final imagePath = await MultimediaPickHelper().pickVideoPath(
      //     isCamera: isCamera,
      //   );
      //   final response = await DioHelper().postMultiFormData(
      //     path: imagePath!.path,
      //     url: 'task/filestore/',
      //     token: CacheHelper.accessToken,
      //   );
      //   if (response['status'] == 'success') {
      //     emit(
      //       VideoUploadSuccess(
      //         list: response['data'] as List<dynamic>,
      //       ),
      //     );
      //   }
    } catch (e) {
      emit(
        VideoUploadFailure(),
      );
    }
  }

  Future<void> uploadMultipleImage() async {
    try {
      emit(
        MulitpleImageUploadLoading(),
      );
      // final imagePath = await MultimediaPickHelper().pickMultipleImages();
      // final response = await DioHelper().postMultiFormData(
      //   pathList: imagePath.map((e) => e!.path).toList(),
      //   url: 'task/filestore/',
      //   token: CacheHelper.accessToken,
      // );
      // if (response['status'] == 'success') {
      //   emit(
      //     ImageUploadSuccess(
      //       list: response['data'] as List<dynamic>,
      //       imagePathList: imagePath.sublist(0, 5),
      //     ),
      //   );
      // }
    } catch (e) {
      emit(
        ImageUploadFailure(),
      );
    }
  }

  Future<void> uploadFile() async {
    try {
      emit(
        FileUploadInitial(),
      );

      final filePath = await FilePickHelper.filePicker();
      final response = await DioHelper().postMultiFormData(
        path: filePath!.path,
        url: 'task/filestore/',
        token: CacheHelper.accessToken,
      );
      if (response['status'] == 'success') {
        emit(
          FileUploadSuccess(list: response['data'] as List<dynamic>),
        );
      }
    } catch (e) {
      emit(
        FileUploadFailure(),
      );
    }
  }
}
