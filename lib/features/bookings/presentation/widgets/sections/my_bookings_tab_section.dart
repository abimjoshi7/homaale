import 'package:cipher/features/bookings/presentation/widgets/sections/sections.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/todos/task_section.dart';
import 'package:flutter/material.dart';

class MyBookingsTabSection extends StatefulWidget {
  const MyBookingsTabSection({super.key});

  @override
  State<MyBookingsTabSection> createState() => _MyBookingsTabSectionState();
}

class _MyBookingsTabSectionState extends State<MyBookingsTabSection> with SingleTickerProviderStateMixin {
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
            labelPadding: const EdgeInsets.all(10),
            controller: tabController,
            tabs: const [
              Text("TODOs"),
              Text("Services"),
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
                TaskSection(),
                ServicesSection(),
                HistorySection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
