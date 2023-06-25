import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

enum ImagePage { Profile, Form }

class MultimediaPickHelper {
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
          imageFormatGroup: ImageFormatGroup.jpeg,
          resolutionPreset: ResolutionPreset.low,
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
    ImagePage pageSource,
  ) async {
    try {
      return await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          maxAssets: type == RequestType.image
              ? pageSource == ImagePage.Form
                  ? 5
                  : 1
              : 2,
          textDelegate: EnglishAssetPickerTextDelegate(),
          requestType: type,
        ),
      ).then(
        (value) => value,
      );
    } catch (e) {
      log("ASSET PICK ERROR: $e");
      throw Exception(e.toString());
    }
  }
}
