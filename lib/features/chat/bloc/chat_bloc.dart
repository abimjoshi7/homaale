import 'dart:developer';

import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/helpers/cryptojs_aes_encryption_helper.dart';
import 'package:cipher/features/chat/models/chat.dart';
import 'package:cipher/features/chat/models/chat_person_details.dart';
import 'package:cipher/features/chat/repository/chat_repository.dart';
import 'package:dependencies/dependencies.dart';
import 'package:cipher/core/constants/enums.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({
    required this.chatRepository,
  }) : super(const ChatState()) {
    on<FetchChatLists>((event, emit) async {
      emit(state.copyWith(states: TheStates.loading));
      try {
        List<Chat> cl = event.chatList;
        List<ChatPersonDetails> rCl = [];

        for (var item in cl) {
          var res = await chatRepository.fetchChatPersonDetails(id: item.personID ?? '');

          String decryptedMessage;
          if (item.lastMessage != null && item.lastMessage != "") {
            decryptedMessage = decryptAESCryptoJS(item.lastMessage.toString(), kAESEncryptionKey);
          } else {
            decryptedMessage = 'Start Conversation';
          }

          rCl.add(
            ChatPersonDetails(
              id: res['id'] as String,
              fullName: res['full_name'] as String,
              profileImage: res['profile_image'] as String,
              lastMessage: decryptedMessage,
              groupName: item.groupName as String,
              date: item.date as String,
              isRead: item.isRead as bool,
            ),
          );
        }

        if (rCl.isNotEmpty && (cl.length == rCl.length)) {
          emit(state.copyWith(states: TheStates.success, rCl: rCl));
        }
      } on Exception catch (e) {
        log('Chat details bloc error: $e');
        emit(state.copyWith(states: TheStates.failure));
      }
    });
  }
}
