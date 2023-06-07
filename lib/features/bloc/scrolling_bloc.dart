// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/core/constants/enums.dart';

part 'scrolling_event.dart';
part 'scrolling_state.dart';

class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  final List<dynamic> list;
  final ScrollRepoImpl repo;
  ScrollingBloc(
    this.list,
    this.repo,
  ) : super(const ScrollingState()) {
    on<FetchListEvent>((event, emit) async {
      if (!event.newFetch && state.hasReachedMax == true) return;
      if (state.theState == TheStates.initial) {
        final res = await repo.fetchItems("url", 1);
        emit(
          state.copyWith(
            hasReachedMax: res["next"] == null,
            next: res["next"] as String,
            theState: TheStates.success,
            result: res["result"] as List<dynamic>,
            pageIndex: event.pageNum,
          ),
        );
      } else {
        final res = await repo.fetchItems(
          "url",
          state.pageIndex + 1,
        );
        if (res["next"] == null)
          emit(state.copyWith(
            hasReachedMax: true,
          ));
        else {
          emit(
            state.copyWith(
              hasReachedMax: false,
              next: res["next"] as String,
              theState: TheStates.success,
              result: [
                ...state.result,
                ...res["result"] as Iterable,
              ],
            ),
          );
        }
      }
    });
  }
}
