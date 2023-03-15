import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/notification/presentation/cubit/all_notification_list_cubit.dart';
import 'package:cipher/widgets/list_tile_component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class NotificationFromHome extends StatelessWidget {
  static const routeName = '/notification-home';

  const NotificationFromHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
              color: kColorSilver,
            ),
          ),
        ],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          DateTime today = DateTime.now(); // 30/09/2021 15:54:30
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Today',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Mark as all read',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight10,
                if (state.theStates == TheStates.success &&
                    state.allNotificationList!.result != null)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.allNotificationList!.result!.length,
                    itemBuilder: (context, index) {
                      return state.allNotificationList?.result![index]
                                  .createdDate ==
                              today
                          ? ListTileComponent(
                              userName: state.allNotificationList
                                      ?.result![index].user ??
                                  "",
                              statusDetails: state
                                      .allNotificationList
                                      ?.result![index]
                                      .contentObject!
                                      .entityService!
                                      .title
                                      .toString() ??
                                  "",
                              statusTitle: state.allNotificationList
                                      ?.result![index].title ??
                                  "",
                              time: state.allNotificationList?.result![index]
                                  .createdDate,
                              userImage: state
                                      .allNotificationList!
                                      .result![index]
                                      .createdFor!
                                      .profileImage ??
                                  kServiceImageNImg,
                            )
                          : const SizedBox();
                    },
                  ),
                if (state.allNotificationList == null ||
                    state.allNotificationList?.result![0].createdDate != today)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: kPadding20,
                    color: Colors.white,
                    child: const Center(
                        child: Text("No today's notifications to show.")),
                  ),
                kHeight10,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  child: Text("Earlier"),
                ),
                if (state.theStates == TheStates.success &&
                    state.allNotificationList != null)
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.allNotificationList?.result!.length,
                    itemBuilder: (context, index) {
                      return state.allNotificationList?.result![index]
                                  .createdDate !=
                              today
                          ? ListTileComponent(
                              userName: state.allNotificationList
                                      ?.result![index].user ??
                                  "",
                              statusDetails: state
                                      .allNotificationList
                                      ?.result![index]
                                      .contentObject!
                                      .entityService!
                                      .title
                                      .toString() ??
                                  "",
                              statusTitle: state.allNotificationList
                                      ?.result![index].title ??
                                  "",
                              time: state.allNotificationList?.result![index]
                                  .createdDate,
                              userImage: state.allNotificationList!
                                          .result![index].createdFor ==
                                      null
                                  ? kServiceImageNImg
                                  : state.allNotificationList!.result![index]
                                          .createdFor!.profileImage ??
                                      "",
                            )
                          : const CircularProgressIndicator();
                    },
                  ),
                if (state.allNotificationList?.result == null)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: kPadding20,
                    color: Colors.white,
                    child: const Center(
                      child: Text("No notifications to show."),
                    ),
                  ),
                kHeight10,

              ],
            ),
          );
        },
      ),
    );
  }
}
