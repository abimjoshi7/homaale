import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:flutter/material.dart';

class BookingsMainSection extends StatefulWidget {
  const BookingsMainSection({super.key});

  @override
  State<BookingsMainSection> createState() => _BookingsMainSectionState();
}

class _BookingsMainSectionState extends State<BookingsMainSection>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: selectedIndex,
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          // indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
          tabs: const [
            Text("In Progress"),
            Text("Bookings"),
            Text("Draft"),
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
              InProgressSection(),
              BookingsSection(),
              DraftSection(),
              BookingsHistorySection(),
            ],
          ),
        ),
      ],
    );
  }
}
