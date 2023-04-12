import 'package:dependencies/dependencies.dart';

part 'chat_messages.freezed.dart';
part 'chat_messages.g.dart';

@freezed
class ChatMessages with _$ChatMessages {
  const factory ChatMessages({
    List<Message>? messages,
  }) = _ChatMessages;

  factory ChatMessages.fromJson(Map<String, dynamic> json) => _$ChatMessagesFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    String? date,
    String? senderId,
    String? text,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
