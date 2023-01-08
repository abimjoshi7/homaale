import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/networking/models/request/tasker_portfolio_req.dart';
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
      final token = await CacheHelper.getCachedString(kAccessToken);
      final x = await DioHelper().postDataWithCredential(
        url: 'tasker/portfolio/',
        data: taskerPortfolioReq.toJson(),
        token: token!,
      );
      if (x['status'] == 'success') emit(TaskerPortfolioSuccess());
    } catch (e) {
      emit(TaskerPortfolioFailure());
    }
  }
}
