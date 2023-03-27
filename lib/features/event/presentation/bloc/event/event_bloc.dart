import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/event/data/models/event.dart';
import 'package:cipher/features/event/data/models/req/create_event_req.dart';
import 'package:cipher/features/event/data/models/res/create_event_res.dart';
import 'package:cipher/features/event/data/repositories/event_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final repo = EventRepository();
  EventBloc() : super(const EventState()) {
    on<EventLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theStates: TheStates.initial,
            ),
          );
          await repo.retrieveEvent(id: event.id).then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    event: Event.fromJson(value),
                    isLoaded: true,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              isLoaded: false,
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
              theStates: TheStates.initial,
            ),
          );
          await repo
              .createEvent(req: event.req)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    isCreated: true,
                    createEventRes: CreateEventRes.fromJson(
                      value,
                    ),
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
              theStates: TheStates.failure,
              isCreated: false,
            ),
          );
        }
      },
    );
  }
}
