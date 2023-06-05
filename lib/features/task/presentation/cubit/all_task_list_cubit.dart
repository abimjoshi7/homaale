// import 'package:cipher/features/task/data/models/all_task_list.dart';
// import 'package:cipher/features/task/data/repositories/task_repositories.dart';
// import 'package:dependencies/dependencies.dart';

// part 'all_task_list_state.dart';

// class AllTaskListCubit extends Cubit<AllTaskListState> {
//   final repo = TaskRepositories();
//   AllTaskListCubit() : super(AllTaskListInitial());

//   Future fetchAllTaskList() async {
//     try {
//       await repo.fetchAllTaskList().then(
//             (value) => emit(
//               AllTaskListLoadSuccess(
//                 list: AllTaskList.fromJson(
//                   value,
//                 ),
//               ),
//             ),
//           );
//     } catch (e) {
//       emit(
//         AllTaskListLoadFailure(),
//       );
//     }
//   }
// }
