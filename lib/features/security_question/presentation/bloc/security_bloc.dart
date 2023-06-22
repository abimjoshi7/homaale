import 'dart:developer';
import 'package:cipher/features/security_question/data/models/req/security_question_req.dart';
import 'package:cipher/features/security_question/data/repo/security_repository.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_event.dart';
import 'package:cipher/features/security_question/presentation/bloc/security_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  final repositories = SecurityRepository();

  SecurityBloc() : super(SecurityState()) {
    on<SecurityInitiated>((event, emit) async {
      try {
        emit(state.copyWith(theState: TheStates.initial));
        await repositories.fetchSecurityQuestion().then(
          (value) {
            emit(state.copyWith(
              theState: TheStates.success,
              securityQuestionReq: List<SecurityQuestionReq>.from(
                value.map((e) => SecurityQuestionReq.fromJson(e)).toList(),
              ),
            ));
          },
        );
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(theState: TheStates.failure));
      }
    });

    on<SecurityAnswerPost>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.addAnswer(event.id, event.answer).then(
              (value) => emit(
                state.copyWith(
                  theState: TheStates.success,
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
  }
}
