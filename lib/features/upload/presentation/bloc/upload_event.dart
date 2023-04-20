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
  @override
  List<Object?> get props => [];
}

class VideoUploaded extends UploadEvent {
  final bool isCamera;
  VideoUploaded({
    required this.isCamera,
  });
  @override
  List<Object?> get props => [
        isCamera,
      ];
}

class FileUploaded extends UploadEvent {
  @override
  List<Object?> get props => [];
}

class ImageToFilestoreUploaded extends UploadEvent {
  final List<XFile?>? list;

  ImageToFilestoreUploaded({this.list});
  @override
  List<Object?> get props => [
        list,
      ];
}

class VideoToFilestoreUploaded extends UploadEvent {
  final List<XFile?>? list;

  VideoToFilestoreUploaded({this.list});
  @override
  List<Object?> get props => [
        list,
      ];
}
