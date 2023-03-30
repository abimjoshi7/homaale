// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_event_handler_bloc.dart';

@immutable
abstract class BookEventHandlerEvent extends Equatable {}

class BookEventPicked extends BookEventHandlerEvent {
  final BookEntityServiceReq? req;
  BookEventPicked({
    this.req,
  });
  @override
  List<Object?> get props => [
        req,
      ];
}
