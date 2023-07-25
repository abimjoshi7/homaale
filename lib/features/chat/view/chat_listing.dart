import 'package:cipher/core/helpers/date_helper.dart';
import 'package:cipher/features/chat/bloc/chat_bloc.dart';
import 'package:cipher/features/chat/models/chat.dart';
import 'package:cipher/features/chat/view/chat_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

import '../../error_pages/no_internet_page.dart';

class ChatListingPage extends StatefulWidget {
  static const String routeName = '/chat-listing';
  const ChatListingPage({super.key});

  @override
  State<ChatListingPage> createState() => _ChatListingPageState();
}

class _ChatListingPageState extends State<ChatListingPage> {
  final chatBloc = locator<ChatBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    chatBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Messages',
        trailingWidget: SizedBox(),
      ),
      body: BlocBuilder<UserBloc, UserState>(
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
                        if (value.toString().contains('userInfo')) {
                          cList.add(Chat(
                            groupName: key,
                            date: (value['date'] == null
                                    ? Timestamp.now()
                                    : value['date'] as Timestamp)
                                .toDate()
                                .toString(),
                            lastMessage:
                                value.toString().contains('lastMessage')
                                    ? value['lastMessage']['text'].toString()
                                    : '',
                            isRead: value['read'] as bool,
                            personID: value['userInfo']['uid'].toString(),
                          ));
                        }
                      },
                    );

                    if (cList.length > 0) {
                      chatBloc.add(FetchChatLists(chatList: cList));

                      return BlocBuilder<ChatBloc, ChatState>(
                        bloc: chatBloc,
                        builder: (context, state) {
                          if (state.states == TheStates.loading) {
                            return Center(
                              child: CustomLoader(),
                            );
                          } else if (state.states == TheStates.success) {
                            return SingleChildScrollView(
                              child: Column(
                                children: List.generate(state.rCl?.length ?? 0,
                                    (index) {
                                  String date = DateTimeHelper.timeAgoSinceDate(
                                      state.rCl?[index].date?.toString() ?? '');
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        ChatPage.routeName,
                                        arguments: state.rCl?[index],
                                      );
                                    },
                                    child: Container(
                                      height: 108,
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.all(16.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  state.rCl?[index]
                                                          .profileImage ??
                                                      kHomaaleImg,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          addHorizontalSpace(8),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.79,
                                                child: Text(
                                                  state.rCl?[index].fullName
                                                          ?.toString() ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              addVerticalSpace(4),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.79,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      date,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Icon(
                                                      state.rCl?[index]
                                                                  .isRead ??
                                                              false
                                                          ? Icons
                                                              .check_circle_rounded
                                                          : Icons
                                                              .check_circle_outline_rounded,
                                                      size: 16,
                                                      color: kColorBlue,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              addVerticalSpace(4),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.79,
                                                child: Text(
                                                  '${state.rCl?[index].lastMessage ?? 'Start Conversation'}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          } else if (state.states == TheStates.failure) {
                            return Center(
                                child: CommonErrorContainer(
                              assetsPath: 'assets/no_data_found.png',
                              errorDes:
                                  'No chats. Start a service or task to initiate chat',
                            ));
                          } else {
                            return Center(child: CustomLoader());
                          }
                        },
                      );
                    } else {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Center(
                            child: CommonErrorContainer(
                          assetsPath: 'assets/no_data_found.png',
                          errorDes:
                              'No chats. Start a service or task to initiate chat',
                        )),
                      );
                    }
                  } else {
                    return Center(
                        child: CommonErrorContainer(
                      assetsPath: 'assets/no_data_found.png',
                      errorDes:
                          'No chats. Start a service or task to initiate chat',
                    ));
                  }
                }
                return Center(child: CardLoading(height: 200));
              },
            );
          }
          return Center(child: CardLoading(height: 200));
        },
      ),
    );
  }
}
