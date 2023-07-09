// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';

class ImagePickerDialog extends StatelessWidget {
  final UploadBloc bloc;
  final bool? isProfile;
  const ImagePickerDialog({
    Key? key,
    required this.bloc,
    this.isProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc, UploadState>(
      bloc: bloc,
      builder: (context, state) {
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
                  onTap: () {
                    Future.delayed(
                      Duration.zero,
                      () => bloc.add(
                        ImageUploaded(
                          context: context,
                          isVideo: false,
                        ),
                      ),
                    ).whenComplete(
                      () => Navigator.pop(
                        context,
                      ),
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
                  onTap: () {
                    Future.delayed(
                      Duration.zero,
                      () => bloc.add(
                        MultipleImageUploaded(
                          context: context,
                          isProfile: isProfile,
                        ),
                      ),
                    ).whenComplete(
                      () => Navigator.pop(
                        context,
                      ),
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
