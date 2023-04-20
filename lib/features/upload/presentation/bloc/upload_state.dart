part of 'upload_bloc.dart';

class UploadState extends Equatable {
  final TheStates? theStates;
  final bool? isImageUploaded;
  final bool? isVideoUploaded;
  final bool? isMultipleImageUploaded;
  final bool? isFileUploaded;
  final List<XFile?>? imageFileList;
  final List<XFile?>? videoFileList;
  const UploadState({
    this.theStates = TheStates.initial,
    this.isImageUploaded,
    this.isVideoUploaded,
    this.isMultipleImageUploaded,
    this.isFileUploaded,
    this.imageFileList,
    this.videoFileList,
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      isImageUploaded,
      isVideoUploaded,
      isMultipleImageUploaded,
      isFileUploaded,
      imageFileList,
      videoFileList,
    ];
  }

  UploadState copyWith({
    TheStates? theStates,
    bool? isImageUploaded,
    bool? isVideoUploaded,
    bool? isMultipleImageUploaded,
    bool? isFileUploaded,
    List<XFile?>? imageFileList,
    List<XFile?>? videoFileList,
  }) {
    return UploadState(
      theStates: theStates ?? this.theStates,
      isImageUploaded: isImageUploaded ?? this.isImageUploaded,
      isVideoUploaded: isVideoUploaded ?? this.isVideoUploaded,
      isMultipleImageUploaded:
          isMultipleImageUploaded ?? this.isMultipleImageUploaded,
      isFileUploaded: isFileUploaded ?? this.isFileUploaded,
      imageFileList: imageFileList ?? this.imageFileList,
      videoFileList: videoFileList ?? this.videoFileList,
    );
  }
}
