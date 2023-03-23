// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();
}

class EventLoaded extends EventEvent {
  final String id;
  const EventLoaded({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}

class EventCreated extends EventEvent {
  final CreateEventReq req;

  EventCreated(this.req);

  @override
  List<Object?> get props => [
        req,
      ];
}
