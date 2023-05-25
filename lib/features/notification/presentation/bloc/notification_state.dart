part of 'notification_bloc.dart';

enum NotificationStatus { initial, loading, success, failure }

class NotificationState extends Equatable {
  final NotificationStatus notificationStatus;
  final AllNotificationList allNotificationList;
  final bool markAllRead;
  final List<Result> notificationList;
  final bool hasReachedMax;
  final bool isNewRefetch;

  const NotificationState({
    this.notificationStatus = NotificationStatus.initial,
    this.allNotificationList = const AllNotificationList(),
    this.markAllRead = false,
    this.notificationList = const <Result>[],
    this.hasReachedMax = false,
    this.isNewRefetch = false,
  });

  NotificationState copyWith({
    NotificationStatus? notificationStatus,
    AllNotificationList? allNotificationList,
    bool? markAllRead,
    bool? isRefetch,
    List<Result>? notificationList,
    bool? hasReachedMax,
    bool? isNewRefetch,
  }) {
    return NotificationState(
      notificationStatus: notificationStatus ?? this.notificationStatus,
      allNotificationList: allNotificationList ?? this.allNotificationList,
      markAllRead: markAllRead ?? this.markAllRead,
      notificationList: notificationList ?? this.notificationList,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isNewRefetch: isNewRefetch ?? this.isNewRefetch,
    );
  }

  @override
  List<Object> get props {
    return [
      notificationStatus,
      allNotificationList,
      markAllRead,
      notificationList,
      hasReachedMax,
      isNewRefetch,
    ];
  }
}
