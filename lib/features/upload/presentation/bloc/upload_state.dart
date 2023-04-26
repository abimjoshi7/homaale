// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'upload_bloc.dart';

class UploadState extends Equatable {
  final TheStates? theStates;
  final bool? isImageUploaded;
  final bool? isVideoUploaded;
  final bool? isFileUploaded;
  final List<String>? imageFileList;
  final List<String>? videoFileList;
  final List<int>? uploadedImageList;
  final List<int>? uploadedVideoList;
  UploadState({
    this.theStates,
    this.isImageUploaded,
    this.isVideoUploaded,
    this.isFileUploaded,
    this.imageFileList,
    this.videoFileList,
    this.uploadedImageList,
    this.uploadedVideoList,
  });

  const UploadState.initial({
    this.imageFileList = const [],
    this.isFileUploaded = false,
    this.isImageUploaded = false,
    this.isVideoUploaded = false,
    this.theStates = TheStates.initial,
    this.uploadedImageList = const [],
    this.uploadedVideoList = const [],
    this.videoFileList = const [],
  });

  @override
  List<Object?> get props {
    return [
      theStates,
      isImageUploaded,
      isVideoUploaded,
      isFileUploaded,
      imageFileList,
      videoFileList,
      uploadedImageList,
      uploadedVideoList,
    ];
  }

  UploadState copyWith({
    TheStates? theStates,
    bool? isImageUploaded,
    bool? isVideoUploaded,
    bool? isFileUploaded,
    List<String>? imageFileList,
    List<String>? videoFileList,
    List<int>? uploadedImageList,
    List<int>? uploadedVideoList,
  }) {
    return UploadState(
      theStates: theStates ?? this.theStates,
      isImageUploaded: isImageUploaded ?? this.isImageUploaded,
      isVideoUploaded: isVideoUploaded ?? this.isVideoUploaded,
      isFileUploaded: isFileUploaded ?? this.isFileUploaded,
      imageFileList: imageFileList ?? this.imageFileList,
      videoFileList: videoFileList ?? this.videoFileList,
      uploadedImageList: uploadedImageList ?? this.uploadedImageList,
      uploadedVideoList: uploadedVideoList ?? this.uploadedVideoList,
    );
  }
}
