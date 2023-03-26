import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc()
      : super(
          ScheduleState(),
        ) {
    on<ScheduleEventPosted>(
      (event, emit) {
        emit(
          state.copyWith(
            endDate: event.endDate,
            endTimeList: event.endTimeList,
            repeatType: event.repeatType,
            startDate: event.startDate,
            startTimeList: event.startTimeList,
          ),
        );
      },
    );
  }
}
