import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/event/data/models/event.dart';
import 'package:cipher/features/event/data/models/event_availability.dart';
import 'package:cipher/features/event/data/models/req/create_event_req.dart';
import 'package:cipher/features/event/data/models/res/create_event_res.dart';
import 'package:cipher/features/event/data/repositories/event_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final repo = EventRepository();
  EventBloc()
      : super(
          const EventState(),
        ) {
    on<EventLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
              isLoaded: false,
              isCreated: false,
              isDeleted: false,
              isEdited: false,
              isAvailable: false,
            ),
          );
          await repo.retrieveEvent(id: event.id).then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    event: Event.fromJson(value),
                    isLoaded: true,
                    isCreated: false,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isLoaded: false,
              createdEventRes: CreateEventRes(),
              event: Event(),
              isAvailable: false,
              isCreated: false,
            ),
          );
        }
      },
    );

    on<EventCreated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              isCreated: false,
              theStates: TheStates.initial,
            ),
          );
          await repo.createEvent(req: event.req).then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    isCreated: true,
                    createdEventRes: CreateEventRes.fromJson(
                      value,
                    ),
                    entityServiceId: event.req.entityService,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isCreated: false,
            ),
          );
        }
      },
    );

    on<EventAvailabilityChecked>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              isAvailable: false,
            ),
          );
          await repo
              .checkAvailability(
            eventAvailability: event.eventAvailability,
            id: event.id,
          )
              .then(
            (value) {
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  isAvailable: true,
                ),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isAvailable: false,
            ),
          );
        }
      },
    );

    on<EventDeleted>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              isDeleted: false,
            ),
          );
          await repo
              .deleteEvent(event.id)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    isDeleted: true,
                    event: Event(),
                    createdEventRes: CreateEventRes(),
                  ),
                ),
              )
              ;
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isDeleted: false,
            ),
          );
        }
      },
    );

    on<ScheduleDeleted>(
      (event, emit) async {
        try {
          await repo.deleteSchedule(id: event.id).then(
                (value) => emit(
                  state.copyWith(
                    isScheduleDeleted: true,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              isScheduleDeleted: false,
            ),
          );
        }
      },
    );
  }
}
