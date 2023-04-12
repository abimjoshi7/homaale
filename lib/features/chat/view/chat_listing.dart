import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/chat/models/chat.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class ChatListingPage extends StatefulWidget {
  static const String routeName = '/chat-listing';
  const ChatListingPage({super.key});

  @override
  State<ChatListingPage> createState() => _ChatListingPageState();
}

class _ChatListingPageState extends State<ChatListingPage> {
  final chatBloc = locator<ChatBloc>();

  // List<Chats> chatList = [];

  // @override
  // void initState() {
  //   getChats();
  //   super.initState();
  // }

  // Future<void> getChats() async {
  //   var db = FirebaseFirestore.instance;
  //   final docRef = await db.collection("userChats").doc("48b838b6-c032-4a83-87d3-495d6a0e09ee");

  //   docRef.get().then(
  //     (DocumentSnapshot doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       final List<Chats> cList = [];

  //       data.forEach((key, value) {
  //         setState(() {
  //           cList.add(Chats(
  //             groupName: key,
  //             date: value['date'].toString(),
  //             lastMessage: value.toString().contains('lastMessage') ? value['lastMessage']['text'].toString() : '',
  //             isRead: value['read'] as bool,
  //             personID: value['userInfo']['uid'].toString(),
  //           ));
  //         });
  //       });
  //       return cList;
  //     },
  //     onError: (e) => print("Error getting document: $e"),
  //   ).then((value) {
  //     for (var val in value) {
  //       setState(() {
  //         chatList.add(val);
  //       });
  //     }
  //   });

  //   print(chatList);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            label: 'Mesages',
          ),
          Divider(),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("userChats")
                .doc("48b838b6-c032-4a83-87d3-495d6a0e09ee")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                List<Chat> cList = [];

                snapshot.data?.data()?.forEach(
                  (key, value) {
                    cList.add(Chat(
                      groupName: key,
                      date: (value['date'] as Timestamp).toDate().toString(),
                      lastMessage:
                          value.toString().contains('lastMessage') ? value['lastMessage']['text'].toString() : '',
                      isRead: value['read'] as bool,
                      personID: value['userInfo']['uid'].toString(),
                    ));
                  },
                );

                chatBloc.add(FetchChatLists(chatList: cList));

                return BlocBuilder<ChatBloc, ChatState>(
                  bloc: chatBloc,
                  builder: (context, state) {
                    if (state.states == TheStates.loading) {
                      return CircularProgressIndicator();
                    } else if (state.states == TheStates.success) {
                      return Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: state.rCl?.length ?? 0,
                          separatorBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(),
                          ),
                          itemBuilder: (context, index) => Container(
                            height: 105,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.rCl?[index].profileImage ?? kServiceImageNImg,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                addHorizontalSpace(8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.79,
                                      child: Text(
                                        state.rCl?[index].fullName?.toString() ?? '',
                                        style: kBoldText,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    addVerticalSpace(4),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.79,
                                      child: Text(
                                        state.rCl?[index].lastMessage?.toString() ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontStyle: state.rCl?[index].lastMessage?.toString() == 'Start Conversation'
                                              ? FontStyle.italic
                                              : FontStyle.normal,
                                        ),
                                      ),
                                    ),
                                    addVerticalSpace(4),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.79,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(state.rCl?[index].date?.toString().split(" ").first ?? ''),
                                          Icon(
                                            state.rCl?[index].isRead ?? false
                                                ? Icons.check_circle_rounded
                                                : Icons.check_circle_outline_rounded,
                                            size: 16,
                                            color: kColorBlue,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('Error'),
                      );
                    }
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
