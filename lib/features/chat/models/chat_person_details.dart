// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'chat_person_details.freezed.dart';
part 'chat_person_details.g.dart';

@freezed
class ChatPersonDetails with _$ChatPersonDetails {
  const factory ChatPersonDetails({
    String? id,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? lastMessage,
    String? groupName,
    String? date,
    bool? isRead,
  }) = _ChatPersonDetails;

  factory ChatPersonDetails.fromJson(Map<String, dynamic> json) => _$ChatPersonDetailsFromJson(json);
}
