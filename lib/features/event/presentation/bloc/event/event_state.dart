part of 'event_bloc.dart';

class EventState extends Equatable {
  final TheStates theStates;
  final Event? event;
  final CreateEventRes? createdEventRes;
  final bool isLoaded;
  final bool isCreated;
  final bool isAvailable;
  final bool isDeleted;
  final bool isEdited;
  final String? errMsg;
  final String? entityServiceId;
  // final CreateScheduleRes? createScheduleRes;
  // final bool? isScheduleCreated;
  final bool? isScheduleDeleted;
  const EventState({
    this.theStates = TheStates.initial,
    this.event = null,
    this.createdEventRes = null,
    this.isLoaded = false,
    this.isCreated = false,
    this.isAvailable = false,
    this.isDeleted = false,
    this.isEdited = false,
    this.errMsg,
    this.entityServiceId,
    this.isScheduleDeleted = false,
  });

  EventState copyWith({
    TheStates? theStates,
    Event? event,
    CreateEventRes? createdEventRes,
    bool? isLoaded,
    bool? isCreated,
    bool? isAvailable,
    bool? isDeleted,
    bool? isEdited,
    String? errMsg,
    String? entityServiceId,
    bool? isScheduleDeleted,
  }) {
    return EventState(
      theStates: theStates ?? this.theStates,
      event: event ?? this.event,
      createdEventRes: createdEventRes ?? this.createdEventRes,
      isLoaded: isLoaded ?? this.isLoaded,
      isCreated: isCreated ?? this.isCreated,
      isAvailable: isAvailable ?? this.isAvailable,
      isDeleted: isDeleted ?? this.isDeleted,
      isEdited: isEdited ?? this.isEdited,
      errMsg: errMsg ?? this.errMsg,
      entityServiceId: entityServiceId ?? this.entityServiceId,
      isScheduleDeleted: isScheduleDeleted ?? this.isScheduleDeleted,
    );
  }

  @override
  List<Object?> get props {
    return [
      theStates,
      event,
      createdEventRes,
      isLoaded,
      isCreated,
      isAvailable,
      isDeleted,
      isEdited,
      errMsg,
      entityServiceId,
      isScheduleDeleted,
    ];
  }
}
