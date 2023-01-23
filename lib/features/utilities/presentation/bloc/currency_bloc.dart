import 'package:bloc/bloc.dart';
import 'package:cipher/features/utilities/data/models/currency_list_res.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final _repositories = UtilitiesRepositories();

  CurrencyBloc() : super(CurrencyLoading()) {
    on<CurrencyLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            CurrencyLoading(),
          );

          await _repositories.getCurrencyList().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  CurrencyLoadSuccess(
                    currencyListRes: List<CurrencyListRes>.from(
                      value.map((e) => CurrencyListRes.fromJson(e)).toList(),
                    ),
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            CurrencyLoadFailure(),
          );
        }
      },
    );
  }
}
