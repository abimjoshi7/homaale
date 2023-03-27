// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/event/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleForm extends StatefulWidget {
  const ScheduleForm({super.key});

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  String? repeatType;
  Map<String, dynamic> slots = {};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New Schedule",
                  style: kPurpleText17,
                ),
              ),
              addVerticalSpace(8),
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
                  children: List.generate(
                    1,
                    (index) => TheSlotMaker(
                      startTime: "qwe",
                      selectedIndex: index,
                      startCallback: () async {
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (value) {
                            if (slots["start"] == null) {
                              slots.addAll(
                                {
                                  "start": value?.format(
                                    context,
                                  ),
                                },
                              );
                            } else {
                              slots.update(
                                "start",
                                (value1) => value?.format(context),
                              );
                            }
                          },
                        );
                      },
                      endCallback: () async {
                        await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then(
                          (value) {
                            if (slots["end"] == null) {
                              slots.addAll(
                                {
                                  "end": value?.format(
                                    context,
                                  ),
                                },
                              );
                            } else {
                              slots.update(
                                "end",
                                (value1) => value?.format(context),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
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
              BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
                builder: (context, serviceState) {
                  return CustomElevatedButton(
                    label: "Save",
                    callback: () {
                      slots.clear();
                      // print(serviceState.taskEntityService?.id);
                      // print(serviceState.taskEntityService?.event?.id);
                    },
                  );
                },
              ),
              addVerticalSpace(8),
              CustomElevatedButton(
                label: "Cancel",
                mainColor: Colors.white,
                textColor: kColorPrimary,
                borderColor: kColorPrimary,
                callback: () {
                  print(slots);
                  print(slots["start"]);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class TheSlotMaker extends StatelessWidget {
  final int selectedIndex;
  final VoidCallback? startCallback;
  final VoidCallback? endCallback;
  final VoidCallback? clearCallback;
  final String? startTime;
  final String? endTime;
  const TheSlotMaker({
    Key? key,
    required this.selectedIndex,
    this.startCallback,
    this.endCallback,
    this.clearCallback,
    this.startTime,
    this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: CustomFormContainer(
        leadingWidget: Row(
          children: [
            Icon(
              Icons.access_time_rounded,
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: startCallback,
              child: AutoSizeText(
                startTime ?? "--",
                style: kLightBlueText14,
              ),
            ),
            addHorizontalSpace(8),
            Text('-'),
            addHorizontalSpace(8),
            InkWell(
              onTap: endCallback,
              child: AutoSizeText(
                endTime ?? "--",
                style: kLightBlueText14,
              ),
            ),
          ],
        ),
        trailingWidget: IconButton(
          icon: Icon(
            Icons.clear,
            size: 15,
          ),
          onPressed: clearCallback,
        ),
      ),
    );
  }
}
