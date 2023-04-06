import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/image/image_upload_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class VideoPickerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select video source',
        style: kPurpleText16,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WidgetText(
              label: "Camera",
              widget: Icon(
                Icons.camera_alt_outlined,
                color: kColorBlue,
              ),
              callback: () async {
                await context
                    .read<ImageUploadCubit>()
                    .uploadVideo(
                      isCamera: true,
                    )
                    .whenComplete(
                      () => Navigator.of(context).pop(),
                    );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WidgetText(
              label: "Gallery",
              widget: Icon(
                Icons.photo_library_outlined,
                color: kColorGreen,
              ),
              callback: () async {
                await context
                    .read<ImageUploadCubit>()
                    .uploadVideo(
                      isCamera: false,
                    )
                    .whenComplete(
                      () => Navigator.of(context).pop(),
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
