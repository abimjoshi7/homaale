// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleForm extends StatefulWidget {
  const ScheduleForm({super.key});

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  String? repeatType;
  List<TimeOfDay> startTime = [];
  List<TimeOfDay> endTime = [];
  List<Widget> widgetList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: CustomFormField(
                      label: "Start Date",
                      child: CustomFormContainer(
                        hintText: state.startDate == null
                            ? ""
                            : DateFormat.yMMMEd().format(
                                state.startDate!,
                              ),
                        leadingWidget: Icon(
                          Icons.calendar_today_rounded,
                        ),
                        callback: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          ).then(
                            (value) {
                              context.read<ScheduleBloc>().add(
                                    ScheduleEventPosted(
                                      startDate: value,
                                    ),
                                  );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  addHorizontalSpace(16),
                  Flexible(
                    child: CustomFormField(
                      label: "End Date",
                      child: CustomFormContainer(
                        hintText: state.endDate == null
                            ? ""
                            : DateFormat.yMMMEd().format(
                                state.endDate!,
                              ),
                        leadingWidget: Icon(
                          Icons.calendar_today_rounded,
                        ),
                        callback: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050),
                          ).then(
                            (value) => context.read<ScheduleBloc>().add(
                                  ScheduleEventPosted(
                                    endDate: value,
                                  ),
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                label: "Shifts",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // context
                    //             .watch<ScheduleBloc>()
                    //             .state
                    //             .startTimeList
                    //             ?.isNotEmpty ??
                    //         false
                    //     ? Text(
                    //         'asd',
                    //         style: kPurpleText13,
                    //       )
                    //     : Column(
                    //         children: List.generate(
                    //           state.startTimeList?.length ?? 2,
                    //           (index) => CustomFormContainer(
                    //             // hintText: state.startTimeList!.isEmpty
                    //             //     ? ""
                    //             //     : state.startTimeList!.first.format(context),
                    //             leadingWidget: Icon(
                    //               Icons.access_time_outlined,
                    //               // color: kColorPrimary,
                    //             ),
                    //             callback: () => showTimePicker(
                    //               context: context,
                    //               initialTime: TimeOfDay.now(),
                    //             ).then(
                    //               (value) {
                    //                 startTime.add(value!);
                    //                 context.read<ScheduleBloc>().add(
                    //                       ScheduleEventPosted(
                    //                         startTimeList: startTime,
                    //                       ),
                    //                     );
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    Row(
                      children: [
                        Flexible(
                          child: CustomFormField(
                            label: "Start Time",
                            child: Column(
                              children: [
                                context
                                            .watch<ScheduleBloc>()
                                            .state
                                            .startTimeList
                                            ?.length ==
                                        0
                                    ? SizedBox.shrink()
                                    : Column(
                                        children: List.generate(
                                          state.startTimeList?.length ?? 0,
                                          (index) => CustomFormContainer(
                                            leadingWidget: Icon(
                                              Icons.access_time_outlined,
                                              // color: kColorPrimary,
                                            ),
                                            hintText: state
                                                    .startTimeList?[index]
                                                    .format(context) ??
                                                "",
                                          ),
                                        ),
                                      ),
                                CustomFormContainer(
                                  leadingWidget: Icon(
                                    Icons.access_time_outlined,
                                  ),
                                  callback: () => showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then(
                                    (value) {
                                      startTime.add(value!);
                                      context.read<ScheduleBloc>().add(
                                            ScheduleEventPosted(
                                              startTimeList: startTime,
                                            ),
                                          );
                                    },
                                  ).whenComplete(() => setState(
                                        () {},
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        addHorizontalSpace(16),
                        Flexible(
                          child: CustomFormField(
                            label: "End Time",
                            child: StatefulBuilder(
                              builder: (context, setState) =>
                                  CustomFormContainer(
                                hintText: "",
                                callback: () => showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ),
                                leadingWidget: Icon(
                                  Icons.access_time_outlined,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomFormField(
                label: "Repeat",
                child: CustomDropDownField(
                  list: [
                    "Week",
                    "Month",
                    "Year",
                  ],
                  onChanged: (value) => setState(
                    () {
                      repeatType = value;
                    },
                  ),
                ),
              ),
              CustomElevatedButton(
                label: "Save",
                callback: () {},
              ),
              addVerticalSpace(8),
              CustomElevatedButton(
                label: "Cancel",
                mainColor: Colors.white,
                textColor: kColorPrimary,
                borderColor: kColorPrimary,
                callback: () {},
              ),
            ],
          );
        },
      ),
    );
  }
}
