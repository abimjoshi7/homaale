import 'dart:math';

import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/services/data/models/entity_service.dart' as es;
import 'package:cipher/features/services/data/models/self_created_task_service.dart';
import 'package:cipher/features/task/data/models/all_task_list.dart';
import 'package:cipher/features/task/data/models/apply_task_req.dart';
import 'package:cipher/features/task/data/models/my_task_res.dart';
import 'package:cipher/features/task/data/models/post_task_req.dart';
import 'package:cipher/features/task/data/models/post_task_res.dart';
import 'package:cipher/features/task/data/models/single_task_entity_service.dart';
import 'package:cipher/features/task/data/models/task_model.dart';
import 'package:cipher/features/task/data/repositories/task_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final repo = TaskRepositories();

  TaskBloc() : super(const TaskState()) {
    on<TaskAddInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo
              .postTask(
                event.req,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    postTaskRes: PostTaskRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(theState: TheStates.failure),
          );
        }
      },
    );

    on<MyServiceTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo
              .fetchMyCreatedEntityServiceTask(
                isTask: event.isTask,
              )
              .then(
                (value) => emit(
                  state.copyWith(
                      theState: TheStates.success,
                      selfCreatedTaskServiceModel:
                          SelfCreatedTaskService.fromJson(value)
                      // myTaskRes: MyTaskRes.fromJson(
                      //   value,
                      // ),
                      ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(theState: TheStates.failure),
          );
        }
      },
    );

    on<AllTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(theState: TheStates.initial),
          );
          await repo.fetchAllTaskList().then(
            (value) {
              final allTaskList = es.EntityServiceModel.fromJson(value);

              emit(
                state.copyWith(
                  theState: TheStates.success,
                  tasksList: allTaskList,
                ),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(theState: TheStates.failure),
          );
        }
      },
    );

    on<SingleEntityTaskLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              theState: TheStates.initial,
            ),
          );
          await repo.fetchSingleTask(id: event.id).then(
                (value) => emit(
                  state.copyWith(
                    theState: TheStates.success,
                    taskModel: SingleTaskEntityService.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              theState: TheStates.failure,
            ),
          );
        }
      },
    );

    on<TaskBookInitiated>(
      (event, emit) async {
        emit(
          state.copyWith(applyTaskFail: false, applyTaskSuccess: false),
        );
      },
    );

    on<TaskBook>(
      (event, emit) async {
        try {
          await repo.bookTask(event.req).then(
            (value) {
              emit(
                state.copyWith(
                  applyTaskFail: false,
                  applyTaskSuccess: true,
                ),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(applyTaskFail: true),
          );
        }
      },
    );
  }
}




// on<MyCreatedServiceTaskLoadInitiated>(
//       (event, emit) async {
//         try {
//           emit(
//             state.copyWith(
//               theStates: TheStates.initial,
//             ),
//           );
//           await repositories
//               .fetchMyCreatedEntityServiceTask(
//                 isTask: event.isTask,
//               )
//               .then(
//                 (value) => emit(
//                   state.copyWith(
//                     theStates: TheStates.success,
//                     selfCreatedTaskServiceModel:
//                         SelfCreatedTaskServiceModel.fromJson(value),
//                   ),
//                   // MyCreatedServicesLoadSuccess(
//                   //   MyCreatedServicesRes.fromJson(
//                   //     value,
//                   //   ),
//                   // ),
//                 ),
//               );
//         } catch (e) {
//           emit(
//             state.copyWith(
//               theStates: TheStates.failure,
//             ),
//           );
//         }
//       },
//     );
