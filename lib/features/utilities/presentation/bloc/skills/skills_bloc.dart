import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/utilities/data/models/skill_option_model.dart';
import 'package:cipher/features/utilities/data/repositories/utilities_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  final _repository = UtilitiesRepositories();
  SkillsBloc() : super(SkillsState()) {
    on<SkillOptionsLoaded>((event, emit) async {
      try {
        await _repository.getUserSkillOptionsList().then((value) {
          emit(state.copyWith(
            theStates: TheStates.success,
            skillListRes: value,
          ));
        });
      } catch (e) {
        emit(state.copyWith(
          theStates: TheStates.failure,
          skillListRes: [],
        ));
      }
    });
  }
}
