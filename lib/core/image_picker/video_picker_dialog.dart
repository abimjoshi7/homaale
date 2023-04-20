// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';

class VideoPickerDialog extends StatelessWidget {
  final UploadBloc uploadBloc;
  const VideoPickerDialog({
    Key? key,
    required this.uploadBloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadBloc, UploadState>(
      bloc: uploadBloc,
      builder: (context, state) {
        if (state.theStates == TheStates.loading) {
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
                    //! Not working, package issue
                    // await Future.delayed(
                    //   Duration.zero,
                    //   () {
                    //     uploadBloc.add(
                    //       VideoUploaded(
                    //         isCamera: true,
                    //       ),
                    //     );
                    //   },
                    // ).whenComplete(
                    //   () => Navigator.pop(
                    //     context,
                    //   ),
                    // );
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                          heading: "Unavailable! Coming soon...",
                          content: "Working on it.",
                          onTap: () {},
                          isSuccess: false),
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
                    uploadBloc.add(
                      VideoUploaded(
                        isCamera: false,
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
