import 'dart:developer';
import 'dart:io';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:dependencies/dependencies.dart';

part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit()
      : super(
          ImageUploadInitial(),
        );

  Future<void> uploadImage({
    bool isCamera = false,
    required XFile? imagePath,
  }) async {
    try {
      emit(
        ImageUploadLoading(),
      );

      imagePath = await ImagePickHelper().pickImagePath(
        isCamera: isCamera,
      );
      final response = await DioHelper().postMultiFormData(
        path: imagePath!.path,
        url: 'task/filestore/',
        token: CacheHelper.accessToken,
      );
      if (response['status'] == 'success') {
        emit(
          ImageUploadSuccess(
            list: response['data'] as List<dynamic>,
            imagePathList: [imagePath],
          ),
        );
      }
    } catch (e) {
      log(
        "Image upload failure: $e",
      );
      emit(
        ImageUploadFailure(),
      );
    }
  }

  Future<void> uploadVideo({
    bool isCamera = false,
    required XFile? imagePath,
  }) async {
    try {
      emit(
        ImageUploadLoading(),
      );

      imagePath = await ImagePickHelper().pickVideoPath(
        isCamera: isCamera,
      );
      final response = await DioHelper().postMultiFormData(
        path: imagePath!.path,
        url: 'task/filestore/',
        token: CacheHelper.accessToken,
      );
      if (response['status'] == 'success') {
        emit(
          VideoUploadSuccess(
            list: response['data'] as List<dynamic>,
          ),
        );
      }
    } catch (e) {
      log(
        "Video upload failure: $e",
      );
      emit(
        VideoUploadFailure(),
      );
    }
  }

  Future<void> uploadMultipleImage({
    required List<XFile?>? imagePath,
  }) async {
    try {
      emit(
        ImageUploadLoading(),
      );
      imagePath = await ImagePickHelper().pickMultipleImages();
      final response = await DioHelper().postMultiFormData(
        pathList: imagePath.map((e) => e!.path).toList(),
        url: 'task/filestore/',
        token: CacheHelper.accessToken,
      );
      if (response['status'] == 'success') {
        emit(
          ImageUploadSuccess(
            list: response['data'] as List<dynamic>,
            imagePathList: imagePath.sublist(0, 5),
          ),
        );
      }
    } catch (e) {
      log(
        "Multiple images upload failure: $e",
      );
      emit(
        ImageUploadFailure(),
      );
    }
  }

  Future<void> uploadFile(
    File? filePath,
  ) async {
    try {
      emit(
        ImageUploadLoading(),
      );

      filePath = await FilePickHelper.filePicker();
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
