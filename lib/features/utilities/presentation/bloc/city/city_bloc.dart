import 'package:cipher/features/utilities/data/models/city_model.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final _repositories = UtilitiesRepositories();
  CityBloc() : super(CityLoading()) {
    on<CityLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            CityLoading(),
          );

          await _repositories.getCityList().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  CityLoadSuccess(
                    list: value
                      ..sort(
                        (a, b) => a.name!.compareTo(b.name!),
                      ),
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            CityLoadFailure(),
          );
        }
      },
    );
  }
}
