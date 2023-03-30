import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/services/presentation/pages/sections/service_detail_header_section.dart';
import 'package:cipher/features/services/presentation/pages/views/details_view.dart';
import 'package:cipher/features/services/presentation/pages/views/schedule_view.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServiceBookingPage extends StatefulWidget {
  static const routeName = '/service-booking-page';
  const ServiceBookingPage({super.key});

  @override
  State<ServiceBookingPage> createState() => _ServiceBookingPageState();
}

class _ServiceBookingPageState extends State<ServiceBookingPage> {
  int selectedIndex = 0;
  late PageController _pageController;
  final List<Widget> widgetList = [
    SingleChildScrollView(child: const ScheduleView()),
    const DetailsView(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => BookEventHandlerBloc(),
        child: BlocBuilder<EventBloc, EventState>(
          builder: (context, eventState) {
            if (eventState.theStates == TheStates.initial) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                addVerticalSpace(
                  50,
                ),
                const CustomHeader(
                  label: "Service Booking",
                ),
                const Divider(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ServiceBookingHeaderSection(
                          selectedIndex: selectedIndex,
                        ),
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            itemCount: widgetList.length,
                            itemBuilder: (context, index) =>
                                widgetList[index % widgetList.length],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
                      builder: (context, state) {
                        if (state.theStates == TheStates.success) {
                          return BlocListener<BookingsBloc, BookingsState>(
                            listenWhen: (previous, current) {
                              if (previous.isBooked == false) {
                                return true;
                              } else {
                                return false;
                              }
                            },
                            listener: (context, bookingState) async {
                              final error = await CacheHelper.getCachedString(
                                kErrorLog,
                              );
                              if (bookingState.states == TheStates.success &&
                                  bookingState.isBooked == true) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Success',
                                    content: 'Booking is successful',
                                    onTap: () async {
                                      await CacheHelper.clearCachedData(
                                              kBookedMap)
                                          .whenComplete(
                                        () => Navigator.pushNamed(
                                          context,
                                          Root.routeName,
                                        ),
                                      );
                                    },
                                    isSuccess: true,
                                  ),
                                );
                              }
                              if (bookingState.states == TheStates.failure &&
                                  bookingState.isBooked == false) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Failure',
                                    content: error ??
                                        'Something went wrong. Please try again later.',
                                    onTap: () async {},
                                    isSuccess: false,
                                  ),
                                );
                              }
                            },
                            child: showBookButton(state, context),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    addVerticalSpace(4),
                    showCancelButton(context),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget showCancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: Visibility(
        visible: selectedIndex == 1,
        child: CustomElevatedButton(
          mainColor: Colors.white,
          textColor: kColorPrimary,
          borderColor: kColorPrimary,
          callback: () {
            if (_pageController.page == 1) {
              setState(() {
                selectedIndex = 0;
              });
              _pageController.jumpToPage(0);
            } else {
              Navigator.pop(context);
            }
          },
          label: "Cancel",
        ),
      ),
    );
  }

  Widget showBookButton(TaskEntityServiceState state, BuildContext context) {
    return BlocBuilder<BookEventHandlerBloc, BookEventHandlerState>(
      builder: (context, persistState) {
        return CustomElevatedButton(
          callback: () async {
            if (_pageController.page == 0) {
              setState(() {
                selectedIndex = 1;
              });
              _pageController.jumpToPage(1);
            } else {
              print(persistState);
              final req = BookEntityServiceReq(
                location: state.taskEntityService?.location,
                entityService: state.taskEntityService?.id,
                budgetTo: persistState.budget,
                requirements: persistState.requirements == null
                    ? []
                    : List<String>.from(
                        persistState.requirements as Iterable,
                      ),
                startDate: DateTime.parse(
                  persistState.startDate ?? '',
                ),
                endDate: DateTime.parse(
                  persistState.endDate ?? '',
                ),
                startTime: persistState.startTime,
                endTime: persistState.endTime,
                description: persistState.description,
                images: persistState.images == null
                    ? []
                    : List<int>.from(
                        persistState.images as Iterable,
                      ),
                videos: persistState.videos == null
                    ? []
                    : List<int>.from(
                        persistState.videos as Iterable,
                      ),
              );
              print(req.toJson());
              context.read<BookingsBloc>().add(
                    BookingCreated(req),
                  );

              // await CacheHelper.getCachedString(kBookedMap).then(
              //   (value) {
              //     final Map<String, dynamic> map1 =
              //         jsonDecode(value!) as Map<String, dynamic>;

              //     try {
              //       // final req = BookEntityServiceReq(
              //       //   location: state.taskEntityService?.location,
              //       //   entityService: state.taskEntityService?.id,
              //       //   budgetTo: map1["budget_to"] as double?,
              //       //   requirements: map1["requirements"] == null
              //       //       ? []
              //       //       : List<String>.from(
              //       //           map1["requirements"] as Iterable,
              //       //         ),
              //       //   startDate: DateTime.parse(
              //       //     map1["end_date"] as String,
              //       //   ),
              //       //   endDate: DateTime.parse(
              //       //     map1["end_date"] as String,
              //       //   ),
              //       //   startTime: map1["start_time"] as String?,
              //       //   description: map1["description"] as String?,
              //       //   images: map1["images"] == null
              //       //       ? []
              //       //       : List<int>.from(
              //       //           map1["images"] as Iterable,
              //       //         ),
              //       //   videos: map1["videos"] == null
              //       //       ? []
              //       //       : List<int>.from(
              //       //           map1["videos"] as Iterable,
              //       //         ),
              //       // );
              //       // context.read<BookingsBloc>().add(
              //       //       BookingCreated(req),
              //       //     );
              //     } catch (e) {
              //       print(e);
              //     }
              //   },
              // );
            }
          },
          label: selectedIndex == 0 ? "Next" : "Book",
        );
      },
    );
  }
}
