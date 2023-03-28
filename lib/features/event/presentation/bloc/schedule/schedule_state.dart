part of 'schedule_bloc.dart';

class ScheduleState extends Equatable {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<TimeOfDay>? startTimeList;
  final List<TimeOfDay>? endTimeList;
  final String? repeatType;
  final CreateScheduleRes? createScheduleRes;
  final TheStates? theState;
  final bool? isCreated;

  ScheduleState({
    this.startDate,
    this.endDate,
    this.startTimeList,
    this.endTimeList,
    this.repeatType,
    this.createScheduleRes,
    this.theState = TheStates.initial,
    this.isCreated = false,
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
      isCreated,
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
    bool? isCreated,
  }) {
    return ScheduleState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTimeList: startTimeList ?? this.startTimeList,
      endTimeList: endTimeList ?? this.endTimeList,
      repeatType: repeatType ?? this.repeatType,
      createScheduleRes: createScheduleRes ?? this.createScheduleRes,
      theState: theState ?? this.theState,
      isCreated: isCreated ?? this.isCreated,
    );
  }
}
