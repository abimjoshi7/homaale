import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/event/data/models/req/create_event_req.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key});

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final titleController = TextEditingController();
  final guestController = TextEditingController();
  final durationController = TextEditingController();
  final durationTypeController = TextEditingController();
  bool isFlexible = false;
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        if (state.theStates == TheStates.initial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.theStates == TheStates.success &&
            state.taskEntityService != null) {
          final service = state.taskEntityService!;
          titleController.text = service.title ?? '';
          guestController.text = "1";
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create an Event",
                  style: kPurpleText16,
                ),
              ),
              CustomFormField(
                label: "Tile",
                isRequired: true,
                child: CustomTextFormField(
                  controller: titleController,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomFormField(
                      label: "Start Date",
                      isRequired: true,
                      child: CustomFormContainer(
                        leadingWidget: Icon(
                          Icons.calendar_today_outlined,
                          color: kColorPrimary,
                        ),
                        hintText: startDate != null
                            ? DateFormat.yMMMEd().format(startDate!)
                            : "",
                        callback: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(
                            2050,
                          ),
                        ).then(
                          (value) => setState(
                            () => startDate = value,
                          ),
                        ),
                      ),
                    ),
                  ),
                  addHorizontalSpace(20),
                  Flexible(
                    child: CustomFormField(
                      label: "End Date",
                      isRequired: true,
                      child: CustomFormContainer(
                        leadingWidget: Icon(
                          Icons.calendar_today_outlined,
                          color: kColorPrimary,
                        ),
                        hintText: endDate != null
                            ? DateFormat.yMMMEd().format(endDate!)
                            : "",
                        callback: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(
                            2050,
                          ),
                        ).then(
                          (value) => setState(
                            () => endDate = value,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomFormField(
                label: "Max No. of Guest",
                isRequired: true,
                child: NumberIncDecField(
                  controller: guestController,
                ),
              ),
              CustomFormField(
                label: "Duration of the event",
                child: Row(
                  children: [
                    Flexible(
                      child: NumberIncDecField(
                        width: MediaQuery.of(context).size.width * 0.5,
                        controller: durationController,
                      ),
                    ),
                    addHorizontalSpace(20),
                    Flexible(
                      child: CustomDropDownField(
                        list: [
                          "Hours",
                          "Minutes",
                          "Seconds",
                        ],
                        onChanged: (value) => setState(
                          () {
                            durationTypeController.text = value ?? '';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Divider(),
              ),
              WidgetText(
                label: 'This event is flexible',
                widget: CustomCheckBox(
                  isChecked: isFlexible,
                  onTap: () => setState(
                    () {
                      isFlexible = !isFlexible;
                    },
                  ),
                ),
              ),
              BlocListener<EventBloc, EventState>(
                listener: (context, eventState) async {
                  if (eventState.theStates == TheStates.success &&
                      eventState.isCreated == true) {
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content: "Event created successfully",
                        onTap: () => Navigator.pop(context),
                        isSuccess: true,
                      ),
                    );
                  }
                  if (eventState.theStates == TheStates.failure) {
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Error',
                        content: "Event cannot be created.",
                        onTap: () => Navigator.pop(context),
                        isSuccess: false,
                      ),
                    );
                  }
                },
                child: CustomElevatedButton(
                  callback: () {
                    if (startDate != null && endDate != null) {
                      final req = CreateEventReq(
                        title: titleController.text,
                        start: startDate,
                        end: endDate,
                        guestLimit: int.parse(guestController.text),
                        duration: durationController.text,
                        isFlexible: isFlexible,
                        entityService: service.id,
                        isActive: true,
                      );
                      context.read<EventBloc>().add(
                            EventCreated(
                              req,
                            ),
                          );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Error',
                          content: "Please verify dates",
                          onTap: () {
                            Navigator.pop(context);
                          },
                          isSuccess: false,
                        ),
                      );
                    }
                  },
                  label: "Save",
                ),
              ),
              addVerticalSpace(10),
              CustomElevatedButton(
                callback: () {
                  Navigator.pop(context);
                },
                label: "Cancel",
                mainColor: Colors.white,
                borderColor: kColorPrimary,
                textColor: kColorPrimary,
              ),
            ],
          );
        }
        return ErrorWidget(
          Exception(),
        );
      },
    );
  }
}
