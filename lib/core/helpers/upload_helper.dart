// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';

class UploadHelper {
  final UploadBloc bloc;
  final BuildContext context;
  UploadHelper({
    required this.bloc,
    required this.context,
  });

  Future<void> _upload() async {
    await _uploadImage();
    await _uploadVideo();
  }

  Future<void> _uploadImage() async {
    if (bloc.state.isImageUploaded || bloc.state.imageFileList.isEmpty) return;
    if (!bloc.state.isImageUploaded) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      bloc.add(
        ImageToFilestoreUploaded(
          list: bloc.state.imageFileList,
        ),
      );
      _uploadImage();
    }

    // ..add(
    //   VideoToFilestoreUploaded(
    //     list: uploadBloc.state.videoFileList,
    //   ),
    // )
    // ..add(
    //   ImageToFilestoreUploaded(
    //     list: uploadBloc.state.imageFileList,
    //   ),
    // );

    // await Future.delayed(
    //   Duration(
    //     seconds: 15,
    //   ),
    // );
  }

  Future _uploadVideo() async {
    if (bloc.state.isVideoUploaded || bloc.state.videoFileList.isEmpty) return;
    if (!bloc.state.isVideoUploaded) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );

      bloc.add(
        VideoToFilestoreUploaded(
          list: bloc.state.videoFileList,
        ),
      );
      _uploadVideo();
    }
  }

  Future<void> upload() => _upload();
  Future<void> uploadImage() => _uploadImage();
  Future<void> uploadVideo() => _uploadVideo();
}
