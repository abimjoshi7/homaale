part of 'image_upload_cubit.dart';

abstract class ImageUploadState extends Equatable {
  const ImageUploadState();
}

class ImageUploadInitial extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class ImageUploadSuccess extends ImageUploadState {
  const ImageUploadSuccess({
    required this.list,
  });
  final List<dynamic> list;
  @override
  List<Object?> get props => [list];
}

class ImageUploadFailure extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class FileUploadSuccess extends ImageUploadState {
  const FileUploadSuccess({
    required this.list,
  });
  final List<dynamic> list;
  @override
  List<Object?> get props => [list];
}

class FileUploadFailure extends ImageUploadState {
  @override
  List<Object?> get props => [];
}
