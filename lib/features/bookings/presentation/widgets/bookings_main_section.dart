import 'package:cipher/core/constants/constants.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBar(
              labelColor: kColorSecondary,
              controller: tabController,
              indicatorColor: kColorSecondary,
              unselectedLabelColor: kColorGrey,
              tabs: const [
                Text("Tasks"),
                Text("Services"),
                Text("Bookings"),
                Text("History"),
              ],
              onTap: (value) => setState(
                () {
                  selectedIndex = value;
                },
              ),
            ),
          ),
          const BookingsFilterSection(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Currently In Progress',
                ),
                Text(
                  '04 Dec 2022, Sunday',
                  style: kHelper13,
                ),
              ],
            ),
          ),
          BookingsServiceCard(
            serviceName: 'Plumbing Services',
            providerName: 'Cart Clinic',
            firstWidget: Row(
              children: [
                Icon(
                  Icons.people_outlined,
                  color: Colors.grey,
                ),
                kWidth5,
                Text('10 Booked'),
              ],
            ),
            secondWidget: Row(
              children: [
                Icon(
                  Icons.star_outline_rounded,
                  color: kColorSecondary,
                ),
                kWidth5,
                Text('4.5 (200 reviewed)'),
              ],
            ),
            thirdWidget: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.red.shade300,
                ),
                kWidth5,
                Text('Kathmandu, Nepal')
              ],
            ),
            status: 'In Progress',
            bottomWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rs 2000 - Rs 4000',
                  style: kText15,
                ),
                Text(
                  '/ per project',
                  style: kHelper13,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
