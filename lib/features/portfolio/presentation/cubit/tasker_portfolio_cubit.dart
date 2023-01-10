import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/tasker_portfolio_req.dart';
import 'package:cipher/networking/models/response/tasker_portfolio.res.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tasker_portfolio_state.dart';

class TaskerPortfolioCubit extends Cubit<TaskerPortfolioState> {
  TaskerPortfolioCubit() : super(TaskerPortfolioInitial());

  Future<void> addPortfolio(TaskerPortfolioReq taskerPortfolioReq) async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/portfolio/',
        data: taskerPortfolioReq.toJson(),
        token: tokenP ?? token!,
      );
      if (x['status'] == 'success') emit(TaskerPortfolioSuccess());
    } catch (e) {
      emit(TaskerPortfolioFailure());
    }
  }

  Future<void> getPortfolio([int pageNumber = 1]) async {
    try {
      emit(
        TaskerPortfolioInitial(),
      );
      final tokenP = await CacheHelper.getCachedString(kAccessTokenP);
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().getDatawithCredential(
        url: 'tasker/portfolio/',
        token: tokenP ?? token,
        query: {
          'page': pageNumber,
        },
      );

      if (x != null) {
        emit(
          TaskerGetPortfolioSuccess(
            taskerPortfolioRes:
                TaskerPortfolioRes.fromJson(x as Map<String, dynamic>),
          ),
        );
      }
    } catch (e) {
      emit(TaskerPortfolioFailure());
    }
  }
}
