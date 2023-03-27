// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_bloc.dart';

@immutable
abstract class ScheduleEvent extends Equatable {}

class ScheduleEventPosted extends ScheduleEvent {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<TimeOfDay>? startTimeList;
  final List<TimeOfDay>? endTimeList;
  final String? repeatType;
  ScheduleEventPosted({
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
