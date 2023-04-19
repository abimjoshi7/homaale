import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/image/image_upload_cubit.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ImagePickerDialog extends StatelessWidget {
  final ImageUploadCubit uploadCubit;

  const ImagePickerDialog({super.key, required this.uploadCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageUploadCubit, ImageUploadState>(
      bloc: uploadCubit,
      builder: (context, state) {
        if (state is ImageUploadLoading)
          return Center(
            child: CircularProgressIndicator(
              color: kColorSecondary,
            ),
          );
        return AlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Select image source',
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
                        .uploadImage(
                      isCamera: true,
                    )
                        .whenComplete(
                      () {
                        Navigator.of(context).pop();
                      },
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
                    await uploadCubit.uploadMultipleImage().whenComplete(
                      () {
                        Navigator.of(context).pop();
                      },
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
