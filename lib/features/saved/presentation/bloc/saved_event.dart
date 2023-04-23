// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'saved_bloc.dart';

@immutable
abstract class SavedEvent extends Equatable {}

class SavedListLoaded extends SavedEvent {
  final String? type;
  SavedListLoaded({this.type});
  @override
  List<Object?> get props => [type];
}

class SavedAdded extends SavedEvent {
  final SavedAddReq savedAddReq;
  SavedAdded({
    required this.savedAddReq,
  });
  @override
  List<Object?> get props => [
        savedAddReq,
      ];
}
