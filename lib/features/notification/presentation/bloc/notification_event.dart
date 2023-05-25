part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class MyNotificationListInitiated extends NotificationEvent {
  const MyNotificationListInitiated();

  @override
  List<Object?> get props => [];
}

class NotificationAllRead extends NotificationEvent {
  const NotificationAllRead();
  @override
  List<Object?> get props => [];
}
