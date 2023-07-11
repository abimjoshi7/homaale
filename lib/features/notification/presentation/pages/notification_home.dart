import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Notifications",
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          switch (state.notificationStatus) {
            case NotificationStatus.loading:
              return Center(child: CustomLoader());
            case NotificationStatus.success:
              final todayList = state.notificationList
                  .where((element) =>
                      DateTime.now()
                          .difference(DateTime(
                              element.createdDate?.year ?? 0,
                              element.createdDate?.month ?? 0,
                              element.createdDate?.day ?? 0))
                          .inDays ==
                      0)
                  .toList();

              final earlierList = state.notificationList
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
                            todayList[index].contentObject?.status ==
                                        "pending" &&
                                    (todayList[index].title == "negotiated" ||
                                        todayList[index].title == "accepted")
                                ? todayList[index].title
                                : todayList[index].contentObject?.status ??
                                    todayList[index].title;
                        return ListTileComponent(
                          hasStatusBox:
                              !(todayList[index].title == "negotiated" ||
                                  todayList[index].title == "accepted"),
                          readDate: state.notificationList[index].readDate,
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
                                  kHomaaleImg,
                        );
                      },
                    ),
                    if (todayList.isEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: kPadding20,
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
                            earlierList[index].contentObject?.status ==
                                        "pending" &&
                                    (earlierList[index].title == "negotiated" ||
                                        earlierList[index].title == "accepted")
                                ? earlierList[index].title
                                : earlierList[index].contentObject?.status ??
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
                                  earlierList[index].createdFor?.fullName ?? "",
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
                                  earlierList[index].createdFor?.fullName ?? "",
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
                                  earlierList[index].createdFor?.fullName ?? "",
                              serviceName: earlierList[index]
                                      .contentObject
                                      ?.entityService
                                      ?.title ??
                                  "")["status"] as String,
                          time: earlierList[index].createdDate,
                          userImage:
                              earlierList[index].createdFor?.profileImage ??
                                  kHomaaleImg,
                        );
                      },
                    ),
                    if (earlierList.isEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: kPadding20,
                        child: const Center(
                          child: Text("No earlier notifications to show."),
                        ),
                      ),
                  ],
                ),
              );
            default:
              return Center(child: CustomLoader());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom)
      context.read<NotificationBloc>().add(MyNotificationListInitiated());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
