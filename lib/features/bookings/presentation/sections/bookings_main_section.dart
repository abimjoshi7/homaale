import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/sections/in_progress_section.dart';
import 'package:cipher/features/bookings/presentation/sections/sections.dart';
import 'package:cipher/features/bookings/presentation/widgets/bookings_service_card.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
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
          indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
          labelPadding: EdgeInsets.all(15),
          // padding: EdgeInsets.all(2),

          labelColor: kColorSecondary,
          controller: tabController,
          indicatorColor: kColorSecondary,
          unselectedLabelColor: kColorGrey,
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
              HistorySection(),
            ],
          ),
        ),
      ],
    );
  }
}
