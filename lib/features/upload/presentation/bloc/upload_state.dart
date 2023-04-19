part of 'upload_bloc.dart';

class UploadState extends Equatable {
  final TheStates? theStates;
  final bool? isImageUploaded;
  final bool? isVideoUploaded;
  final bool? isMultipleImageUploaded;
  final bool? isFileUploaded;
  final XFile? imageFile;
  final XFile? videoFile;
  final List<XFile>? imageFileList;
  const UploadState({
    this.theStates = TheStates.initial,
    this.isImageUploaded,
    this.isVideoUploaded,
    this.isMultipleImageUploaded,
    this.isFileUploaded,
    this.imageFile,
    this.videoFile,
    this.imageFileList,
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      isImageUploaded,
      isVideoUploaded,
      isMultipleImageUploaded,
      isFileUploaded,
      imageFile,
      videoFile,
      imageFileList,
    ];
  }

  UploadState copyWith({
    TheStates? theStates,
    bool? isImageUploaded,
    bool? isVideoUploaded,
    bool? isMultipleImageUploaded,
    bool? isFileUploaded,
    XFile? imageFile,
    XFile? videoFile,
    List<XFile>? imageFileList,
  }) {
    return UploadState(
      theStates: theStates ?? this.theStates,
      isImageUploaded: isImageUploaded ?? this.isImageUploaded,
      isVideoUploaded: isVideoUploaded ?? this.isVideoUploaded,
      isMultipleImageUploaded:
          isMultipleImageUploaded ?? this.isMultipleImageUploaded,
      isFileUploaded: isFileUploaded ?? this.isFileUploaded,
      imageFile: imageFile ?? this.imageFile,
      videoFile: videoFile ?? this.videoFile,
      imageFileList: imageFileList ?? this.imageFileList,
    );
  }
}
