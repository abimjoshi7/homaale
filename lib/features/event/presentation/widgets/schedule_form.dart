import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/presentation/widgets/the_slot_maker.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleForm extends StatefulWidget {
  const ScheduleForm({super.key});

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> with TheModalBottomSheet {
  DateTime? startDate;
  DateTime? endDate;
  DateTime? startTime;
  DateTime? endTime;
  int? repeatType;
  List<DateTime> _timeSlots = [];
  List<TheSlotMaker> _theSlotMaker = [];
  List<Map<int, dynamic>> test = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "New Schedule",
                style: kPurpleText17,
              ),
            ),
            addVerticalSpace(
              8,
            ),
            _buildDates(state, context),
            addVerticalSpace(
              8,
            ),
            CustomFormField(
              label: "Shifts",
              rightSection: InkWell(
                  onTap: () async {
                    setState(
                      () {
                        _theSlotMaker.add(
                          TheSlotMaker(
                            addToList: (value) {},
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "+Add",
                    style: kLightBlueText14,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _theSlotMaker.length,
                  (index) {
                    return TheSlotMaker(
                      showClear: _theSlotMaker.length == 1 ? false : true,
                      startCallback: () async {
                        await showCustomBottomSheet(
                          context: context,
                          widget: SizedBox(
                            height: 300,
                            child: Column(
                              children: [
                                Text(
                                  "Start Time",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Expanded(
                                  child: CupertinoDatePicker(
                                    onDateTimeChanged: (value) {
                                      setState(() {
                                        startTime = value;
                                      });
                                    },
                                    mode: CupertinoDatePickerMode.time,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                        test[index].update(
                          index,
                          (value) => startTime,
                          ifAbsent: () => startTime,
                        );
                        // if (_timeSlots[index].startTime == null)
                        //   setState(
                        //     () {
                        //       _timeSlots.insert(
                        //         index,
                        //         TimeSlot(
                        //           id: index,
                        //           startTime: startTime,
                        //         ),
                        //       );
                        //     },
                        //   );
                      },
                      endCallback: () {
                        // await showCustomBottomSheet(
                        //   context: context,
                        //   widget: SizedBox(
                        //     height: 300,
                        //     child: Column(
                        //       children: [
                        //         Text(
                        //           "End Time",
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .headlineMedium,
                        //         ),
                        //         Expanded(
                        //           child: CupertinoDatePicker(
                        //             onDateTimeChanged: (value) {
                        //               setState(() {
                        //                 endTime = value;
                        //               });
                        //             },
                        //             mode: CupertinoDatePickerMode.time,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );
                        _timeSlots.forEach(
                          (element) => print(element),
                        );
                      },
                      clearCallback: () {
                        _theSlotMaker.length == 1
                            ? null
                            : setState(
                                () {
                                  _theSlotMaker.removeAt(index);
                                },
                              );
                      },
                      addToList: (value) {
                        _timeSlots.add(value);
                      },
                    );
                  },
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
            addVerticalSpace(8),
            _buildButton(),

            // BlocListener<ScheduleBloc, ScheduleState>(
            //   listener: (context, scheduleState) {
            //     if (scheduleState.isCreated == true &&
            //         scheduleState.createScheduleRes != null) {
            //       showDialog(
            //         context: context,
            //         builder: (context) => CustomToast(
            //           heading: "Success",
            //           content: "Schedule created successfully",
            //           onTap: () {
            //             Navigator.pushNamedAndRemoveUntil(
            //               context,
            //               Root.routeName,
            //               (route) => false,
            //             );
            //           },
            //           isSuccess: true,
            //         ),
            //       );
            //     }
            //     if (scheduleState.theState == TheStates.failure &&
            //         scheduleState.isCreated == false) {
            //       showDialog(
            //         context: context,
            //         builder: (context) => CustomToast(
            //           heading: "Failure",
            //           content: "Schedule cannot be created",
            //           onTap: () {},
            //           isSuccess: false,
            //         ),
            //       );
            //     }
            //   },
            //   child: CustomElevatedButton(
            //     label: "Save",
            //     callback: () {
            //       final req = CreateScheduleReq(
            //         id: state.taskEntityService.id,
            //         event: state.taskEntityService.event?.id,
            //         startDate: DateFormat("yyyy-MM-dd")
            //             .format(state.taskEntityService.event!.start!),
            //         endDate: DateFormat("yyyy-MM-dd")
            //             .format(state.taskEntityService.event!.end!),
            //         repeatType: repeatType,
            //         slots: _timeSlots
            //             .map(
            //               (e) => Slot(
            //                 start: e.startTime?.format(context),
            //                 end: e.endTime?.format(context),
            //               ),
            //             )
            //             .toList(),
            //         guestLimit: 1,
            //         isActive: true,
            //       );

            //       context.read<ScheduleBloc>().add(
            //             ScheduleEventPosted(
            //               createScheduleReq: req,
            //             ),
            //           );
            //     },
            //   ),
            // ),
            addVerticalSpace(8),
            // CustomElevatedButton(
            //   label: "Cancel",
            //   mainColor: Colors.white,
            //   textColor: kColorPrimary,
            //   borderColor: kColorPrimary,
            //   callback: () async {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        );
      },
    );
  }

  CustomElevatedButton _buildButton() {
    return CustomElevatedButton(
      label: "Save",
      callback: () {
        print(_timeSlots);
        print(test);
        // final req = CreateScheduleReq(
        //   id: state.taskEntityService.id,
        //   event: state.taskEntityService.event?.id,
        //   startDate: DateFormat("yyyy-MM-dd")
        //       .format(state.taskEntityService.event!.start!),
        //   endDate: DateFormat("yyyy-MM-dd")
        //       .format(state.taskEntityService.event!.end!),
        //   repeatType: repeatType,
        //   slots: _timeSlots
        //       .map(
        //         (e) => Slot(
        //           start: e.startTime?.format(context),
        //           end: e.endTime?.format(context),
        //         ),
        //       )
        //       .toList(),
        //   guestLimit: 1,
        //   isActive: true,
        // );

        // context.read<ScheduleBloc>().add(
        //       ScheduleEventPosted(
        //         createScheduleReq: req,
        //       ),
        //     );
      },
    );
  }

  Widget _buildDates(TaskEntityServiceState state, BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomFormField(
            label: "Start Date",
            child: CustomFormContainer(
              hintText: DateFormat.yMMMd().format(
                startDate ?? state.taskEntityService.event!.start!,
              ),
              leadingWidget: Icon(
                Icons.calendar_today_rounded,
                color: kColorSilver,
              ),
              callback: () async {
                await showDatePicker(
                  context: context,
                  initialDate: state.taskEntityService.event!.start!,
                  firstDate: state.taskEntityService.event!.start!,
                  lastDate: state.taskEntityService.event!.end!,
                ).then(
                  (value) {
                    setState(
                      () {
                        startDate = value;
                      },
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
              hintText: DateFormat.yMMMd().format(
                endDate ?? state.taskEntityService.event!.end!,
              ),
              leadingWidget: Icon(
                Icons.calendar_today_rounded,
                color: kColorSilver,
              ),
              callback: () {
                showDatePicker(
                  context: context,
                  initialDate: startDate ?? state.taskEntityService.event!.end!,
                  firstDate: startDate ?? state.taskEntityService.event!.end!,
                  lastDate: state.taskEntityService.event!.end!,
                ).then(
                  (value) {
                    setState(
                      () {
                        endDate = value;
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
