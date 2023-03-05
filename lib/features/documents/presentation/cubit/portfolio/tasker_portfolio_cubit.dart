import 'package:cipher/features/documents/data/models/tasker_portfolio_req.dart';
import 'package:cipher/features/documents/data/repositories/document_repositories.dart';
import 'package:cipher/features/user/data/models/tasker_profile_retrieve_res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_portfolio_state.dart';

class TaskerPortfolioCubit extends Cubit<TaskerPortfolioState> {
  final repositories = DocumentRepositories();
  TaskerPortfolioCubit() : super(TaskerPortfolioInitial());

  Future<void> addPortfolio(TaskerPortfolioReq taskerPortfolioReq) async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );
      final x = await repositories.addPortfolio(taskerPortfolioReq);

      if (x['status'] == 'success') emit(TaskerAddPortfolioSuccess());
    } catch (e) {
      emit(TaskerAddPortfolioFailure());
    }
  }

  Future<void> getSingleTaskerPortfolio(int id) async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );

      final result = await repositories.retreivePortfolio(id);

      if (result.isNotEmpty) {
        emit(
          TaskerRetrievePortfolioSuccess(
            taskerPortfolioRes: Portfolio.fromJson(result),
          ),
        );
      }
    } catch (e) {
      emit(TaskerRetrievePortfolioFailure());
    }
  }

  Future<void> getPortfolio() async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );

      final result = await repositories.fetchPortfolio();
      final portfolioList = result['result']
          .map((e) => Portfolio.fromJson(e as Map<String, dynamic>))
          .toList();

      if (result.isNotEmpty) {
        emit(
          TaskerGetPortfolioSuccess(
            taskerPortfolioRes: List<Portfolio>.from(portfolioList as Iterable),
          ),
        );
      }
    } catch (e) {
      emit(TaskerGetPortfolioFailure());
    }
  }

  Future<void> editTaskerPortfolio(
    TaskerPortfolioReq taskerPortfolioReq,
    int id,
  ) async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );

      final x = await repositories.editPortfolio(taskerPortfolioReq, id);
      if (x['status'] == 'success') emit(TaskerEditPortfolioSuccess());
      // getTaskerPortfolio();
    } catch (e) {
      emit(TaskerEditPortfolioFailure());
      // getTaskerPortfolio();
    }
  }

  Future<void> deleteTaskerPortfolio(int id) async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );

      await repositories
          .deletePortfolio(id)
          .whenComplete(
            () => emit(
              TaskerDeletePortfolioSuccess(),
            ),
          )
          .then((value) async => getPortfolio());
    } catch (e) {
      emit(TaskerDeletePortfolioFailure());
    }
  }
}
