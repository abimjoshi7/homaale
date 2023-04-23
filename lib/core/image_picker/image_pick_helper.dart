import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ImagePickHelper {
  final _picker = ImagePicker();
  final cameraPicker = CameraPicker(
    pickerConfig: CameraPickerConfig(
      enableRecording: true,
      enableTapRecording: true,
      enableAudio: true,
    ),
  );

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

  Future<File?> testPick(BuildContext context) async {
    try {
      return await CameraPicker.pickFromCamera(
        context,
        pickerConfig: CameraPickerConfig(
          enableRecording: true,
          enableTapRecording: true,
          enableAudio: true,
          textDelegate: EnglishCameraPickerTextDelegate(),
        ),
      ).then(
        (value) => value?.file,
      );
    } catch (e) {
      log("CAMERA PICK ERROR: $e");
      rethrow;
    }
  }

  Future<List<AssetEntity>?> testPick1(BuildContext context) async {
    try {
      return await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          maxAssets: 5,
          textDelegate: EnglishAssetPickerTextDelegate(),
          requestType: RequestType.video,
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
