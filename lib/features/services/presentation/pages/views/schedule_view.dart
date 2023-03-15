import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({
    super.key,
  });

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomFormField(
            label: 'When do you need this done?',
            child: Text(
              'Select task date from the calender to complete booking.',
              style: kText15,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
                color: kColorGrey,
              ),
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: CustomFormField(
                label: 'Select Date',
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2050),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                ),
              ),
            ),
          ),
          addVerticalSpace(8),
          Visibility(
            visible: isVisible,
            child: CustomFormField(
              label: "Select Shift:",
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: List.generate(
                    6,
                    (index) => Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: kColorGrey,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '6:30 AM - 7:30 AM',
                          style: kText15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
