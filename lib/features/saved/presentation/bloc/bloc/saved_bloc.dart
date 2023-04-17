import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/saved/data/models/saved_model_res.dart';
import 'package:dependencies/dependencies.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedState()) {
    on<SavedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
