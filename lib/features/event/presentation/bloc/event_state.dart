part of 'event_bloc.dart';

class EventState extends Equatable {
  final TheStates? theStates;
  final Event? event;
  final bool? isEventLoaded;
  const EventState({
    this.theStates,
    this.event,
    this.isEventLoaded,
  });

  EventState copyWith({
    TheStates? theStates,
    Event? event,
    bool? isEventLoaded,
  }) {
    return EventState(
      theStates: theStates ?? this.theStates,
      event: event ?? this.event,
      isEventLoaded: isEventLoaded ?? this.isEventLoaded,
    );
  }

  @override
  List<Object?> get props => [theStates, event, isEventLoaded];
}
