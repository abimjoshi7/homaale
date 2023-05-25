import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dependencies/dependencies.dart';

import 'package:cipher/features/notification/data/models/all_notification_list.dart';
import 'package:cipher/features/notification/data/repositories/notification_repositories.dart';
import 'package:stream_transform/stream_transform.dart';

part 'notification_event.dart';
part 'notification_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepositories repo;

  NotificationBloc({required this.repo}) : super(const NotificationState()) {
    on<MyNotificationListInitiated>(
      (event, emit) async {
        if (!state.isNewRefetch && state.hasReachedMax) return;
        try {
          if (state.notificationStatus == NotificationStatus.initial) {
            final allNotificationList = await repo.getAllNotification();

            final notificationList = allNotificationList.result;
            return emit(state.copyWith(
              notificationStatus: NotificationStatus.success,
              allNotificationList: allNotificationList,
              notificationList: notificationList,
              hasReachedMax: allNotificationList.current == allNotificationList.totalPages,
            ));
          }

          if (state.allNotificationList.current != state.allNotificationList.totalPages) {
            final allNotificationList = await repo.getAllNotification(state.allNotificationList.current! + 1);
            emit(allNotificationList.result!.isEmpty
                ? state.copyWith(hasReachedMax: true)
                : state.copyWith(
                    notificationStatus: NotificationStatus.success,
                    allNotificationList: allNotificationList,
                    notificationList: List.of(state.notificationList)..addAll(allNotificationList.result!),
                    hasReachedMax: false,
                  ));
          } else {
            emit(state.copyWith(hasReachedMax: true));
          }
        } catch (_) {
          emit(state.copyWith(notificationStatus: NotificationStatus.failure));
        }
      },
      transformer: throttleDroppable(throttleDuration),
    );

    on<NotificationAllRead>(
      (event, emit) async {
        try {
          emit(state.copyWith(notificationStatus: NotificationStatus.initial));
          await repo.markNotificationAllRead().then((value) {
            emit(state.copyWith(
              notificationStatus: NotificationStatus.initial,
              isNewRefetch: true,
            ));
          }).whenComplete(() => add(MyNotificationListInitiated()));
        } catch (e) {
          emit(state.copyWith(notificationStatus: NotificationStatus.failure));
        }
      },
    );
  }
}
