// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'schedule_bloc.dart';

class ScheduleState extends Equatable {
  final DateTime? startDate;
  final DateTime? endDate;
  final List<TimeOfDay>? startTimeList;
  final List<TimeOfDay>? endTimeList;
  final String? repeatType;

  ScheduleState({
    this.startDate,
    this.endDate,
    this.startTimeList,
    this.endTimeList,
    this.repeatType,
  });
  @override
  List<Object?> get props {
    return [
      startDate,
      endDate,
      startTimeList,
      endTimeList,
      repeatType,
    ];
  }

  ScheduleState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    List<TimeOfDay>? startTimeList,
    List<TimeOfDay>? endTimeList,
    String? repeatType,
  }) {
    return ScheduleState(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTimeList: startTimeList ?? this.startTimeList,
      endTimeList: endTimeList ?? this.endTimeList,
      repeatType: repeatType ?? this.repeatType,
    );
  }
}
