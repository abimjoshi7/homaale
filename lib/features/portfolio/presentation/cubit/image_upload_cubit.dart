import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/core/file_picker/file_pick_helper.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'image_upload_state.dart';

class ImageUploadCubit extends Cubit<ImageUploadState> {
  ImageUploadCubit() : super(ImageUploadInitial());

  Future<void> uploadImage() async {
    try {
      emit(
        ImageUploadInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final imagePath = await ImagePickHelper().pickImagePath();
      final response = await DioHelper().postFormData(
        path: imagePath!.path,
        url: 'task/filestore/',
        token: tokenP ?? token!,
      );
      if (response['status'] == 'success') {
        emit(
          ImageUploadSuccess(
            list: response['data'] as List<dynamic>,
          ),
        );
      }
    } catch (e) {
      emit(
        ImageUploadFailure(),
      );
    }
  }

  Future<void> uploadFile() async {
    try {
      emit(
        ImageUploadInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final filePath = await FilePickHelper.filePicker();
      final response = await DioHelper().postFormData(
        path: filePath!.path,
        url: 'task/filestore/',
        token: tokenP ?? token!,
      );
      if (response['status'] == 'success') {
        emit(
          ImageUploadSuccess(
            list: response['data'] as List<dynamic>,
          ),
        );
      }
    } catch (e) {
      emit(
        ImageUploadFailure(),
      );
    }
  }
}
