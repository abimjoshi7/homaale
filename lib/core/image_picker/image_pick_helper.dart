import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../features/account_settings/presentation/pages/kyc/models/kyc_model.dart';

class MultimediaPickHelper {
  // final _picker = ImagePicker();
  // final cameraPicker = CameraPicker(
  //   pickerConfig: CameraPickerConfig(
  //     enableRecording: true,
  //     enableTapRecording: true,
  //     enableAudio: true,
  //   ),
  // );

  // Future<XFile?> pickImagePath({
  //   bool isCamera = true,
  // }) async {
  //   final x = await _picker.pickImage(
  //     source: isCamera ? ImageSource.camera : ImageSource.gallery,
  //   );
  //   return x;
  // }

  // Future<XFile?> pickVideoPath({
  //   bool isCamera = true,
  // }) async {
  //   final x = await _picker.pickVideo(
  //     source: isCamera ? ImageSource.camera : ImageSource.gallery,
  //   );
  //   return x;
  // }

  // Future<List<XFile?>> pickMultipleImages() async {
  //   final x = await _picker.pickMultiImage();
  //   return x;
  // }

  static Future<File?> captureMultimedia(
    BuildContext context,
    bool isVideo,
  ) async {
    try {
      return await CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
          onlyEnableRecording: isVideo,
          enableRecording: isVideo,
          enableTapRecording: isVideo,
          enableAudio: isVideo,
          textDelegate: EnglishCameraPickerTextDelegate(),
        ),
      ).then(
        (value) => value?.file,
      );
    } catch (e) {
      log("CAMERA CAPTURE ERROR: $e");
      rethrow;
    }
  }

  static Future<List<AssetEntity>?> captureAssets(
    BuildContext context,
    RequestType type,
  ) async {
    try {
      return await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          maxAssets: 5,
          textDelegate: EnglishAssetPickerTextDelegate(),
          requestType: type,
        ),
      ).then(
        (value) => value,
      );
    } catch (e) {
      log("ASSET PICK ERROR: $e");
      rethrow;
    }
  }
}
