// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_upload_cubit.dart';

@immutable
abstract class ImageUploadState extends Equatable {
  const ImageUploadState();
}

class ImageUploadInitial extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class ImageUploadLoading extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class ImageUploadSuccess extends ImageUploadState {
  const ImageUploadSuccess({
    required this.list,
    this.imagePathList,
  });
  final List<dynamic> list;
  final List<XFile?>? imagePathList;
  @override
  List<Object?> get props => [
        list,
        imagePathList,
      ];
}

class ImageUploadFailure extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class MulitpleImageUploadLoading extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class MultipleImageUploadSuccess extends ImageUploadState {
  const MultipleImageUploadSuccess({
    required this.list,
  });
  final List<dynamic> list;
  @override
  List<Object?> get props => [list];
}

class MultipleImageUploadFailure extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class VideoUploadInitial extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class VideoUploadLoading extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class VideoUploadSuccess extends ImageUploadState {
  const VideoUploadSuccess({
    required this.list,
  });
  final List<dynamic> list;
  @override
  List<Object?> get props => [list];
}

class VideoUploadFailure extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class FileUploadInitial extends ImageUploadState {
  @override
  List<Object?> get props => [];
}

class FileUploadLoading extends ImageUploadState {
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
