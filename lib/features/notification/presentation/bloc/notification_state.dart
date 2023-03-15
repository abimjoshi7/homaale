part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final TheStates? theStates;
  final AllNotificationList? allNotificationList;
  const NotificationState({
    this.theStates,
    this.allNotificationList,
  });

  NotificationState copyWith({
    TheStates? theStates,
    AllNotificationList? allNotificationList,
  }) {
    return NotificationState(
      theStates: theStates ?? this.theStates,
      allNotificationList: allNotificationList ?? this.allNotificationList,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        allNotificationList,
      ];
}
