import 'dart:io';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomMultimedia extends StatefulWidget {
  const CustomMultimedia({
    Key? key,
    required this.uploadBloc,
    this.imageCallback,
    this.videoCallback,
    this.imagePath,
    this.videoPath,
  }) : super(key: key);
  final UploadBloc uploadBloc;
  final VoidCallback? imageCallback;
  final VoidCallback? videoCallback;
  final String? imagePath;
  final String? videoPath;

  @override
  State<CustomMultimedia> createState() => _CustomMultimediaState();
}

class _CustomMultimediaState extends State<CustomMultimedia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormField(
          label: 'Images',
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: Colors.orange,
                  ),
                  addHorizontalSpace(5),
                  const Text(
                    kImageLimit,
                  ),
                ],
              ),
              addVerticalSpace(5),
              InkWell(
                onTap: widget.imageCallback,
                child: BlocConsumer<UploadBloc, UploadState>(
                  bloc: widget.uploadBloc,
                  listener: (context, state) {
                    // if (state is ImageUploadSuccess) {
                    //   setState(() {
                    //     imageList = List<int>.from(state.list);
                    //   });
                    // }
                  },
                  builder: (context, state) {
                    if (state.theStates == TheStates.success &&
                        state.isImageUploaded == true) {
                      // final fileList = List.generate(
                      //   state.imagePathList?.length ?? 0,
                      //   (index) => File(state
                      //           .imagePathList?[index]
                      //           ?.path ??
                      //       ""),
                      // );
                      return Container(
                        width: double.infinity,
                        height: 120,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            child: SizedBox(
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Image.file(
                                  File(
                                    state.imageFile?.path ?? "",
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return CustomDottedContainerStack(
                      theWidget: Text(
                        'Select Images',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        CustomFormField(
          label: 'Videos',
          child: InkWell(
            onTap: widget.videoCallback,
            child: BlocBuilder<UploadBloc, UploadState>(
              bloc: widget.uploadBloc,
              builder: (context, state) {
                if (state.theStates == TheStates.success &&
                    state.isVideoUploaded == true)
                  return Container(
                    width: double.infinity,
                    height: 120,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        child: SizedBox(
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            child: VideoPlayerWidget(
                              videoURL: state.videoFile?.path ?? "",
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                return CustomDottedContainerStack(
                  theWidget: Text(
                    'Select Videos',
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
