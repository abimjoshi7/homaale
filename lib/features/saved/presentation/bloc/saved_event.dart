// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'saved_bloc.dart';

@immutable
abstract class SavedEvent extends Equatable {}

class SavedListLoaded extends SavedEvent {
  final String? type;
  final String? query;
  final bool newFetch;
  SavedListLoaded({this.type,this.query,this.newFetch=false,});
  @override
  List<Object?> get props => [type,query,newFetch];
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
