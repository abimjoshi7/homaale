import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/data/models/tasker_portfolio_req.dart';
import 'package:cipher/features/documents/data/repositories/document_repositories.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:dependencies/dependencies.dart';

part 'tasker_portfolio_state.dart';

class TaskerPortfolioCubit extends Cubit<TaskerPortfolioState> {
  final repositories = DocumentRepositories();
  TaskerPortfolioCubit()
      : super(
          TaskerPortfolioState(),
        );

  Future<void> addPortfolio(TaskerPortfolioReq taskerPortfolioReq) async {
    try {
      emit(
        state.copyWith(
          states: TheStates.loading,
        ),
      );
      final x = await repositories.addPortfolio(taskerPortfolioReq);

      if (x['status'] == 'success')
        emit(
          state.copyWith(
            states: TheStates.success,
            isAdded: true,
          ),
        );
      await getPortfolio();
    } catch (e) {
      emit(
        state.copyWith(
          isAdded: false,
          states: TheStates.failure,
        ),
      );
    }
  }

  Future<void> getSingleTaskerPortfolio(int id) async {
    try {
      emit(state.copyWith(
        states: TheStates.loading,
      ));

      final result = await repositories.retreivePortfolio(id);

      if (result.isNotEmpty) {
        emit(
          state.copyWith(
            states: TheStates.success,
            taskerPortfolio: Portfolio.fromJson(result),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          states: TheStates.failure,
        ),
      );
    }
  }

  Future<void> getPortfolio() async {
    try {
      emit(
        state.copyWith(
          states: TheStates.loading,
        ),
      );

      final result = await repositories.fetchPortfolio();
      final portfolioList = result['result']
          .map((e) => Portfolio.fromJson(e as Map<String, dynamic>))
          .toList();

      if (result.isNotEmpty) {
        emit(
          state.copyWith(
            states: TheStates.success,
            taskerPortfolioList:
                List<Portfolio>.from(portfolioList as Iterable),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          states: TheStates.failure,
        ),
      );
    }
  }

  Future<void> editTaskerPortfolio(
    TaskerPortfolioReq taskerPortfolioReq,
    int id,
  ) async {
    try {
      emit(
        state.copyWith(
          states: TheStates.loading,
        ),
      );

      final x = await repositories.editPortfolio(taskerPortfolioReq, id);
      if (x['status'] == 'success')
        emit(
          state.copyWith(
            isEdited: true,
            states: TheStates.success,
          ),
        );
    } catch (e) {
      emit(
        state.copyWith(
          states: TheStates.failure,
          isEdited: false,
        ),
      );
    }

    await getPortfolio();
  }

  Future<void> deleteTaskerPortfolio(int id) async {
    try {
      emit(
        state.copyWith(
          states: TheStates.loading,
        ),
      );

      await repositories.deletePortfolio(id).whenComplete(
            () => emit(
              state.copyWith(
                isDeleted: true,
                states: TheStates.success,
              ),
            ),
          );
    } catch (e) {
      emit(
        state.copyWith(
          isDeleted: false,
          states: TheStates.failure,
        ),
      );
    }
    await getPortfolio();
  }
}
