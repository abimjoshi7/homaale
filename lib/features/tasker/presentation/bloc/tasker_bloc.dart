import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/tasker/data/models/tasker_list_res.dart';
import 'package:cipher/features/tasker/data/models/tasker_review_response.dart';
import 'package:cipher/features/tasker/data/repositories/tasker_repositories.dart';
import 'package:dependencies/dependencies.dart';
import 'package:stream_transform/stream_transform.dart';

part 'tasker_event.dart';
part 'tasker_state.dart';

const _postLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class TaskerBloc extends Bloc<TaskerEvent, TaskerState> {
  TaskerBloc({required this.taskerRepositories}) : super(const TaskerState()) {
    on<SetInitial>((event, emit) {
      emit(state.copyWith(status: TaskerStatus.initial));
      add(TaskerFetched());
    });

    on<TaskerFetched>(
      _onTaskerFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final TaskerRepositories taskerRepositories;

  Future<void> _onTaskerFetched(TaskerFetched event, Emitter<TaskerState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == TaskerStatus.initial) {
        final taskers = await _fetchTaskers();

        final taskerList = taskers.result;
        return emit(state.copyWith(
          status: TaskerStatus.success,
          taskerListRes: taskers,
          tasker: taskerList,
          hasReachedMax: false,
        ));
      }

      if (state.taskerListRes.current != state.taskerListRes.totalPages) {
        final taskers = await _fetchTaskers(state.taskerListRes.current! + 1);
        emit(taskers.result!.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: TaskerStatus.success,
                taskerListRes: taskers,
                tasker: List.of(state.tasker)..addAll(taskers.result!),
                hasReachedMax: false,
              ));
      } else {
        emit(state.copyWith(hasReachedMax: true));
      }
    } catch (_) {
      emit(state.copyWith(status: TaskerStatus.failure));
    }
  }

  Future<TaskerListRes> _fetchTaskers([int startIndex = 1]) async {
    try {
      final response = await taskerRepositories.fetchAllTaskers(page: startIndex);
      final taskerListRes = TaskerListRes.fromJson(response);

      return taskerListRes;
    } catch (_) {
      throw Exception('error fetching taskers');
    }
  }
}
