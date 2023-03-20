import 'dart:convert';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/event/presentation/bloc/event_bloc.dart';
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
    const ScheduleView(),
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
      body: BlocBuilder<EventBloc, EventState>(
        builder: (context, state) {
          if (state.theStates == TheStates.initial) {
            return Center(child: const CircularProgressIndicator());
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
                          listener: (context, bookingState) {
                            if (bookingState.isBooked == true) {
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
                          },
                          child: CustomElevatedButton(
                            callback: () async {
                              if (_pageController.page == 0) {
                                setState(() {
                                  selectedIndex = 1;
                                });
                                _pageController.jumpToPage(1);
                              } else {
                                await CacheHelper.getCachedString(kBookedMap)
                                    .then(
                                  (value) {
                                    final Map<String, dynamic> map1 =
                                        jsonDecode(value!)
                                            as Map<String, dynamic>;

                                    try {
                                      // print(map1);
                                      final req = BookEntityServiceReq(
                                        location:
                                            state.taskEntityService?.location,
                                        entityService:
                                            state.taskEntityService?.id,
                                        budgetTo: map1["budget_to"] as double?,
                                        requirements:
                                            map1["requirements"] == null
                                                ? []
                                                : List<String>.from(
                                                    map1["requirements"]
                                                        as Iterable,
                                                  ),
                                        startDate: DateTime.parse(
                                          map1["end_date"] as String,
                                        ),
                                        endDate: DateTime.parse(
                                          map1["end_date"] as String,
                                        ),
                                        startTime:
                                            map1["start_time"] as String?,
                                        description:
                                            map1["description"] as String?,
                                        images: map1["images"] == null
                                            ? []
                                            : List<int>.from(
                                                map1["images"] as Iterable,
                                              ),
                                        videos: map1["videos"] == null
                                            ? []
                                            : List<int>.from(
                                                map1["videos"] as Iterable,
                                              ),
                                      );
                                      print(jsonEncode(req.toJson()));
                                      context.read<BookingsBloc>().add(
                                            BookingCreated(req),
                                          );
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                );
                              }
                            },
                            label: selectedIndex == 0 ? "Next" : "Book",
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomElevatedButton(
                      mainColor: Colors.white,
                      textColor: kColorPrimary,
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
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
