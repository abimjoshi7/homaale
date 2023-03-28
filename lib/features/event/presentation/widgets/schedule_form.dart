// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cipher/features/event/data/models/req/create_schedule_req.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:cipher/features/event/presentation/widgets/the_slot_maker.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleForm extends StatefulWidget {
  const ScheduleForm({super.key});

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> {
  int? repeatType;
  List<TimeSlot> _timeSlots = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleBloc(),
      child: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
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
                        hintText: state.taskEntityService!.event?.start == null
                            ? ""
                            : DateFormat.yMMMEd().format(
                                state.taskEntityService!.event!.start!,
                              ),
                        leadingWidget: Icon(
                          Icons.calendar_today_rounded,
                        ),
                        // callback: () {
                        //   showDatePicker(
                        //     context: context,
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime(2000),
                        //     lastDate: DateTime(2050),
                        //   ).then(
                        //     (value) {
                        //       setState(
                        //         () {
                        //           state.taskEntityService?.event?.start = value;
                        //         },
                        //       );
                        //     },
                        //   );
                        // },
                      ),
                    ),
                  ),
                  addHorizontalSpace(16),
                  Flexible(
                    child: CustomFormField(
                      label: "End Date",
                      child: CustomFormContainer(
                        hintText: state.taskEntityService!.event?.end == null
                            ? ""
                            : DateFormat.yMMMEd().format(
                                state.taskEntityService!.event!.end!,
                              ),
                        leadingWidget: Icon(
                          Icons.calendar_today_rounded,
                        ),
                        // callback: () {
                        //   showDatePicker(
                        //     context: context,
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime(2000),
                        //     lastDate: DateTime(2050),
                        //   ).then(
                        //     (value) {
                        //       setState(
                        //         () {
                        //           endDate = value;
                        //         },
                        //       );
                        //     },
                        //   );
                        // },
                      ),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                label: "Shifts",
                rightSection: InkWell(
                    onTap: () async {
                      final TimeOfDay? startTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        helpText: "Start Time",
                      );
                      if (startTime != null) {
                        final TimeOfDay? endTime = await showTimePicker(
                          context: context,
                          initialTime: startTime,
                          helpText: "End Time",
                        );
                        if (endTime != null) {
                          setState(
                            () {
                              _timeSlots.add(
                                TimeSlot(
                                  startTime: startTime,
                                  endTime: endTime,
                                ),
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text(
                      "+Add",
                      style: kLightBlueText14,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    _timeSlots.isEmpty ? 0 : _timeSlots.length,
                    (index) => TheSlotMaker(
                      startTime:
                          '${_timeSlots[index].startTime?.format(context)}',
                      endTime: '${_timeSlots[index].endTime?.format(context)}',
                      selectedIndex: index,
                      startCallback: () async {},
                      endCallback: () async {},
                      clearCallback: () {
                        setState(
                          () {
                            _timeSlots.removeAt(index);
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
                    "None",
                    "Daily",
                    "Weekly",
                    "Custom",
                  ],
                  onChanged: (value) => setState(
                    () {
                      switch (value) {
                        case "None":
                          repeatType = 0;
                          break;
                        case "Daily":
                          repeatType = 1;
                          break;
                        case "Weekly":
                          repeatType = 2;
                          break;
                        case "Custom":
                          repeatType = 3;
                          break;
                      }
                    },
                  ),
                ),
              ),
              BlocListener<ScheduleBloc, ScheduleState>(
                listener: (context, state) {
                  if (state.isCreated == true &&
                      state.createScheduleRes != null) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                          heading: "Success",
                          content: "Schedule created successfully",
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isSuccess: true),
                    );
                  }
                  if (state.theState == TheStates.failure &&
                      state.isCreated == false) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: "Failure",
                        content: "Schedule cannot be created",
                        onTap: () {},
                        isSuccess: false,
                      ),
                    );
                  }
                },
                child: CustomElevatedButton(
                  label: "Save",
                  callback: () {
                    final req = CreateScheduleReq(
                      id: state.taskEntityService?.id,
                      event: state.taskEntityService?.event?.id,
                      startDate: DateFormat("yyyy-MM-dd")
                          .format(state.taskEntityService!.event!.start!),
                      endDate: DateFormat("yyyy-MM-dd")
                          .format(state.taskEntityService!.event!.end!),
                      repeatType: repeatType,
                      slots: _timeSlots
                          .map(
                            (e) => Slot(
                              start: e.startTime?.format(context),
                              end: e.endTime?.format(context),
                            ),
                          )
                          .toList(),
                      guestLimit: 1,
                      isActive: true,
                    );

                    context.read<ScheduleBloc>().add(
                          ScheduleEventPosted(
                            createScheduleReq: req,
                          ),
                        );
                  },
                ),
              ),
              addVerticalSpace(8),
              CustomElevatedButton(
                label: "Cancel",
                mainColor: Colors.white,
                textColor: kColorPrimary,
                borderColor: kColorPrimary,
                callback: () async {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class TimeSlot {
  final TimeOfDay? startTime;
  final TimeOfDay? endTime;

  TimeSlot({this.startTime, this.endTime});
}
