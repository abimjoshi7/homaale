import 'package:cipher/core/helpers/date_helper.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/chat/models/chat.dart';
import 'package:cipher/features/chat/view/chat_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
  final userBloc = locator<UserBloc>();

  @override
  void initState() {
    super.initState();
    userBloc.add(UserLoaded());
  }

  @override
  void dispose() {
    userBloc.close();
    chatBloc.close();
    super.dispose();
  }

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
          BlocBuilder<UserBloc, UserState>(
            bloc: userBloc,
            builder: (context, userState) {
              if (userState.theStates == TheStates.success) {
                return StreamBuilder(
                  stream: locator<FirebaseFirestore>()
                      .collection("userChats")
                      .doc("${userState.taskerProfile?.user?.id}")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        List<Chat> cList = [];

                        snapshot.data?.data()?.forEach(
                          (key, value) {
                            cList.add(Chat(
                              groupName: key,
                              date: (value['date'] as Timestamp).toDate().toString(),
                              lastMessage: value.toString().contains('lastMessage')
                                  ? value['lastMessage']['text'].toString()
                                  : '',
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
                                  itemBuilder: (context, index) {
                                    String date =
                                        DateTimeHelper.timeAgoSinceDate(state.rCl?[index].date?.toString() ?? '');
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          ChatPage.routeName,
                                          arguments: state.rCl?[index],
                                        );
                                      },
                                      child: Container(
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
                                                      fontStyle: state.rCl?[index].lastMessage?.toString() ==
                                                              'Start Conversation'
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
                                                      Text(date),
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
                                    );
                                  },
                                ),
                              );
                            } else if (state.states == TheStates.failure) {
                              return Center(child: Text('No chats. Start a service or task to initiate chat'));
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      } else {
                        return Center(child: Text('No chats. Start a service or task to initiate chat'));
                      }
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
