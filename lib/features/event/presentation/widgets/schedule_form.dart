import 'package:cipher/core/mixins/mixins.dart';
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
  List<DateTime?> _timeSlots = [];
  List<TheSlotMaker> _theSlotMaker = [];
  int widgetcount = 0;
  List<Map<int, dynamic>> test = [];
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void addToList(DateTime date, int index) =>
      setState(() => _timeSlots[index] = date);

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
                        widgetcount++;
                        _timeSlots.add(null);
                      },
                    );
                  },
                  child: Text(
                    "+Add",
                    style: kLightBlueText14,
                  )),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    widgetcount,
                    (index) {
                      return TheSlotMaker(
                        showClear: _theSlotMaker.length == 1 ? false : true,
                        clearCallback: () {},
                        addToList: addToList,
                        index: index,
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
            addVerticalSpace(8),
            _buildButton(),
            addVerticalSpace(8),
          ],
        );
      },
    );
  }

  CustomElevatedButton _buildButton() {
    return CustomElevatedButton(
      label: "Save",
      callback: () {
        print("time" + _timeSlots.toString());
        if (_key.currentState!.validate()) {
          print("validated!");
        }
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
