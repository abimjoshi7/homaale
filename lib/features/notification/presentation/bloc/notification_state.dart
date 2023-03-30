part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final TheStates? theStates;
  final AllNotificationList? allNotificationList;
  final bool? markAllRead;
  final bool? isRefetch;

  const NotificationState({
    this.theStates,
    this.allNotificationList,
    this.markAllRead = false,
    this.isRefetch = false,
  });

  NotificationState copyWith({
    TheStates? theStates,
    AllNotificationList? allNotificationList,
    bool? markAllRead,
    bool? isRefetch,
  }) {
    return NotificationState(
      theStates: theStates ?? this.theStates,
      allNotificationList: allNotificationList ?? this.allNotificationList,
      markAllRead: markAllRead ?? this.markAllRead,
      isRefetch: isRefetch ?? this.isRefetch,
    );
  }

  @override
  List<Object?> get props => [theStates, allNotificationList, markAllRead, isRefetch];
}
