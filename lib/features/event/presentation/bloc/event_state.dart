// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'event_bloc.dart';

class EventState extends Equatable {
  final TheStates? theStates;
  final Event? event;
  const EventState({
    this.theStates,
    this.event,
  });

  EventState copyWith({
    TheStates? theStates,
    Event? event,
  }) {
    return EventState(
      theStates: theStates ?? this.theStates,
      event: event ?? this.event,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        event,
      ];
}
