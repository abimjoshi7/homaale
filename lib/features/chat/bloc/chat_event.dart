part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {}

class FetchChatLists extends ChatEvent {
  final List<Chat> chatList;

  FetchChatLists({
    required this.chatList,
  });

  @override
  List<Object?> get props => [chatList];
}

class HandleUserCreationChat extends ChatEvent {
  final String? userID;
  final String? taskerID;

  HandleUserCreationChat({
    this.userID,
    this.taskerID,
  });

  @override
  List<Object?> get props => [
        userID,
        taskerID,
      ];
}
