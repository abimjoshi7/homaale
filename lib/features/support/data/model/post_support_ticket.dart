
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_support_ticket.freezed.dart';
part 'post_support_ticket.g.dart';

@freezed
class PostSupportTicket with _$PostSupportTicket {
  const factory PostSupportTicket({
    int? id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'update_at') DateTime? updatedAt,
    String? reason,
    String? description,
    @JsonKey(name: 'object_id') String? objectId,
    String? type,
    List<dynamic>? attachment,
  }) = _PostSupportTicket;

  factory PostSupportTicket.fromJson(Map<String, dynamic> json) =>
      _$PostSupportTicketFromJson(json);
}
