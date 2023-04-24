// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'upload_bloc.dart';

abstract class UploadEvent extends Equatable {
  const UploadEvent();
}

class ImageUploaded extends UploadEvent {
  final bool isCamera;
  ImageUploaded({
    required this.isCamera,
  });
  @override
  List<Object?> get props => [
        isCamera,
      ];
}

class MultipleImageUploaded extends UploadEvent {
  final BuildContext context;
  MultipleImageUploaded({
    required this.context,
  });
  @override
  List<Object?> get props => [
        context,
      ];
}

class VideoUploaded extends UploadEvent {
  final bool isVideo;
  final bool? isCamera;
  final BuildContext context;
  VideoUploaded({
    this.isVideo = true,
    this.isCamera,
    required this.context,
  });
  @override
  List<Object?> get props => [
        isVideo,
        context,
      ];
}

class FileUploaded extends UploadEvent {
  @override
  List<Object?> get props => [];
}

class ImageToFilestoreUploaded extends UploadEvent {
  final List<String>? list;

  ImageToFilestoreUploaded({this.list});
  @override
  List<Object?> get props => [
        list,
      ];
}

class VideoToFilestoreUploaded extends UploadEvent {
  final List<String>? list;

  VideoToFilestoreUploaded({this.list});
  @override
  List<Object?> get props => [
        list,
      ];
}
