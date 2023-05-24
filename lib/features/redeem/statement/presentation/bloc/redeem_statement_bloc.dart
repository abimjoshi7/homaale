import 'package:cipher/features/redeem/statement/data/models/request_redeem_statement.dart';
import 'package:cipher/features/redeem/statement/data/repo/statement_repositories.dart';
import 'package:cipher/features/redeem/statement/presentation/bloc/redeem_statement_event.dart';
import 'package:cipher/features/redeem/statement/presentation/bloc/redeem_statement_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';

class RedeemStatementBloc
    extends Bloc<RedeemStatementEvent, RedeemStatementState> {
  final repositories = StatementRepositories();
  RedeemStatementBloc() : super(const RedeemStatementState()) {
    on<StatementListInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.getRedeemStatementList().then(
              (value) => emit(
                state.copyWith(
                  theState: TheStates.success,
                  redeemStatement: RequestRedeemStatement.fromJson(value),
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
    on<StatementStatusInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.getRedeemStatementStatus(event.status).then(
              (value) => emit(
                state.copyWith(
                  theState: TheStates.success,
                  redeemStatement: RequestRedeemStatement.fromJson(value),
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
