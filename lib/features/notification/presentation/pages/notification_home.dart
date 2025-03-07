import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/kyc_constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/kyc/bloc/kyc_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/pages/booking_item_detail_page.dart';
import 'package:cipher/features/notification/data/models/all_notification_list.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
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
                            _initializeStatusTitle(todayList[index]);
                        return ListTileComponent(
                          onTapCallback: () => _onTilePressed(todayList[index]),
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
                          userImage: getNotificationStatus(
                                  status: statusTitle?.toLowerCase() ?? '',
                                  isRequested: todayList[index]
                                          .contentObject
                                          ?.entityService
                                          ?.isRequested ??
                                      false,
                                  userName:
                                      todayList[index].createdFor?.fullName ??
                                          "",
                                  serviceName: todayList[index]
                                          .contentObject
                                          ?.entityService
                                          ?.title ??
                                      "")["assets"] as String? ??
                              todayList[index].createdFor?.profileImage ??
                              kHomaaleImg,
                          hasAssets: getNotificationStatus(
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
                                  "")["has_assets"] as bool,
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
                            _initializeStatusTitle(earlierList[index]);

                        return ListTileComponent(
                          onTapCallback: () =>
                              _onTilePressed(earlierList[index]),
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
                          userImage: getNotificationStatus(
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
                                      "")["assets"] as String? ??
                              earlierList[index].createdFor?.profileImage ??
                              kHomaaleImg,
                          hasAssets: getNotificationStatus(
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
                                  "")["has_assets"] as bool,
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

  String? _initializeStatusTitle(Result notification) {
    if ((notification.title == "Approved") ||
        (notification.title == "approval") ||
        notification.title == "accepted") {
      return notification.title;
    }
    if (notification.title == "booking" ||
        notification.title == "reward_earned" ||
        notification.title == "status closed") {
      return notification.title;
    }
    if ((notification.contentObject?.status == "pending" &&
        (notification.title == "negotiated" ||
            notification.title == "accepted"))) {
      return notification.title;
    }
    return notification.contentObject?.status ?? notification.title;
  }

  void _onTilePressed(Result notification) async {
    if (notification.contentObject?.entityService == null) {
      if (notification.title == "kyc_document_submitted" ||
          notification.title == "kyc_document_verified" ||
          notification.title == "kyc_document_rejected") {
        conditionalCheckNavigation(
          context,
          context.read<KycBloc>().state,
        );
      }
    }
    if (notification.title == "booking") {
      Navigator.pushNamed(
        context,
        Root.routeName,
        arguments: {
          "index": 1,
        },
      );
    }
    if (notification.title == "Approved" ||
        notification.title == "cancelled" ||
        notification.title == "status closed" ||
        notification.title == "status completed") {
      BlocProvider.of<BookingsBloc>(context).add(
        BookingSingleLoaded(
            notification.contentObject?.task ?? notification.contentObject?.id),
      );

      await Future.delayed(
        Duration(milliseconds: 50),
        () => Navigator.pushNamed(
          context,
          BookingItemDetailPage.routeName,
          arguments: {
            'client':
                notification.contentObject?.entityService?.isRequested == true
                    ? 'merchant'
                    : 'client',
            'title': notification.contentObject?.entityService?.title,
          },
        ),
      );
    }
    if (notification.title == "payment completed") {
      Navigator.pushNamed(
        context,
        Root.routeName,
        arguments: {
          "index": 3,
        },
      );
    }
    if (notification.contentObject?.entityService == null) return;
    if (notification.title == "booking" ||
        notification.title == "Approved" ||
        notification.title == "payment completed" ||
        notification.title == "cancelled" ||
        notification.title == "status closed" ||
        notification.title == "status completed") return;
    if (notification.contentObject?.entityService?.isRequested == true) {
      context.read<TaskBloc>().add(
            SingleEntityTaskLoadInitiated(
              id: notification.contentObject?.entityService?.id ?? '',
              userId:
                  context.read<UserBloc>().state.taskerProfile?.user?.id ?? '',
            ),
          );
      Navigator.pushNamed(context, SingleTaskPage.routeName);
    } else {
      context.read<TaskEntityServiceBloc>().add(
            TaskEntityServiceSingleLoaded(
              id: notification.contentObject?.entityService?.id ?? '',
            ),
          );
      Navigator.pushNamed(
        context,
        TaskEntityServicePage.routeName,
      );
    }
  }
}
