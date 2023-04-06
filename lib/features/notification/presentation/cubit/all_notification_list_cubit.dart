// import 'package:cipher/core/constants/enums.dart';
// import 'package:cipher/features/notification/data/models/all_notification_list.dart';
// import 'package:cipher/features/notification/data/repositories/notification_repositories.dart';
// import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
// import 'package:dependencies/dependencies.dart';
//
// /// this cubit is not used now , can modify and used as per need in future
// class AllNotificationListCubit extends Cubit<NotificationState> {
//   final repo = NotificationRepositories();
//   AllNotificationListCubit() : super(const NotificationState());
//   Future fetchSingleUserNotification(String id) async {
//     try {
//       await repo.getAllNotification().then((value) {
//         AllNotificationList.fromJson(value);
//         emit(state.copyWith(theStates: TheStates.success));
//       });
//     } catch (e) {
//       emit(state.copyWith(theStates: TheStates.failure));
//     }
//   }
// }
