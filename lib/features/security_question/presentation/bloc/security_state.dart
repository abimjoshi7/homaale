import 'package:cipher/features/security_question/data/models/req/security_question_req.dart';
import 'package:cipher/features/security_question/data/models/res/security_answer_res.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';

class SecurityState extends Equatable {
  final TheStates? theState;
  final List<SecurityQuestionReq>? securityQuestionReq;
  final SecurityAnswerRes? securityAnswerRes;

  const SecurityState(
      {this.theState, this.securityQuestionReq, this.securityAnswerRes});

  SecurityState copyWith({
    TheStates? theState,
    final List<SecurityQuestionReq>? securityQuestionReq,
    final SecurityAnswerRes? securityAnswerRes,
  }) {
    return SecurityState(
      theState: theState ?? this.theState,
      securityQuestionReq: securityQuestionReq ?? this.securityQuestionReq,
      securityAnswerRes: securityAnswerRes ?? this.securityAnswerRes,
    );
  }

  @override
  List<Object?> get props {
    return [theState, securityQuestionReq, securityAnswerRes];
  }
}
