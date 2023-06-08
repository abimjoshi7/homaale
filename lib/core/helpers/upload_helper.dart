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

  Future<void> uploadImage() async {
    bloc.add(
      ImageToFilestoreUploaded(
        list: bloc.state.imageFileList,
      ),
    );
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
    }
  }

  Future uploadVideo() async {
    bloc.add(
      VideoToFilestoreUploaded(
        list: bloc.state.videoFileList,
      ),
    );
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
    }
  }
}
