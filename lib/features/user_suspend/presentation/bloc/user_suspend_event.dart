import 'package:dependencies/dependencies.dart';

abstract class UserSuspendEvent extends Equatable {
  const UserSuspendEvent();
}

class UserSuspendLoaded extends UserSuspendEvent {
  final String? userId;
  const UserSuspendLoaded({this.userId});

  @override
  List<Object?> get props => [userId];
}
