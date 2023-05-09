import 'package:dependencies/dependencies.dart';

abstract class PostSupportTicketEvent extends Equatable {
  const PostSupportTicketEvent();
}

class PostSupportTicketLoad extends PostSupportTicketEvent {
  final String? model;
  final String description;
  final String reason;
  final String objectId;
  final String typeSlug;

  const PostSupportTicketLoad({
    this.model,
    required this.description,
    required this.reason,
    required this.objectId,
    required this.typeSlug,
  });
  @override
  List<Object?> get props => [model, description, reason, objectId, typeSlug];
}

class PostSupportTicketLoadWithOutModel extends PostSupportTicketEvent {
  final String description;
  final String reason;
  final String typeSlug;

  const PostSupportTicketLoadWithOutModel({
    required this.description,
    required this.reason,
    required this.typeSlug,
  });
  @override
  List<Object?> get props => [description, reason, typeSlug];
}
