import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bloc/infinite_repo.dart';
import 'package:dependencies/dependencies.dart';
import 'package:stream_transform/stream_transform.dart';

part 'scroll_event.dart';
part 'scroll_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollState()) {
    on<FetchItemsEvent>(
      transformer: throttleDroppable(throttleDuration),
      (event, emit) async {
        if (!event.newFetch && state.hasReachedMax == true) return;
        if (state.theState == TheStates.initial) {
          final res = await InifiniteRepo().fetchItems(event.url, event.data);

          emit(
            state.copyWith(
              hasReachedMax: res["next"] == null,
              next: res["next"] as String,
              theState: TheStates.success,
              result: res["result"] as List<dynamic>,
              pageIndex: res["current"] as int,
            ),
          );
        } else {
          final res = await InifiniteRepo()
              .fetchItems(event.url, event.data, state.pageIndex + 1);
          if (res["next"] == null)
            emit(state.copyWith(
              hasReachedMax: true,
              theState: TheStates.success,
              result: List.of(state.result)..addAll(res["result"] as Iterable),
              pageIndex: res["current"] as int,
            ));
          else {
            emit(
              state.copyWith(
                hasReachedMax: false,
                next: res["next"] as String,
                theState: TheStates.success,
                result: List.of(state.result)
                  ..addAll(res["result"] as Iterable),
                pageIndex: res["current"] as int,
              ),
            );
          }
        }
      },
    );
  }
}
