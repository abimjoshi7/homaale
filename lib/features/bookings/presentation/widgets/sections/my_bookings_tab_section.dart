import 'package:cipher/features/bookings/presentation/widgets/sections/booking_sections.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/paddings.dart';
import 'history/history_section.dart';

class MyBookingsTabSection extends StatefulWidget {
  const MyBookingsTabSection({super.key,});

  @override
  State<MyBookingsTabSection> createState() => _MyBookingsTabSectionState();
}

class _MyBookingsTabSectionState extends State<MyBookingsTabSection> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    tabController = TabController(
      initialIndex: selectedIndex,
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TabBar(
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            labelPadding: kPadding10,
            controller: tabController,
            indicatorColor: kColorSecondary,
            tabs: const [
              Text("ToDo's"),
              Text("Bookings"),
              Text("History"),
            ],
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                BookingSection(bookingSectionType: BookingSectionType.todo),
                BookingSection(bookingSectionType: BookingSectionType.myBooking),
                HistorySection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
