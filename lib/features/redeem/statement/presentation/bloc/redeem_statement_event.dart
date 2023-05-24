
import 'package:dependencies/dependencies.dart';

abstract class RedeemStatementEvent extends Equatable {
  const RedeemStatementEvent();
}

class StatementListInitiated extends RedeemStatementEvent {

  @override
  List<Object?> get props => [ ];
}
class StatementEarnedInitiated extends RedeemStatementEvent {

  @override
  List<Object?> get props => [ ];
}

class StatementStatusInitiated extends RedeemStatementEvent {
  final String status;

  StatementStatusInitiated({required this.status});

  @override
  List<Object?> get props => [status ];
}

