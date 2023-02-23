// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                          MyTaskLoadInitiated(),
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

class InProgressMainSection extends StatelessWidget {
  const InProgressMainSection({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return Expanded(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '04 Dec 2022, Sunday',
                    style: kHelper13,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) => BookingsServiceCard(
                      serviceName: 'Plumbing Services',
                      providerName: 'Cart Clinic',
                      mainContentWidget: Column(
                        children: [
                          IconText(
                            iconData: Icons.calendar_today_rounded,
                            label: '${DateTime.now()}',
                          ),
                          IconText(
                            iconData: Icons.calendar_today_rounded,
                            label: '${DateTime.now()}',
                          ),
                          IconText(
                            iconData: Icons.calendar_today_rounded,
                            label: '${DateTime.now()}',
                          ),
                        ],
                      ),
                      status: 'In Progress',
                      bottomRightWidget: SizedBox(
                        width: 120,
                        child: CustomElevatedButton(
                          callback: () {},
                          label: 'Completed',
                          mainColor: Colors.green,
                          borderColor: Colors.green,
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => kHeight10,
                    itemCount: 5,
                  ),
                ),
              )
            ],
          ),
        );
      case 1:
        return BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is TaskLoadSuccess) {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: BookingsServiceCard(
                      serviceName: state.res.result?[index].title,
                      providerName:
                          "${state.res.result?[index].createdBy?.firstName} ${state.res.result?[index].createdBy?.lastName}",
                      mainContentWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.calendar_today_rounded,
                              label: DateFormat().format(
                                state.res.result?[index].createdAt ??
                                    DateTime.now(),
                              ),
                              color: kColorBlue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.watch_later_outlined,
                              label:
                                  "${state.res.result?[index].startTime ?? '00:00'} ${state.res.result?[index].endTime ?? ''}",
                              color: kColorGreen,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.attach_money_rounded,
                              label:
                                  "Rs. ${state.res.result?[index].budgetFrom ?? ''} - ${state.res.result?[index].budgetTo ?? ''}",
                              color: kColorAmber,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: IconText(
                              iconData: Icons.location_on_outlined,
                              label: state.res.result?[index].location ??
                                  'No address found',
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      status: 'In Progress',
                      bottomRightWidget: SizedBox(
                        width: 120,
                        child: CustomElevatedButton(
                          callback: () {},
                          label: 'Completed',
                          mainColor: Colors.green,
                          borderColor: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  itemCount: state.res.result?.length ?? 0,
                ),
              );
            }
            return const Center(
              child: Text('Something went wrong. Try again later.'),
            );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
