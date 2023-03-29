part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final TheStates? theStates;
  final AllNotificationList? allNotificationList;
  final bool? markAllRead;
  const NotificationState({
    this.theStates,
    this.allNotificationList,
    this.markAllRead = false,
  });

  NotificationState copyWith({
    TheStates? theStates,
    AllNotificationList? allNotificationList,
    bool? markAllRead,
  }) {
    return NotificationState(
      theStates: theStates ?? this.theStates,
      allNotificationList: allNotificationList ?? this.allNotificationList,
      markAllRead: markAllRead ?? this.markAllRead,
    );
  }

  @override
  List<Object?> get props => [theStates, allNotificationList, markAllRead];
}
