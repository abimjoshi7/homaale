import 'package:dependencies/dependencies.dart';

abstract class PostSupportTicketEvent extends Equatable {
  const PostSupportTicketEvent();
}

class PostSupportTicketLoad extends PostSupportTicketEvent {
  final String model;
  final String description;
  final String reason;

  final String objectId;
  final int type;

  const PostSupportTicketLoad({
    required this.description,
    required this.model,
    required this.reason,
    required this.objectId,
    required this.type,
  });
  @override
  List<Object?> get props => [model, description, reason, objectId];
}
