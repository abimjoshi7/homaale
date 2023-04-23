// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/image/image_upload_cubit.dart';

class VideoPickerDialog extends StatelessWidget {
  final ImageUploadCubit uploadCubit;
  final XFile? imagePath;
  final List<XFile>? imagePathList;
  const VideoPickerDialog({
    Key? key,
    required this.uploadCubit,
    this.imagePath,
    this.imagePathList,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploadCubit, ImageUploadState>(
      builder: (context, state) {
        if (state is ImageUploadLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: kColorSecondary,
            ),
          );
        }
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Select video source',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text("Camera"),
                  leading: Icon(
                    Icons.camera_alt_outlined,
                    color: kColorBlue,
                  ),
                  onTap: () async {
                    await uploadCubit
                        .uploadVideo(isCamera: true, imagePath: imagePath)
                        .whenComplete(
                          () => Navigator.of(context).pop(),
                        );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: Text("Gallery"),
                  leading: Icon(
                    Icons.photo_library_outlined,
                    color: kColorGreen,
                  ),
                  onTap: () async {
                    await uploadCubit
                        .uploadVideo(isCamera: false, imagePath: imagePath)
                        .whenComplete(
                          () => Navigator.of(context).pop(),
                        );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
