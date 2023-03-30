part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class MyNotificationListInitiated extends NotificationEvent {
  final int? page;
  final bool? isMarkAllRead;
  final bool? isRefetch;
  const MyNotificationListInitiated({
    this.page,
    this.isRefetch,
    this.isMarkAllRead,
  });
  @override
  List<Object?> get props => [page, isRefetch, isMarkAllRead];
}

class NotificationAllRead extends NotificationEvent {
  const NotificationAllRead();
  @override
  List<Object?> get props => [];
}

class MyNotificationListLoadInitiated extends NotificationEvent {
  @override
  List<Object?> get props => [];
}
