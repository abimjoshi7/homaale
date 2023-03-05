// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/in_progress/in_progess.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InProgressSection extends StatefulWidget {
  const InProgressSection({super.key});

  @override
  State<InProgressSection> createState() => _InProgressSectionState();
}

class _InProgressSectionState extends State<InProgressSection> {
  int selectedIndex = 0;
  List<String> l = [
    'All',
    'My Task',
    'My Orders',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Wrap(
            spacing: 10,
            children: List.generate(
              l.length,
              (index) => ChoiceChip(
                label: Text(
                  l[index],
                ),
                selected: selectedIndex == index,
                onSelected: (value) async {
                  setState(
                    () {
                      selectedIndex = index;
                    },
                  );
                  if (selectedIndex == 1) {
                    context.read<TaskBloc>().add(
                          AllTaskLoadInitiated(),
                        );
                  }
                },
                backgroundColor: Colors.white,
                selectedColor: kColorBlue,
                side: BorderSide(
                  color: selectedIndex == index ? kColorBlue : kColorGrey,
                ),
              ),
            ),
          ),
        ),
        InProgressMainSection(
          selectedIndex: selectedIndex,
        ),
      ],
    );
  }
}
