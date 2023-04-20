// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/upload/data/repositories/upload_respositoy.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final ImagePicker picker;
  final UploadRepository repo;
  UploadBloc(
    this.picker,
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
          await picker
              .pickImage(
            source: event.isCamera == true
                ? ImageSource.camera
                : ImageSource.gallery,
          )
              .then(
            (value) async {
              emit(
                state.copyWith(
                  imageFileList: [
                    value,
                  ],
                ),
              );
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
          await picker.pickMultiImage().then(
                (value) => emit(
                  state.copyWith(
                    imageFileList: value,
                  ),
                ),
              );
        } catch (e) {
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
          await picker
              .pickVideo(
                source: event.isCamera == true
                    ? ImageSource.camera
                    : ImageSource.gallery,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    videoFileList: [
                      value,
                    ],
                  ),
                ),
              );
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
              isImageUploaded: false,
              uploadedImageList: [],
              isVideoUploaded: true,
            ),
          );
        }
      },
    );
  }
}
