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

class EventAvailabilityChecked extends EventEvent {
  final EventAvailability eventAvailability;
  final String id;
  EventAvailabilityChecked({
    required this.eventAvailability,
    required this.id,
  });

  @override
  List<Object?> get props => [
        eventAvailability,
        id,
      ];
}

class EventEdited extends EventEvent {
  final String id;
  final Map<String, dynamic> data;
  EventEdited({
    required this.id,
    required this.data,
  });

  @override
  List<Object?> get props => [
        id,
        data,
      ];
}

class EventDeleted extends EventEvent {
  final String id;
  EventDeleted({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}

class ScheduleDeleted extends EventEvent {
  final String id;
  ScheduleDeleted({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
