import 'package:dependencies/dependencies.dart';

abstract class UserDeactiveEvent extends Equatable {
  const UserDeactiveEvent();
}

class DeactiveActionPost extends UserDeactiveEvent {
  final String reason;

  DeactiveActionPost({required this.reason});
  @override
  List<Object?> get props => [reason];
}
