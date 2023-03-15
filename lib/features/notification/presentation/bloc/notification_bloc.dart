import 'dart:developer';

import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/notification/data/models/all_notification_list.dart';
import 'package:cipher/features/notification/data/repositories/notification_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final repo = NotificationRepositories();
  NotificationBloc() : super(const NotificationState()) {
    on<MyNotificationListInitiated>(
      (event, emit) async {
        try {
          emit(state.copyWith(theStates: TheStates.initial));
          await repo.getAllNotification().then((value) {
            emit(state.copyWith(
                theStates: TheStates.success,
                allNotificationList: AllNotificationList.fromJson(value),),);
          });
        } catch (e) {
          log("notification parse error$e");
          emit(state.copyWith(theStates: TheStates.failure));
        }
      },
    );
  }
}
