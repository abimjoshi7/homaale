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
  final int? id;
  const NotificationAllRead({this.id});
  @override
  List<Object?> get props => [id];
}

class MyNotificationListLoadInitiated extends NotificationEvent {
  @override
  List<Object?> get props => [];
}
