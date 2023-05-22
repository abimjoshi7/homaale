import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/notification/data/models/all_notification_list.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/widgets/list_tile_component.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class NotificationFromHome extends StatefulWidget {
  static const routeName = '/notification-home';

  const NotificationFromHome({super.key});

  @override
  State<NotificationFromHome> createState() => _NotificationFromHomeState();
}

class _NotificationFromHomeState extends State<NotificationFromHome> {
  ScrollController _scrollController = new ScrollController();

  List<Result> notificationList = [];

  int currentPage = 1;
  int totalPages = 0;

  @override
  void initState() {
    context.read<NotificationBloc>().add(MyNotificationListInitiated(
        page: currentPage, isMarkAllRead: false, isRefetch: false));

    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        currentPage = context
                .read<NotificationBloc>()
                .state
                .allNotificationList
                ?.current ??
            1;
        totalPages = context
                .read<NotificationBloc>()
                .state
                .allNotificationList
                ?.totalPages ??
            0;
        notificationList = context
                .read<NotificationBloc>()
                .state
                .allNotificationList
                ?.result ??
            [];
      });

      _scrollController.addListener(() async {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          if (currentPage != totalPages) {
            currentPage += 1;
            context.read<NotificationBloc>().add(MyNotificationListInitiated(
                  page: currentPage,
                  isRefetch: true,
                  isMarkAllRead: false,
                ));
          }
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Notifications",
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocListener<NotificationBloc, NotificationState>(
        listener: (context, state) {
          if (state.isRefetch ?? false) {
            List<Result> newList = state.allNotificationList!.result!;

            setState(() {
              notificationList = [...notificationList, ...newList];
            });
          }

          if (state.markAllRead ?? false) {
            setState(() {
              currentPage = context
                      .read<NotificationBloc>()
                      .state
                      .allNotificationList
                      ?.current ??
                  1;
              totalPages = context
                      .read<NotificationBloc>()
                      .state
                      .allNotificationList
                      ?.totalPages ??
                  0;
              notificationList = context
                      .read<NotificationBloc>()
                      .state
                      .allNotificationList
                      ?.result ??
                  [];
            });
          }
        },
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state.theStates == TheStates.initial) {
              return const Center(
                child: CardLoading(
                  height: 200,
                ),
              );
            } else if (state.theStates == TheStates.success) {
              final todayList = notificationList
                  .where((element) =>
                      DateTime.now()
                          .difference(DateTime(
                              element.createdDate?.year ?? 0,
                              element.createdDate?.month ?? 0,
                              element.createdDate?.day ?? 0))
                          .inDays ==
                      0)
                  .toList();

              final earlierList = notificationList
                  .where((element) =>
                      DateTime.now()
                          .difference(DateTime(
                              element.createdDate?.year ?? 0,
                              element.createdDate?.month ?? 0,
                              element.createdDate?.day ?? 0))
                          .inDays >
                      0)
                  .toList();
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<NotificationBloc>().add(
                        MyNotificationListInitiated(
                            page: 1, isMarkAllRead: false, isRefetch: false));
                  },
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Today',
                              // style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  context
                                      .read<NotificationBloc>()
                                      .add(NotificationAllRead());
                                });
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
                      ListView.builder(
                        itemCount: todayList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          String? statusTitle =
                              todayList[index].contentObject?.status ??
                                  todayList[index].title;
                          return ListTileComponent(
                            readDate: notificationList[index].readDate,
                            bgColor: getNotificationStatus(
                                status: statusTitle?.toLowerCase() ?? '',
                                isRequested: todayList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.isRequested ??
                                    false,
                                userName:
                                    todayList[index].createdFor?.fullName ?? "",
                                serviceName: todayList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.title ??
                                    "")["color"] as Color,
                            userName: todayList[index].user ?? "",
                            statusDetails: getNotificationStatus(
                                status: statusTitle?.toLowerCase() ?? '',
                                isRequested: todayList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.isRequested ??
                                    false,
                                userName:
                                    todayList[index].createdFor?.fullName ?? "",
                                serviceName: todayList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.title ??
                                    "")["message"] as String,
                            statusTitle: getNotificationStatus(
                                status: statusTitle?.toLowerCase() ?? '',
                                isRequested: todayList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.isRequested ??
                                    false,
                                userName:
                                    todayList[index].createdFor?.fullName ?? "",
                                serviceName: todayList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.title ??
                                    "")["status"] as String,
                            time: todayList[index].createdDate,
                            userImage:
                                todayList[index].createdFor?.profileImage ??
                                    kServiceImageNImg,
                          );
                        },
                      ),
                      if (todayList.isEmpty)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: kPadding20,
                          // color: Colors.white,
                          child: const Center(
                            child: Text("No today's notifications to show."),
                          ),
                        ),
                      kHeight10,
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        child: Text("Earlier"),
                      ),
                      kHeight10,
                      ListView.builder(
                        itemCount: earlierList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          String? statusTitle =
                              earlierList[index].contentObject?.status ??
                                  earlierList[index].title;
                          return ListTileComponent(
                            readDate: earlierList[index].readDate,
                            bgColor: getNotificationStatus(
                                status: statusTitle?.toLowerCase() ?? '',
                                isRequested: earlierList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.isRequested ??
                                    false,
                                userName:
                                    earlierList[index].createdFor?.fullName ??
                                        "",
                                serviceName: earlierList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.title ??
                                    "")["color"] as Color,
                            userName: earlierList[index].user ?? "",
                            statusDetails: getNotificationStatus(
                                status: statusTitle?.toLowerCase() ?? '',
                                isRequested: earlierList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.isRequested ??
                                    false,
                                userName:
                                    earlierList[index].createdFor?.fullName ??
                                        "",
                                serviceName: earlierList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.title ??
                                    "")["message"] as String,
                            statusTitle: getNotificationStatus(
                                status: statusTitle?.toLowerCase() ?? '',
                                isRequested: earlierList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.isRequested ??
                                    false,
                                userName:
                                    earlierList[index].createdFor?.fullName ??
                                        "",
                                serviceName: earlierList[index]
                                        .contentObject
                                        ?.entityService
                                        ?.title ??
                                    "")["status"] as String,
                            time: earlierList[index].createdDate,
                            userImage:
                                earlierList[index].createdFor?.profileImage ??
                                    kServiceImageNImg,
                          );
                        },
                      ),
                      if (earlierList.isEmpty)
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: kPadding20,
                          // color: Colors.white,
                          child: const Center(
                            child: Text("No earlier notifications to show."),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
