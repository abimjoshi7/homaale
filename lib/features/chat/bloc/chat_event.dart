part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class FetchChatLists extends ChatEvent {
  final List<Chat> chatList;

  FetchChatLists({
    required this.chatList,
  });

  @override
  List<Object?> get props => [chatList];
}
