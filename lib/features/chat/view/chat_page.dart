import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/cryptojs_aes_encryption_helper.dart';
import 'package:cipher/core/helpers/date_helper.dart';
import 'package:cipher/features/chat/models/chat_messages.dart';
import 'package:cipher/features/chat/models/chat_person_details.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static const String routeName = '/chat-page';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final chatBoxController = TextEditingController();
  final userBloc = locator<UserBloc>();

  @override
  void initState() {
    super.initState();
    userBloc.add(UserLoaded());
  }

  @override
  Widget build(BuildContext context) {
    /// Get chat and person details from route arguments
    ChatPersonDetails? chatPersonDetails = ModalRoute.of(context)?.settings.arguments as ChatPersonDetails?;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '${chatPersonDetails?.fullName ?? ''}',
          style: kText15,
        ),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              color: kColorSilver,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream:
            locator<FirebaseFirestore>().collection("chats").doc("${chatPersonDetails?.groupName ?? ''}").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              List<Message> ml = [];

              snapshot.data?.data()?.forEach(
                (key, value) {
                  List<dynamic> vList = value as List<dynamic>;
                  for (var item in vList) {
                    ml.add(Message(
                      senderId: item['senderId'] as String,
                      date: (item['date'] as Timestamp).toDate().toString(),
                      text: item['text'] as String,
                    ));
                  }
                },
              );

              /// Need to scroll the messages list at the bottom of the page
              /// so it is reversed first and then reversed again on the Listview
              final mList = ml.reversed.toList();

              return ListView.separated(
                shrinkWrap: true,
                reverse: true,
                padding: EdgeInsets.all(16),
                separatorBuilder: (context, index) => addVerticalSpace(16),
                itemCount: mList.length,
                itemBuilder: (context, index) {
                  String message = decryptAESCryptoJS(mList[index].text.toString(), kAESEncryptionKey);
                  String date = DateTimeHelper.timeAgoSinceDate(mList[index].date.toString());
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: chatPersonDetails?.id == mList[index].senderId
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        chatPersonDetails?.id == mList[index].senderId
                            ? Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      chatPersonDetails?.profileImage ?? kServiceImageNImg,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : SizedBox(),
                        addHorizontalSpace(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: chatPersonDetails?.id == mList[index].senderId ? kColorGrey : kColorBlue,
                                borderRadius: BorderRadius.only(
                                  topLeft: chatPersonDetails?.id == mList[index].senderId
                                      ? Radius.zero
                                      : Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: chatPersonDetails?.id == mList[index].senderId
                                      ? Radius.circular(16)
                                      : Radius.zero,
                                ),
                              ),
                              child: Text(
                                message,
                                maxLines: message.length,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: chatPersonDetails?.id == mList[index].senderId ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                            addVerticalSpace(4),
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: 11,
                                color: kColorDarkGrey2,
                              ),
                            )
                          ],
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  );
                },
              );
            }
          }
          return SizedBox();
        },
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ),
          child: TextFormField(
            controller: chatBoxController,
            decoration: InputDecoration(
              hintText: 'Type a message',
              hintStyle: kText14,
              border: InputBorder.none,
              suffixIcon: IconButton(
                onPressed: () {
                  if (chatBoxController.text.trim().isNotEmpty) {
                    String message = encryptAESCryptoJS(chatBoxController.text.trim(), kAESEncryptionKey);
                    String userID = userBloc.state.taskerProfile?.user?.id.toString() ?? '';

                    locator<FirebaseFirestore>()
                        .collection("chats")
                        .doc("${chatPersonDetails?.groupName ?? ''}")
                        .update({
                      "messages": FieldValue.arrayUnion([
                        {
                          "date": Timestamp.now(),
                          "senderId": userID,
                          "text": message,
                        }
                      ])
                    });

                    locator<FirebaseFirestore>().collection("userChats").doc("$userID").update({
                      "${chatPersonDetails?.groupName}.lastMessage": {'text': message},
                      "${chatPersonDetails?.groupName}.date": FieldValue.serverTimestamp(),
                    });

                    locator<FirebaseFirestore>().collection("userChats").doc("${chatPersonDetails?.id}").update({
                      "${chatPersonDetails?.groupName}.lastMessage": {'text': message},
                      "${chatPersonDetails?.groupName}.date": FieldValue.serverTimestamp(),
                      "${chatPersonDetails?.groupName}.read": false,
                    });

                    chatBoxController.clear();
                    FocusScope.of(context).unfocus();
                  }
                },
                icon: Icon(
                  Icons.send,
                  color: kColorAmber,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
