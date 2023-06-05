// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/file_storage_helper.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/core/image_picker/video_picker_dialog.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class CustomMultimedia extends StatelessWidget {
  final UploadBloc bloc;
  const CustomMultimedia({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadBloc, UploadState>(
      bloc: bloc,
      listenWhen: (previous, current) {
        if (previous.isCompressFail != true && current.isCompressFail == true)
          return true;
        return false;
      },
      listener: (context, state) {
        showDialog(
          context: context,
          builder: (context) => CustomToast(
            heading: "Error",
            content: "File size cannot be higher than 5mb",
            onTap: () {},
            isSuccess: false,
          ),
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            _buildImages(state, context),
            _buildVideos(state, context),
          ],
        );
      },
    );
  }

  Widget _buildImages(UploadState state, BuildContext context) {
    return CustomFormField(
      label: 'Images',
      rightSection: state.imageFileList.isEmpty ? null : _buildAddNew(context),
      child: Column(
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
          state.imageFileList.isNotEmpty
              ? Container(
                  width: double.infinity,
                  height: 120,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: (state.imageFileList.length) >= 5
                        ? 5
                        : state.imageFileList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: SizedBox(
                        width: 120,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: Image.file(
                                  File(
                                    state.imageFileList[index],
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
                                  bloc.add(
                                    MultimediaRemoved(
                                      selectedIndex: index,
                                      isVideo: false,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.disabled_by_default_rounded,
                                  color: kColorSilver.withOpacity(
                                    0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => ImagePickerDialog(
                        bloc: bloc,
                      ),
                    );
                  },
                  child: CustomDottedContainerStack(
                    theWidget: Text(
                      '+ Select Images',
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildAddNew(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ImagePickerDialog(
            bloc: bloc,
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
    );
  }

  Widget _buildVideos(UploadState state, BuildContext context) {
    return CustomFormField(
      label: 'Videos',
      rightSection: state.videoFileList.isEmpty
          ? null
          : InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => VideoPickerDialog(
                    bloc: bloc,
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
              const Icon(
                Icons.info_outline,
                color: Colors.orange,
              ),
              addHorizontalSpace(5),
              const Text(
                kVideoLimit,
              ),
            ],
          ),
          addVerticalSpace(5),
          state.videoFileList.isEmpty
              ? InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => VideoPickerDialog(
                        bloc: bloc,
                      ),
                    );
                  },
                  child: CustomDottedContainerStack(
                    theWidget: Text(
                      '+ Select Videos',
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
                    itemCount: (state.videoFileList.length) >= 2
                        ? 2
                        : state.videoFileList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: SizedBox(
                        width: 120,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                child: VideoPlayerWidget(
                                  videoURL: state.videoFileList[index],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0.1,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  bloc.add(
                                    MultimediaRemoved(
                                      selectedIndex: index,
                                      isVideo: true,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.disabled_by_default_rounded,
                                  color: kColorSilver.withOpacity(
                                    0.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
