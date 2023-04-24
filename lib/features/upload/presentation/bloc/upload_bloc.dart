// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/upload/data/repositories/upload_respositoy.dart';
import 'package:flutter/widgets.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final UploadRepository repo;
  UploadBloc(
    this.repo,
  ) : super(UploadState()) {
    on<ImageUploaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          //     .pickImage(
          //   source: event.isCamera == false
          //       ? ImageSource.camera
          //       : ImageSource.gallery,
          // )
          //     .then(
          //   (value) async {
          //     emit(
          //       state.copyWith(
          //         imageFileList: [
          //           value,
          //         ],
          //       ),
          //     );
          //   },
          // );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isImageUploaded: false,
              imageFileList: [],
            ),
          );
        }
      },
    );

    on<MultipleImageUploaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await MultimediaPickHelper.captureAssets(
            event.context,
            RequestType.image,
          ).then(
            (value) async {
              List<String> list = [];
              if (state.imageFileList == null ||
                  state.imageFileList?.length == 0) {
                for (final AssetEntity element in value ?? []) {
                  await element.file.then(
                    (value) {
                      if (value != null) list.add(value.path);
                    },
                  );
                }
              } else {
                list.addAll(state.imageFileList as List<String>);
                for (final AssetEntity element in value ?? []) {
                  await element.file.then(
                    (value) {
                      if (value != null) list.add(value.path);
                    },
                  );
                }
              }

              emit(
                state.copyWith(
                  imageFileList: list,
                ),
              );
            },
          );
        } catch (e) {
          log("UPLOAD ERROR: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              imageFileList: [],
            ),
          );
        }
      },
    );

    on<VideoUploaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          if (event.isCamera == true) {
            await MultimediaPickHelper.captureMultimedia(
              event.context,
              event.isVideo,
            ).then(
              (value) => emit(
                state.copyWith(
                  videoFileList: [
                    value?.path ?? "",
                  ],
                ),
              ),
            );
          } else {
            await MultimediaPickHelper.captureAssets(
              event.context,
              RequestType.video,
            ).then(
              (value) async {
                List<String> list = [];
                if (state.videoFileList == null ||
                    state.videoFileList?.length == 0) {
                  for (final AssetEntity element in value ?? []) {
                    await element.file.then(
                      (value) {
                        if (value != null) list.add(value.path);
                      },
                    );
                  }
                } else {
                  list.addAll(state.videoFileList as List<String>);
                  for (final AssetEntity element in value ?? []) {
                    await element.file.then(
                      (value) {
                        if (value != null) list.add(value.path);
                      },
                    );
                  }
                }

                emit(
                  state.copyWith(
                    videoFileList: list,
                  ),
                );
              },
            );
          }
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              videoFileList: [],
            ),
          );
        }
      },
    );

    on<ImageToFilestoreUploaded>(
      (event, emit) async {
        try {
          await repo
              .fetchFileStore(
            event.list,
          )
              .then(
            (value) {
              if (value["status"] == "success" && value["data"] != null) {
                emit(
                  state.copyWith(
                    uploadedImageList: List<int>.from(
                      value["data"] as Iterable,
                    ),
                    theStates: TheStates.success,
                    isImageUploaded: true,
                  ),
                );
              }
            },
          );
        } catch (e) {
          log("UPLOAD TO FILESTORE ERROR: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isImageUploaded: false,
              uploadedImageList: [],
            ),
          );
        }
      },
    );

    on<VideoToFilestoreUploaded>(
      (event, emit) async {
        try {
          await repo.fetchFileStore(event.list).then(
            (value) {
              if (value["status"] == "success" && value["data"] != null) {
                emit(
                  state.copyWith(
                    uploadedVideoList: List<int>.from(
                      value["data"] as Iterable,
                    ),
                    theStates: TheStates.success,
                    isVideoUploaded: true,
                  ),
                );
              }
            },
          );
        } catch (e) {
          log("UPLOAD TO FILESTORE ERROR: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              uploadedImageList: [],
              isVideoUploaded: false,
            ),
          );
        }
      },
    );
  }
}
