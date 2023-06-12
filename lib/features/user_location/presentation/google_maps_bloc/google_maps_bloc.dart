import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/google_maps/data/maps_query_auto_complete_res.dart';
import 'package:cipher/features/google_maps/domain/maps_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dependencies/dependencies.dart';

part 'google_maps_event.dart';
part 'google_maps_state.dart';

class GoogleMapsBloc extends Bloc<GoogleMapsEvent, GoogleMapsState> {
  final _repository = MapsRepository();
  GoogleMapsBloc() : super(GoogleMapsState()) {
    on<GoogleMapsSearchQueryInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(
            theStates: TheStates.loading,
          ),
        );
        await _repository
            .fetchMapAutoCompleteQueries(query: event.query)
            .then((value) => emit(
                  state.copyWith(
                    theStates: TheStates.success,
                    autoCompleteQueries: value,
                  ),
                ));
      } catch (e) {
        emit(state.copyWith(
          theStates: TheStates.failure,
        ));
      }
    });
   
  }
}
