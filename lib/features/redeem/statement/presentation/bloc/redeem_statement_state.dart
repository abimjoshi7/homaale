import 'package:cipher/core/constants/enums.dart';
import 'package:dependencies/dependencies.dart';

import '../../data/models/request_redeem_statement.dart';

class RedeemStatementState extends Equatable {
  final TheStates theState;
  final RequestRedeemStatement? redeemStatement;
  final String? status;

  const RedeemStatementState({
    this.theState = TheStates.initial,
    this.redeemStatement,
    this.status,
  });

  RedeemStatementState copyWith({
    TheStates? theState,
    RequestRedeemStatement? redeemStatement,
    String? status,
    RequestRedeemStatement? earnedStatement,
    RequestRedeemStatement? spentStatement,
  }) {
    return RedeemStatementState(
      theState: theState ?? this.theState,
      redeemStatement: redeemStatement ?? this.redeemStatement,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props {
    return [theState, redeemStatement, status];
  }
}
