// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/core/helpers/compress_helper.dart';
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
  ) : super(const UploadState()) {
    final compressor = CompressHelper();
    on<ImageUploaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.loading,
            ),
          );
          await MultimediaPickHelper.captureMultimedia(
            event.context,
            event.isVideo,
          ).then(
            (value) async {
              if (value != null) {
                if (value.lengthSync() > 5093309) {
                  emit(
                    state.copyWith(
                      isCompressFail: true,
                    ),
                  );
                } else {
                  emit(
                    state.copyWith(
                      isCompressFail: false,
                      imageFileList: [
                        ...state.imageFileList,
                        value.path,
                      ],
                    ),
                  );
                }
              }
            },
          );
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
              if (value != null) {
                emit(
                  state.copyWith(
                    isLoading: true,
                  ),
                );
                List<String> list = [];
                if (state.imageFileList.length == 0) {
                  for (final AssetEntity element in value) {
                    await element.file.then(
                      (value) async {
                        if (value != null) {
                          if (value.lengthSync() < 5093309) {
                            final imageFile =
                                await compressor.compressFileAsync(value.path);
                            list.add(imageFile.path);
                          } else {
                            final imageFile =
                                await compressor.compressFileAsync(value.path);
                            if (imageFile.lengthSync() < 5093309) {
                              list.add(
                                imageFile.path,
                              );
                            } else {
                              emit(
                                state.copyWith(
                                  isCompressFail: true,
                                ),
                              );
                            }
                          }
                        }
                      },
                    );
                  }
                } else {
                  list.addAll(state.imageFileList);
                  for (final AssetEntity element in value) {
                    await element.file.then(
                      (value) async {
                        if (value != null) {
                          if (value.lengthSync() < 5093309) {
                            list.add(value.path);
                          } else {
                            final imageFile =
                                await compressor.compressFileAsync(value.path);
                            if (imageFile.lengthSync() < 5093309) {
                              list.add(
                                imageFile.path,
                              );
                            } else {
                              emit(
                                state.copyWith(
                                  isCompressFail: true,
                                ),
                              );
                            }
                          }
                        }
                      },
                    );
                  }
                }

                emit(
                  state.copyWith(
                    isLoading: false,
                    imageFileList: list,
                    isCompressFail: false,
                  ),
                );
              }
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
              (value) {
                if (value != null && value.lengthSync() < 15093309) {
                  emit(
                    state.copyWith(
                      videoFileList: [
                        ...state.videoFileList,
                        value.path,
                      ],
                    ),
                  );
                } else {
                  emit(
                    state.copyWith(isCompressFail: true),
                  );
                }
              },
            );
          } else {
            await MultimediaPickHelper.captureAssets(
              event.context,
              RequestType.video,
            ).then(
              (value) async {
                if (value != null) {
                  List<String> list = [];
                  if (state.videoFileList.length == 0) {
                    for (final AssetEntity element in value) {
                      await element.file.then(
                        (value) {
                          if (value != null && value.lengthSync() < 15093309) {
                            list.add(value.path);
                          } else {
                            emit(
                              state.copyWith(isCompressFail: true),
                            );
                          }
                        },
                      );
                    }
                  } else {
                    list.addAll(state.videoFileList);
                    for (final AssetEntity element in value) {
                      await element.file.then(
                        (value) {
                          if (value != null && value.lengthSync() < 15093309)
                            list.add(value.path);
                          else
                            emit(
                              state.copyWith(
                                isCompressFail: true,
                              ),
                            );
                        },
                      );
                    }
                  }

                  emit(
                    state.copyWith(
                      videoFileList: list,
                      isCompressFail: false,
                    ),
                  );
                }
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
          if (event.list.length == 0)
            emit(
              state.copyWith(
                isImageUploaded: true,
              ),
            );
          else {
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
                      isImageUploaded: true,
                    ),
                  );
                }
              },
            ).then(
              (_) {
                if (state.isImageUploaded == true)
                  emit(
                    state.copyWith(
                      theStates: TheStates.success,
                    ),
                  );
              },
            );
          }
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
          if (event.list.length == 0)
            emit(
              state.copyWith(
                isVideoUploaded: true,
              ),
            );
          else {
            await repo.fetchFileStore(event.list).then(
              (value) {
                if (value["status"] == "success" && value["data"] != null) {
                  emit(
                    state.copyWith(
                      uploadedVideoList: List<int>.from(
                        value["data"] as Iterable,
                      ),
                      isVideoUploaded: true,
                    ),
                  );
                }
              },
            ).then(
              (_) {
                if (state.isVideoUploaded == true)
                  emit(
                    state.copyWith(
                      theStates: TheStates.success,
                    ),
                  );
              },
            );
          }
        } catch (e) {
          log("UPLOAD TO FILESTORE ERROR: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              uploadedVideoList: [],
              isVideoUploaded: false,
            ),
          );
        }
      },
    );

    on<MultimediaRemoved>(
      (event, emit) async {
        if (event.isVideo == false) {
          List<String> list = [
            ...state.imageFileList,
          ]..removeAt(
              event.selectedIndex,
            );

          emit(
            state.copyWith(
              imageFileList: list,
            ),
          );
        } else {
          List<String> list = [
            ...state.videoFileList,
          ]..removeAt(
              event.selectedIndex,
            );

          emit(
            state.copyWith(
              videoFileList: list,
            ),
          );
        }
      },
    );
  }
}
