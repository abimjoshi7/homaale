// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent extends Equatable {}

class ScheduleEventCreated extends ScheduleEvent {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<TimeOfDay>? startTimeList;
  final List<TimeOfDay>? endTimeList;
  final String? repeatType;
  ScheduleEventCreated({
    this.startDate,
    this.endDate,
    this.startTimeList,
    this.endTimeList,
    this.repeatType,
  });
  @override
  List<Object?> get props => [
        startDate,
        endDate,
        startTimeList,
        endTimeList,
        repeatType,
      ];
}

class ScheduleEventPosted extends ScheduleEvent {
  final CreateScheduleReq createScheduleReq;
  ScheduleEventPosted({
    required this.createScheduleReq,
  });

  @override
  List<Object?> get props => [
        createScheduleReq,
      ];
}

class SingleScheduleLoaded extends ScheduleEvent {
  final String scheduleId;
  SingleScheduleLoaded({required this.scheduleId});
  @override
  List<Object?> get props => [scheduleId];
}

class ScheduleEventEdited extends ScheduleEvent {
  final Map<String, dynamic> data;
  final String id;

  ScheduleEventEdited(
    this.data,
    this.id,
  );
  @override
  List<Object?> get props => [
        data,
        id,
      ];
}
