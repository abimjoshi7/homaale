import 'package:bloc/bloc.dart';
import 'package:cipher/features/utilities/data/models/country_list_res.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:equatable/equatable.dart';

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

          await _repositories.getCountriesList().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  CountryLoadSuccess(
                    list: List<CountryListRes>.from(
                      value.map((e) => CountryListRes.fromJson(e)).toList(),
                    ),
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
