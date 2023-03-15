import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:flutter/material.dart';

class MyBookingsMainSection extends StatefulWidget {
  const MyBookingsMainSection({super.key});

  @override
  State<MyBookingsMainSection> createState() => _MyBookingsMainSectionState();
}

class _MyBookingsMainSectionState extends State<MyBookingsMainSection>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: selectedIndex,
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TabBar(
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            labelPadding: const EdgeInsets.all(10),
            controller: tabController,
            tabs: const [
              Text("Unapproved"),
              Text("Approved"),
              // Text("Draft"),
              Text("History"),
            ],
            onTap: (value) => setState(
              () {
                selectedIndex = value;
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                UnapprovedSection(),
                ApprovedSection(),
                // DraftSection(),
                HistorySection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
