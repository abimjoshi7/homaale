// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/features/saved/data/models/req/saved_add_req.dart';
import 'package:cipher/features/saved/data/models/res/saved_add_res.dart';
import 'package:cipher/features/saved/data/models/res/saved_model_res.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/saved/data/repositories/saved_repository.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final SavedRepository savedRepository;
  SavedBloc(
    this.savedRepository,
  ) : super(SavedState()) {
    on<SavedListLoaded>(
      (event, emit) async {
        log('calledd');
        emit(state.copyWith(theStates: TheStates.loading));
        try {
          await savedRepository.fetchSavedList(event.type).then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    savedModelRes: SavedModelRes.fromJson(value),
                  ),
                ),
              );
        } catch (e) {
          log("Saved List Load Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              savedModelRes: SavedModelRes(),
            ),
          );
        }
      },
    );

    on<SavedAdded>(
      (event, emit) async {
        emit(state.copyWith(theStates: TheStates.loading));
        try {
          await savedRepository
              .addSaved(event.savedAddReq)
              .then(
                (value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    savedAddRes: SavedAddRes.fromJson(value),
                  ),
                ),
              )
              .whenComplete(() => add(SavedListLoaded(type: event.savedAddReq.model.toString())));
        } catch (e) {
          log("Saved Add Error: $e");
          emit(
            state.copyWith(
              theStates: TheStates.failure,
              savedAddRes: SavedAddRes(),
            ),
          );
        }
      },
    );
  }
}
