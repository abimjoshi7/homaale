import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_model.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:dependencies/dependencies.dart';

part 'support_ticket_model.freezed.dart';
part 'support_ticket_model.g.dart';

@freezed
class SupportTicketModel with _$SupportTicketModel {
  const factory SupportTicketModel({
    int? id,
    SupportTicketType? type,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    User? user,
    List<Image>? attachment,
    String? object,
    @JsonKey(name: "object_type") String? objectType,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "is_active") bool? isActive,
    String? status,
    String? reason,
    @JsonKey(name: "object_id") String? objectId,
    @JsonKey(name: "is_resolved") bool? isResolved,
  }) = _SupportTicketModel;

  factory SupportTicketModel.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketModelFromJson(json);
}

@freezed
class SupportTicketType with _$SupportTicketType {
  const factory SupportTicketType({
    int? id,
    String? name,
  }) = _SupportTicketType;

  factory SupportTicketType.fromJson(Map<String, dynamic> json) =>
      _$SupportTicketTypeFromJson(json);
}
