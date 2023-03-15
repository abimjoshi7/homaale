import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/pages/views/details_view.dart';
import 'package:cipher/features/services/presentation/pages/views/schedule_view.dart';
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
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedIndex == 0
                                    ? kColorSecondary
                                    : kColorGrey,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Text('1'),
                            ),
                          ),
                          addHorizontalSpace(
                            2,
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            color: selectedIndex == 0
                                ? kColorSecondary
                                : kColorGrey,
                          ),
                          Container(
                            height: 2,
                            width: 40,
                            color: selectedIndex == 1
                                ? kColorSecondary
                                : kColorGrey,
                          ),
                          addHorizontalSpace(2),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedIndex == 1
                                    ? kColorSecondary
                                    : kColorGrey,
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Text('2'),
                            ),
                          ),
                        ],
                      ),
                      addVerticalSpace(
                        20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Schedule',
                            style: TextStyle(
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          addHorizontalSpace(50),
                          Text(
                            'Details',
                            style: TextStyle(
                              fontWeight: selectedIndex == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width,
                    child: IndexedStack(
                      index: selectedIndex,
                      children: [
                        ScheduleView(),
                        DetailsView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              CustomElevatedButton(
                callback: () {
                  if (selectedIndex == 0) {
                    setState(() {
                      selectedIndex = 1;
                    });
                  }
                },
                label: selectedIndex == 0 ? "Next" : "Book",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomElevatedButton(
                  mainColor: Colors.white,
                  textColor: kColorPrimary,
                  callback: () {
                    if (selectedIndex == 1) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }
                  },
                  label: "Cancel",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
