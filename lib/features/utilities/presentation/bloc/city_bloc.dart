import 'package:bloc/bloc.dart';
import 'package:cipher/features/utilities/data/models/city_list_res.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:equatable/equatable.dart';

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

          await _repositories.getCitiesList().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  CityLoadSuccess(
                    list: List<CityListRes>.from(
                      value.map((e) => CityListRes.fromJson(e)).toList(),
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
