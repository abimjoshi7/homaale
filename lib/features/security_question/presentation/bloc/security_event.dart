import 'package:dependencies/dependencies.dart';

abstract class SecurityEvent extends Equatable {
  const SecurityEvent();
}

class SecurityInitiated extends SecurityEvent {
  const SecurityInitiated();
  @override
  List<Object?> get props => [];
}

class SecurityAnswerPost extends SecurityEvent {
  final int id;
  final String answer;

  const SecurityAnswerPost({required this.id, required this.answer});
  @override
  List<Object?> get props => [id, answer];
}
