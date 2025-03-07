// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_bloc.dart';

class ScheduleState extends Equatable {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<TimeOfDay>? startTimeList;
  final List<TimeOfDay>? endTimeList;
  final String? repeatType;
  final CreateScheduleRes? createScheduleRes;
  final TheStates? theState;
  final SingleScheduleRes? singleSchedule;
  final bool? isCreated;
  final bool? isEdited;

  ScheduleState({
    this.startDate,
    this.endDate,
    this.startTimeList,
    this.endTimeList,
    this.repeatType,
    this.createScheduleRes,
    this.theState = TheStates.initial,
    this.singleSchedule,
    this.isCreated = false,
    this.isEdited = false,
  });
  @override
  List<Object?> get props {
    return [
      startDate,
      endDate,
      startTimeList,
      endTimeList,
      repeatType,
      createScheduleRes,
      theState,
      singleSchedule,
      isCreated,
      isEdited,
    ];
  }

  ScheduleState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    List<TimeOfDay>? startTimeList,
    List<TimeOfDay>? endTimeList,
    String? repeatType,
    CreateScheduleRes? createScheduleRes,
    TheStates? theState,
    SingleScheduleRes? singleSchedule,
    bool? isCreated,
    bool? isEdited,
  }) {
    return ScheduleState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTimeList: startTimeList ?? this.startTimeList,
      endTimeList: endTimeList ?? this.endTimeList,
      repeatType: repeatType ?? this.repeatType,
      createScheduleRes: createScheduleRes ?? this.createScheduleRes,
      theState: theState ?? this.theState,
      singleSchedule: singleSchedule ?? this.singleSchedule,
      isCreated: isCreated ?? this.isCreated,
      isEdited: isEdited ?? this.isEdited,
    );
  }
}
