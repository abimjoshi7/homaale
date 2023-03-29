import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/notification/data/models/all_notification_list.dart';
import 'package:cipher/features/notification/presentation/bloc/notification_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/list_tile_component.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class NotificationFromHome extends StatefulWidget {
  static const routeName = '/notification-home';

  const NotificationFromHome({super.key});

  @override
  State<NotificationFromHome> createState() => _NotificationFromHomeState();
}

class _NotificationFromHomeState extends State<NotificationFromHome> {
  late final notificationBloc = locator<NotificationBloc>();
  List<Result> todoList = [];

  //initialize page controller
  final PagingController<int, Result> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => notificationBloc.add(MyNotificationListInitiated(page: pageKey)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    notificationBloc.close();
    _pagingController.dispose();
  }

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
      body: BlocListener<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        listener: (context, state) {
          if (state.markAllRead ?? false) {
            _pagingController.refresh();
          }
          if (state.theStates == TheStates.success) {
            todoList = state.allNotificationList!.result!;

            final lastPage = state.allNotificationList!.totalPages!;
            final next = 1 + state.allNotificationList!.current!;

            if (next > lastPage) {
              _pagingController.appendLastPage(todoList);
            } else {
              _pagingController.appendPage(todoList, next);
            }
          }
          if (state.theStates == TheStates.failure) {
            _pagingController.error = 'Error';
          }
        },
        child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            return Column(
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
                          notificationBloc.add(NotificationAllRead());
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: PagedListView(
                      pagingController: _pagingController,
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, Result item, index) {
                          String? statusTitle = item.contentObject?.status ?? item.title;

                          return DateTime.now()
                                      .difference(DateTime(item.createdDate?.year ?? 0, item.createdDate?.month ?? 0,
                                          item.createdDate?.day ?? 0))
                                      .inDays ==
                                  0
                              ? GestureDetector(
                                  onTap: () {
                                    // context
                                    //     .read<NotificationBloc>()
                                    //     .add(NotificationAllRead(id: item.id));
                                  },
                                  child: ListTileComponent(
                                    readDate: item.readDate,
                                    bgColor: getNotificationStatus(
                                        status: statusTitle?.toLowerCase() ?? '',
                                        isRequested: item.contentObject?.entityService?.isRequested ?? false,
                                        userName: item.createdFor?.fullName ?? "",
                                        serviceName: item.contentObject?.entityService?.title ?? "")["color"] as Color,
                                    userName: item.user ?? "",
                                    statusDetails: getNotificationStatus(
                                            status: statusTitle?.toLowerCase() ?? '',
                                            isRequested: item.contentObject?.entityService?.isRequested ?? false,
                                            userName: item.createdFor?.fullName ?? "",
                                            serviceName: item.contentObject?.entityService?.title ?? "")["message"]
                                        as String,
                                    statusTitle: getNotificationStatus(
                                            status: statusTitle?.toLowerCase() ?? '',
                                            isRequested: item.contentObject?.entityService?.isRequested ?? false,
                                            userName: item.createdFor?.fullName ?? "",
                                            serviceName: item.contentObject?.entityService?.title ?? "")["status"]
                                        as String,
                                    time: item.createdDate,
                                    userImage: item.createdFor?.profileImage ?? kServiceImageNImg,
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ),
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
                  Expanded(
                    child: PagedListView(
                      pagingController: _pagingController,
                      shrinkWrap: true,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (context, Result item, index) {
                          String? statusTitle = item.contentObject?.status ?? item.title;
                          return DateTime.now()
                                      .difference(DateTime(item.createdDate?.year ?? 0, item.createdDate?.month ?? 0,
                                          item.createdDate?.day ?? 0))
                                      .inDays >
                                  0
                              ? GestureDetector(
                                  onTap: () {
                                    // context
                                    //     .read<NotificationBloc>()
                                    //     .add(NotificationAllRead(id: state.allNotificationList?.result![index].id));
                                  },
                                  child: ListTileComponent(
                                    readDate: item.readDate,
                                    bgColor: getNotificationStatus(
                                        status: statusTitle?.toLowerCase() ?? '',
                                        isRequested: item.contentObject?.entityService?.isRequested ?? false,
                                        userName: item.createdFor?.fullName ?? "",
                                        serviceName: item.contentObject?.entityService?.title ?? "")["color"] as Color,
                                    userName: item.user ?? "",
                                    statusDetails: getNotificationStatus(
                                            status: statusTitle?.toLowerCase() ?? '',
                                            isRequested: item.contentObject?.entityService?.isRequested ?? false,
                                            userName: item.createdFor?.fullName ?? "",
                                            serviceName: item.contentObject?.entityService?.title ?? "")["message"]
                                        as String,
                                    statusTitle: getNotificationStatus(
                                            status: statusTitle?.toLowerCase() ?? '',
                                            isRequested: item.contentObject?.entityService?.isRequested ?? false,
                                            userName: item.createdFor?.fullName ?? "",
                                            serviceName: item.contentObject?.entityService?.title ?? "")["status"]
                                        as String,
                                    time: item.createdDate,
                                    userImage: item.createdFor?.profileImage ?? kServiceImageNImg,
                                  ),
                                )
                              : const SizedBox();
                        },
                      ),
                    ),
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
            );
          },
        ),
      ),
    );
  }
}
