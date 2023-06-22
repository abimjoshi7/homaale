// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/event/data/models/req/create_schedule_req.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/bloc/schedule/schedule_bloc.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class ScheduleForm extends StatefulWidget {
  final AttachType attachType;
  final String? scheduleId;
  const ScheduleForm({
    Key? key,
    required this.attachType,
    this.scheduleId,
  }) : super(key: key);

  @override
  State<ScheduleForm> createState() => _ScheduleFormState();
}

class _ScheduleFormState extends State<ScheduleForm> with TheModalBottomSheet {
  DateTime? startDate;
  DateTime? endDate;
  int? repeatType;
  List<TextEditingController> startTimeControllers = [];
  List<TextEditingController> endTimeControllers = [];
  // List<DateTime?> startSelectedDates = [];
  // List<DateTime?> endSelectedDates = [];
  TextEditingController itemController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey<FormState> _repeatkey = GlobalKey<FormState>();
  late final ScheduleBloc scheduleBloc;

  String getRepeatType(int value) {
    switch (value) {
      case 0:
        return "None";
      case 1:
        return "Daily";
      case 2:
        return "Weekly";
      case 3:
        return "Custom";
      default:
        return "";
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.attachType == AttachType.Edit) {
      scheduleBloc = context.read<ScheduleBloc>()
        ..add(
          SingleScheduleLoaded(
            scheduleId: widget.scheduleId ?? "",
          ),
        );

      print(scheduleBloc.state.singleSchedule?.toJson());
      setState(() {
        repeatType = scheduleBloc.state.singleSchedule?.repeatType;
        startTimeControllers.addAll(scheduleBloc.state.singleSchedule!.slots!
            .map(
              (e) => TextEditingController(
                text: e.start,
              ),
            )
            .toList());
        endTimeControllers.addAll(scheduleBloc.state.singleSchedule!.slots!
            .map(
              (e) => TextEditingController(
                text: e.end,
              ),
            )
            .toList());
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void addItem() {
    setState(() {
      startTimeControllers.add(TextEditingController());
      endTimeControllers.add(TextEditingController());
      // startSelectedDates.add(null);
      // endSelectedDates.add(null);
    });
  }

  void deleteItem(int index) {
    setState(() {
      startTimeControllers.removeAt(index);
      endTimeControllers.removeAt(index);
      // startSelectedDates.removeAt(index);
      // endSelectedDates.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "${widget.attachType == AttachType.Create ? "New" : "Edit"} Schedule",
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
            _buildShifts(),
            _buildRepeatType(),
            addVerticalSpace(8),
            _buildButton(state),
            addVerticalSpace(8),
          ],
        );
      },
    );
  }

  Widget _buildRepeatType() {
    return CustomFormField(
      label: "Repeat",
      child: Form(
        key: _repeatkey,
        child: CustomDropDownField(
          initialValue: repeatType == null ? null : getRepeatType(repeatType!),
          validator: (p0) => repeatType == null ? "Required Field" : null,
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
    );
  }

  Widget _buildShifts() {
    return Form(
      key: _key,
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(
          Size(
            double.maxFinite,
            600,
          ),
        ),
        child: CustomFormField(
          label: "Shifts",
          rightSection: InkWell(
            onTap: addItem,
            child: Text(
              "+Add",
              style: kLightBlueText14,
            ),
          ),
          child: Column(
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints.loose(
                  Size(
                    double.maxFinite,
                    600,
                  ),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.attachType == AttachType.Edit
                      ? scheduleBloc.state.singleSchedule?.slots?.length
                      : startTimeControllers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Row(
                        children: [
                          Flexible(
                            child: CustomTextFormField(
                              validator: (p0) =>
                                  startTimeControllers[index].text.isEmpty
                                      ? "Required Field"
                                      : null,
                              hintText: "Start Time",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              readOnly: true,
                              controller: startTimeControllers[index],
                              onTap: () async {
                                DateTime? selectedDate;
                                await showCustomBottomSheet(
                                  context: context,
                                  widget: SizedBox(
                                    height: 200,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (value) {
                                        setState(() {
                                          selectedDate = value;
                                        });
                                      },
                                    ),
                                  ),
                                );

                                if (selectedDate != null) {
                                  setState(() {
                                    // startSelectedDates[index] = selectedDate;
                                    startTimeControllers[index].text =
                                        DateFormat.Hms().format(selectedDate!);
                                  });
                                }
                              },
                            ),
                          ),
                          addHorizontalSpace(
                            8,
                          ),
                          Flexible(
                            child: CustomTextFormField(
                              validator: (p0) =>
                                  endTimeControllers[index].text.isEmpty
                                      ? "Required Field"
                                      : null,
                              hintText: "End Time",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              readOnly: true,
                              controller: endTimeControllers[index],
                              onTap: () async {
                                DateTime? selectedDate;
                                await showCustomBottomSheet(
                                  context: context,
                                  widget: SizedBox(
                                    height: 200,
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      onDateTimeChanged: (value) {
                                        setState(() {
                                          selectedDate = value;
                                        });
                                      },
                                    ),
                                  ),
                                );

                                if (selectedDate != null) {
                                  setState(() {
                                    // endSelectedDates[index] = selectedDate;
                                    endTimeControllers[index].text =
                                        DateFormat.Hms().format(selectedDate!);
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              deleteItem(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(TaskEntityServiceState state) {
    return BlocListener<ScheduleBloc, ScheduleState>(
      listenWhen: (previous, current) {
        if (previous.isCreated != true && current.isCreated == true)
          return true;
        return false;
      },
      listener: (context, scheduleState) {
        if (scheduleState.isCreated == true &&
            scheduleState.createScheduleRes != null) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: "Success",
              content: "Schedule created successfully",
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Root.routeName,
                  (route) => false,
                );
              },
              isSuccess: true,
            ),
          );
        }
        if (scheduleState.theState == TheStates.failure &&
            scheduleState.isCreated == false) {
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
          if (_key.currentState!.validate() &&
              _repeatkey.currentState!.validate()) {
            final List<Slot> slots = List.generate(
              startTimeControllers.length,
              (index) => Slot(
                start: startTimeControllers[index].text,
                end: endTimeControllers[index].text,
                // start: DateFormat.Hms().format(startTimeControllers[index].text),
                // end: DateFormat.Hms().format(endSelectedDates[index]!),
              ),
            );
            final req = CreateScheduleReq(
              // id: state.taskEntityService.id,
              event: state.taskEntityService.event?.id,
              startDate: DateFormat("yyyy-MM-dd")
                  .format(state.taskEntityService.event!.start!),
              endDate: DateFormat("yyyy-MM-dd")
                  .format(state.taskEntityService.event!.end!),
              repeatType: repeatType,
              slots: slots,
              guestLimit: context.read<EventBloc>().state.event?.guestLimit,
              isActive: context.read<EventBloc>().state.event?.isActive,
            );
            print(slots);
            print(req);
            // context.read<ScheduleBloc>().add(
            //       ScheduleEventPosted(
            //         createScheduleReq: req,
            //       ),
            //     );
          }
        },
      ),
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
