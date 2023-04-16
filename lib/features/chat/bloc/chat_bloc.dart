import 'dart:developer';

import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/core/helpers/cryptojs_aes_encryption_helper.dart';
import 'package:cipher/features/chat/models/chat.dart';
import 'package:cipher/features/chat/models/chat_person_details.dart';
import 'package:cipher/features/chat/repository/chat_repository.dart';
import 'package:cipher/locator.dart';
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
      } catch (e) {
        log('Chat details bloc error: $e');
        emit(state.copyWith(states: TheStates.failure));
      }
    });

    on<HandleUserCreationChat>((event, emit) async {
      emit(state.copyWith(states: TheStates.loading));
      var firebaseFirestore = locator<FirebaseFirestore>();
      try {
        /// Create user and tasker if not exist START
        try {

          firebaseFirestore.collection('users').doc('${event.userID}').get().then((value) {
            if (!value.exists) {
              firebaseFirestore.collection('users').doc('${event.userID}').set({
                'uuid': event.userID,
                'is_active': true,
                'created_on': DateTime.now(),
              });
            }
          });

          firebaseFirestore.collection('users').doc('${event.taskerID}').get().then((value) {
            if (!value.exists) {
              firebaseFirestore.collection('users').doc('${event.taskerID}').set({
                'uuid': event.taskerID,
                'is_active': true,
                'created_on': DateTime.now(),
              });
            }
          });
        } catch (e) {
          log('New user creation failed: $e');
        }

        /// Create user and tasker chats if not exist START
        try {

          firebaseFirestore.collection('userChats').doc('${event.userID}').get().then((value) {
            if (!value.exists) {
              firebaseFirestore.collection('userChats').doc('${event.userID}').set({});
            }
          });

          firebaseFirestore.collection('userChats').doc('${event.taskerID}').get().then((value) {
            if (!value.exists) {
              firebaseFirestore.collection('userChats').doc('${event.taskerID}').set({});
            }
          });
        } catch (e) {
          log('New user chat group creation failed: $e');
        }

        /// handle Chat Room Creation if not exist START
        try {
          var combinedID = event.userID!.compareTo(event.taskerID!) == true
              ? '${event.userID}_${event.taskerID}'
              : '${event.taskerID}_${event.userID}';

          firebaseFirestore.collection('chats').doc('$combinedID').get().then((value) {
            if (!value.exists) {
              firebaseFirestore.collection('chats').doc('$combinedID').set(
                {'messages': []},
              );


              firebaseFirestore.collection('userChats').doc('${event.userID}').get().then((value) {
                if (value.exists) {
                  firebaseFirestore.collection('userChats').doc('${event.userID}').update({
                    "$combinedID.userInfo": {'uid': "${event.taskerID}"},
                    "$combinedID.date": FieldValue.serverTimestamp(),
                    "$combinedID.read": true,
                  });
                }
              });


              firebaseFirestore.collection('userChats').doc('${event.taskerID}').get().then((value) {
                if (value.exists) {
                  firebaseFirestore.collection('userChats').doc('${event.taskerID}').update({
                    "$combinedID.userInfo": {'uid': "${event.userID}"},
                    "$combinedID.date": FieldValue.serverTimestamp(),
                    "$combinedID.read": true,
                  });
                }
              });
            }
          });
        } catch (e) {
          log('handleChatRoomCreation faield: $e');
        }

        emit(state.copyWith(states: TheStates.success));
      } on Exception catch (e) {
        log('Chat initialize error: $e');
        emit(state.copyWith(states: TheStates.failure));
      }
    });
  }
}
