import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/sections.dart';
import 'package:cipher/features/bookings/presentation/widgets/sections/todos/task_section.dart';
import 'package:flutter/material.dart';

class MyBookingsTabSection extends StatefulWidget {
  final BookingsBloc bloc;
  const MyBookingsTabSection({super.key, required this.bloc});

  @override
  State<MyBookingsTabSection> createState() => _MyBookingsTabSectionState();
}

class _MyBookingsTabSectionState extends State<MyBookingsTabSection>
    with SingleTickerProviderStateMixin {
  late final bookingsBloc = widget.bloc;
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
            labelPadding: const EdgeInsets.all(10),
            controller: tabController,
            tabs: const [
              Text("ToDo's"),
              Text("Services"),
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
                TaskSection(bloc: bookingsBloc),
                ServicesSection(bloc: bookingsBloc),
                HistorySection(bloc: bookingsBloc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
