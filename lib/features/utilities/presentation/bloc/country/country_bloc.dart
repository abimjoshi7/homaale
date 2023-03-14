import 'package:cipher/features/utilities/data/models/country_model.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final _repositories = UtilitiesRepositories();
  CountryBloc() : super(CountryLoading()) {
    on<CountryLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            CountryLoading(),
          );

          await _repositories.getCountryList().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  CountryLoadSuccess(
                    list: value,
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            CountryLoadFailure(),
          );
        }
      },
    );
  }
}
