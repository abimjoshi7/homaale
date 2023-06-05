part of 'upload_bloc.dart';

class UploadState extends Equatable {
  final TheStates theStates;
  final bool isImageUploaded;
  final bool isVideoUploaded;
  final bool isFileUploaded;
  final List<String> imageFileList;
  final List<String> videoFileList;
  final List<int> uploadedImageList;
  final List<int> uploadedVideoList;
  final bool isCompressFail;
  const UploadState({
    this.theStates = TheStates.initial,
    this.isImageUploaded = false,
    this.isVideoUploaded = false,
    this.isFileUploaded = false,
    this.imageFileList = const [],
    this.videoFileList = const [],
    this.uploadedImageList = const [],
    this.uploadedVideoList = const [],
    this.isCompressFail = false,
  });

  @override
  List<Object> get props {
    return [
      theStates,
      isImageUploaded,
      isVideoUploaded,
      isFileUploaded,
      imageFileList,
      videoFileList,
      uploadedImageList,
      uploadedVideoList,
      isCompressFail,
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
    bool? isCompressFail,
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
      isCompressFail: isCompressFail ?? this.isCompressFail,
    );
  }
}
