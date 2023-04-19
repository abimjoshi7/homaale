// ignore_for_file: public_member_api_docs, sort_constructors_first
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
              // await repo.uploadImage(
              // 	value?.path ?? "",
              // );
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  isImageUploaded: true,
                  imageFile: value,
                ),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isImageUploaded: false,
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
                    theStates: TheStates.success,
                    isMultipleImageUploaded: true,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isMultipleImageUploaded: false,
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
                    theStates: TheStates.success,
                    videoFile: value,
                    isVideoUploaded: true,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isVideoUploaded: false,
            ),
          );
        }
      },
    );
  }
}
