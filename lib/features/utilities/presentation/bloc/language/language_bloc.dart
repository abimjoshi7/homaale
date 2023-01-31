import 'package:bloc/bloc.dart';
import 'package:cipher/features/utilities/data/models/language_model.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final repo = UtilitiesRepositories();
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageLoadInitiated>((event, emit) async {
      try {
        await repo.getlanguageList().then((value) {
          if (value.isNotEmpty) {
            emit(
              LanguageLoadSuccess(
                language: value,
              ),
            );
          }
        });
      } catch (e) {
        emit(
          LanguageLoadFailure(),
        );
      }
    });
  }
}
