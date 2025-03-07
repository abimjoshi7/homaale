// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/features/saved/data/models/req/saved_add_req.dart';
import 'package:cipher/features/saved/data/models/res/saved_add_res.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/saved/data/repositories/saved_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'saved_event.dart';
part 'saved_state.dart';

const throttleDuration = Duration(seconds: 5);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRepository savedRepository;
  SavedBloc({
    required this.savedRepository,
  }) : super(SavedState()) {
    on<SavedListLoaded>(
      (event, emit) async {
        emit(state.copyWith(theStates: TheStates.loading));
        if (!event.newFetch && state.isLastPage) return;
        try {
          if (event.newFetch)
            emit(
              state.copyWith(
                theStates: TheStates.initial,
              ),
            );
          await savedRepository.fetchSavedList(event.type, event.query, 1).then(
            (value) {
              emit(
                state.copyWith(
                  theStates: TheStates.success,
                  savedModelRes: SavedModelRes.fromJson(value),
                ),
              );
              // print("list val: ${state.savedModelRes}");
            },
          );
        } catch (e) {
          log("Saved List Load Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
          );
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );

    on<SavedAdded>(
      (event, emit) async {
        emit(state.copyWith(
            theStates: TheStates.loading,
            idToBeSaved: event.savedAddReq.objectId));
        try {
          await savedRepository
              .addSaved(event.savedAddReq)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    savedAddRes: SavedAddRes.fromJson(value),
                    idToBeSaved: '',
                  ), 
                ),
              )
              .whenComplete(
            () {
              add(
                SavedListLoaded(
                  type: event.savedAddReq.model.toString(),
                ),
              );
            },
          );
        } catch (e) {
          log("Saved Add Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              savedAddRes: SavedAddRes(),
              idToBeSaved: '',
            ),
          );
        }
      },
    );
  }
}
