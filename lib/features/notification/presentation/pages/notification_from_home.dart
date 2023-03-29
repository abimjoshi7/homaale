import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
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
        actions: [],
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<NotificationBloc>().add(NotificationAllRead());
                          },
                          child: Text(
                            'Mark all as read',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kHeight10,
                  if (state.theStates == TheStates.success &&
                      state.allNotificationList!.result != null &&
                      state.allNotificationList!.result?.length != 0)
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: state.allNotificationList!.result!.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        String? statusTitle = state.allNotificationList?.result![index].title;

                        return DateTime.now()
                                    .difference(DateTime(
                                        state.allNotificationList?.result?[index].createdDate?.year ?? 0,
                                        state.allNotificationList?.result?[index].createdDate?.month ?? 0,
                                        state.allNotificationList?.result?[index].createdDate?.day ?? 0))
                                    .inDays ==
                                0
                            ? ListTileComponent(
                                readDate: state.allNotificationList?.result![index].readDate,
                                bgColor:
                                    getNotificationStatus(statusTitle?.toLowerCase() ?? '', '', '')["color"] as Color,
                                userName: state.allNotificationList?.result![index].user ?? "",
                                statusDetails:
                                    getNotificationStatus(statusTitle?.toLowerCase() ?? '', '', '')["message"]
                                        as String,
                                statusTitle: getNotificationStatus(
                                    statusTitle?.toLowerCase() ?? '',
                                    state.allNotificationList?.result![index].createdFor?.fullName ?? "",
                                    state.allNotificationList?.result![index].contentObject?.entityService?.title ??
                                        "")["status"] as String,
                                time: state.allNotificationList?.result![index].createdDate,
                                userImage: state.allNotificationList!.result![index].createdFor?.profileImage ??
                                    kServiceImageNImg,
                              )
                            : const SizedBox();
                      },
                    ),
                  if (state.theStates == TheStates.success)
                    state.allNotificationList?.result?.isEmpty ?? false
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            padding: kPadding20,
                            color: Colors.white,
                            child: const Center(
                              child: Text("No today's notifications to show."),
                            ),
                          )
                        : DateTime.now()
                                    .difference(DateTime(
                                        state.allNotificationList?.result?[0].createdDate?.year ?? 0,
                                        state.allNotificationList?.result?[0].createdDate?.month ?? 0,
                                        state.allNotificationList?.result?[0].createdDate?.day ?? 0))
                                    .inDays !=
                                0
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: kPadding20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text("No today's notifications to show."),
                                ),
                              )
                            : SizedBox(),
                  kHeight10,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text("Earlier"),
                  ),
                  if (state.theStates == TheStates.success &&
                      state.allNotificationList!.result != null &&
                      state.allNotificationList!.result?.length != 0)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.allNotificationList?.result!.length,
                      itemBuilder: (context, index) {
                        String? statusTitle = state.allNotificationList?.result![index].title;
                        return DateTime.now()
                                    .difference(DateTime(
                                        state.allNotificationList?.result?[index].createdDate?.year ?? 0,
                                        state.allNotificationList?.result?[index].createdDate?.month ?? 0,
                                        state.allNotificationList?.result?[index].createdDate?.day ?? 0))
                                    .inDays >
                                0
                            ? ListTileComponent(
                                bgColor:
                                    getNotificationStatus(statusTitle?.toLowerCase() ?? '', '', '')["color"] as Color,
                                readDate: state.allNotificationList?.result![index].readDate,
                                statusTitle: getNotificationStatus(
                                    statusTitle?.toLowerCase() ?? '',
                                    state.allNotificationList?.result![index].createdFor?.fullName ?? "",
                                    state.allNotificationList?.result![index].contentObject?.entityService?.title ??
                                        "")["status"] as String,
                                userName: state.allNotificationList?.result![index].user ?? "",
                                statusDetails: getNotificationStatus(
                                    statusTitle ?? '',
                                    state.allNotificationList?.result![index].createdFor?.fullName ?? "",
                                    state.allNotificationList?.result![index].contentObject?.entityService?.title ??
                                        "")["message"] as String,
                                time: state.allNotificationList?.result![index].createdDate,
                                // userImage: getNotificationStatus(statusTitle ?? '', "", state.allNotificationList?.result![index].contentObject?.entityService?.title ?? "")["assets"] as String

                                userImage: state.allNotificationList!.result![index].createdFor == null
                                    ? kServiceImageNImg
                                    : state.allNotificationList!.result![index].createdFor!.profileImage ?? "",
                              )
                            : const SizedBox();
                      },
                    ),
                  if (state.theStates == TheStates.success)
                    state.allNotificationList?.result?.isEmpty ?? false
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            padding: kPadding20,
                            color: Colors.white,
                            child: const Center(
                              child: Text("No earlier notifications to show."),
                            ),
                          )
                        : DateTime.now()
                                    .difference(DateTime(
                                        state.allNotificationList?.result?[0].createdDate?.year ?? 0,
                                        state.allNotificationList?.result?[0].createdDate?.month ?? 0,
                                        state.allNotificationList?.result?[0].createdDate?.day ?? 0))
                                    .inDays >
                                1
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: kPadding20,
                                color: Colors.white,
                                child: const Center(
                                  child: Text("No earlier notifications to show."),
                                ),
                              )
                            : SizedBox(),
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
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
