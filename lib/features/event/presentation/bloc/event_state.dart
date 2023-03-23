part of 'event_bloc.dart';

class EventState extends Equatable {
  final TheStates? theStates;
  final Event? event;
  final CreateEventRes? createdEventRes;
  final bool? isLoaded;
  final bool? isCreated;
  const EventState({
    this.theStates = TheStates.initial,
    this.event,
    this.createdEventRes,
    this.isLoaded = false,
    this.isCreated = false,
  });

  EventState copyWith({
    TheStates? theStates,
    Event? event,
    CreateEventRes? createEventRes,
    bool? isLoaded,
    bool? isCreated,
  }) {
    return EventState(
      theStates: theStates ?? this.theStates,
      event: event ?? this.event,
      createdEventRes: createdEventRes ?? this.createdEventRes,
      isLoaded: isLoaded ?? this.isLoaded,
      isCreated: isCreated ?? this.isCreated,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        event,
        createdEventRes,
        isLoaded,
        isCreated,
      ];
}
