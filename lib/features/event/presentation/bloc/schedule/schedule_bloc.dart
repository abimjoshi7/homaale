import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/event/data/models/req/create_schedule_req.dart';
import 'package:cipher/features/event/data/models/res/create_schedule_res.dart';
import 'package:cipher/features/event/data/models/res/single_schedule_res.dart';
import 'package:cipher/features/event/data/repositories/event_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final repo = EventRepository();
  ScheduleBloc()
      : super(
          ScheduleState(),
        ) {
    on<ScheduleEventCreated>(
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

    on<ScheduleEventPosted>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theState: TheStates.initial,
            ),
          );
          await repo
              .createSchedule(
                req: event.createScheduleReq,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    createScheduleRes: CreateScheduleRes.fromJson(
                      value,
                    ),
                    isCreated: true,
                  ),
                ),
              )
              .whenComplete(
                () => emit(
                  state.copyWith(
                    isCreated: false,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theState: TheStates.failure,
              isCreated: false,
            ),
          );
        }
      },
    );
    on<SingleScheduleLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theState: TheStates.loading,
            ),
          );
          await repo.fetchSingleSchedule(id: event.scheduleId).then(
            (value) {
              emit(state.copyWith(
                theState: TheStates.success,
                singleSchedule: value,
              ));
            },
          );
        } catch (e) {
          emit(state.copyWith(
            theState: TheStates.failure,
          ));
        }
      },
    );

    on<ScheduleEventEdited>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              isEdited: false,
            ),
          );
          await repo.editSchedule(event.data, event.id).then(
                (value) => emit(
                  state.copyWith(
                    isEdited: true,
                  ),
                ),
              );
          add(
            SingleScheduleLoaded(
              scheduleId: event.id,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              isEdited: false,
            ),
          );
        }
      },
    );
  }
}
