import 'dart:io';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/core/image_picker/video_picker_dialog.dart';
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
    return BlocConsumer<UploadBloc, UploadState>(
      bloc: widget.uploadBloc,
      listener: (context, state) async {
        if (state.theStates == TheStates.loading &&
            state.imageFileList != null) {
          await Future.delayed(
            Duration.zero,
            () {
              widget.uploadBloc.add(
                ImageToFilestoreUploaded(
                  list: state.imageFileList,
                ),
              );
            },
          ).whenComplete(
            () => Navigator.pop(
              context,
            ),
          );
        }
        if (state.theStates == TheStates.loading &&
            state.videoFileList != null) {
          await Future.delayed(
            Duration.zero,
            () {
              widget.uploadBloc.add(
                VideoToFilestoreUploaded(
                  list: state.videoFileList,
                ),
              );
            },
          ).whenComplete(
            () => Navigator.pop(
              context,
            ),
          );
        }
        if (state.isImageUploaded == true || state.isVideoUploaded == true)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kColorPrimary,
              content: Text(
                "Upload completed successfully.",
              ),
            ),
          );
        if (state.isImageUploaded == false || state.isVideoUploaded == false)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kColorPrimary,
              content: Text(
                "Upload cannot be completed. Please try again.",
              ),
            ),
          );
      },
      builder: (context, state) {
        return CustomFormField(
          label: 'Images',
          rightSection: state.imageFileList == null
              ? null
              : InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ImagePickerDialog(
                        uploadBloc: widget.uploadBloc,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          4,
                        ),
                        child: Icon(
                          Icons.add_circle_outline_sharp,
                          size: 13,
                        ),
                      ),
                      Text(
                        "Add New",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      print(123);
                      print(state.imageFileList);
                    },
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.orange,
                    ),
                  ),
                  addHorizontalSpace(5),
                  const Text(
                    kImageLimit,
                  ),
                ],
              ),
              addVerticalSpace(5),
              state.imageFileList != null
                  ? Container(
                      width: double.infinity,
                      height: 120,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: (state.imageFileList?.length ?? 0) >= 5
                            ? 5
                            : state.imageFileList?.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: SizedBox(
                            width: 120,
                            child: Stack(children: [
                              Positioned.fill(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: Image.file(
                                    File(
                                      state.imageFileList?[index] ?? "",
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0.1,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () async {
                                    await state.imageFileList?.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.disabled_by_default_rounded,
                                    color: kColorSilver.withOpacity(
                                      0.5,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) => ImagePickerDialog(
                            uploadBloc: widget.uploadBloc,
                          ),
                        );
                      },
                      child: CustomDottedContainerStack(
                        theWidget: Text(
                          'Select Images',
                        ),
                      ),
                    ),
              CustomFormField(
                label: 'Videos',
                rightSection: state.videoFileList == null
                    ? null
                    : InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => VideoPickerDialog(
                              uploadBloc: widget.uploadBloc,
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                4,
                              ),
                              child: Icon(
                                Icons.add_circle_outline_sharp,
                                size: 13,
                              ),
                            ),
                            Text(
                              "Add New",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                child: state.videoFileList == null
                    ? InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => VideoPickerDialog(
                              uploadBloc: widget.uploadBloc,
                            ),
                          );
                        },
                        child: CustomDottedContainerStack(
                          theWidget: Text(
                            'Select Videos',
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.grey.shade100,
                        width: double.infinity,
                        height: 120,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.videoFileList?.length ?? 0,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                            ),
                            child: SizedBox(
                              width: 120,
                              child: Stack(children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                    child: VideoPlayerWidget(
                                      videoURL:
                                          state.videoFileList?[index] ?? "",
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0.1,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () async {
                                      await state.videoFileList
                                          ?.removeAt(index);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.disabled_by_default_rounded,
                                      color: kColorSilver.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
