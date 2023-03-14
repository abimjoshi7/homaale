import 'package:dependencies/dependencies.dart';

part 'preference_state.dart';

class PreferenceCubit extends Cubit<PreferenceState> {
  PreferenceCubit() : super(PreferenceInitial());
}
