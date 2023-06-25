// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/features/event/presentation/pages/event_details_page.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/features/event/data/models/req/create_event_req.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/services.dart';

enum AttachType {
  Create,
  Edit,
}

class EventForm extends StatefulWidget {
  final AttachType type;
  const EventForm({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final titleController = TextEditingController();
  final guestController = TextEditingController(text: "1");
  final durationController = TextEditingController();
  final durationTypeController = TextEditingController();
  bool isFlexible = false;
  DateTime? startDate;
  DateTime? endDate;
  bool isUnlimitedGuests = false;
  final _key = GlobalKey<FormState>();
  bool isAutoValidate = true;
  Map<String, dynamic> editedValues = {};
  late final EventBloc eventBloc;

  TimeOfDay timeConvert(String normTime) {
    int hour;
    int minute;
    String ampm = normTime.substring(normTime.length - 2);
    String result = normTime.substring(0, normTime.indexOf(' '));
    if (ampm == 'AM' && int.parse(result.split(":")[1]) != 12) {
      hour = int.parse(result.split(':')[0]);
      if (hour == 12) hour = 0;
      minute = int.parse(result.split(":")[1]);
    } else {
      hour = int.parse(result.split(':')[0]) - 12;
      if (hour <= 0) {
        hour = 24 + hour;
      }
      minute = int.parse(result.split(":")[1]);
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void initState() {
    super.initState();

    if (widget.type == AttachType.Edit) {
      eventBloc = context.read<EventBloc>();
      setState(() {
        titleController.text = eventBloc.state.event?.title ?? "qwe";
        startDate = eventBloc.state.event?.start;
        endDate = eventBloc.state.event?.end;
        guestController.text =
            eventBloc.state.event?.guestLimit?.toString() ?? "";

        durationController.text =
            eventBloc.state.event!.duration!.split(":")[0];
        durationTypeController.text =
            eventBloc.state.event!.duration!.split(":")[1];
        isFlexible = eventBloc.state.event!.isFlexible!;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    guestController.dispose();
    durationController.dispose();
    durationTypeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        if (state.theStates == TheStates.initial) {
          return const Center(
            child: CardLoading(
              height: 200,
            ),
          );
        }
        if (state.theStates == TheStates.success) {
          var service = state.taskEntityService;
          // titleController.text = service.title ?? '';
          return Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _key,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildTitle(),
                    _buildDate(context),
                    _buildGuest(context),
                    _buildDuration(context),
                    _buildEventFlexibity(),
                  ],
                ),
                _buildButton(service, context),
              ],
            ),
          );
        }
        return ErrorWidget(
          Exception(),
        );
      },
    );
  }

  Widget _buildButton(TaskEntityService service, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: BlocListener<EventBloc, EventState>(
        listenWhen: (previous, current) {
          if (previous.isCreated != true && current.isCreated == true)
            return true;
          return false;
        },
        listener: (context, eventState) async {
          if (eventState.isCreated == true &&
              eventState.createdEventRes?.id != null) {
            await showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: 'Success',
                content: "Event created successfully",
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
          if (eventState.isCreated == false) {
            await showDialog(
              context: context,
              builder: (context) => CustomToast(
                heading: 'Error',
                content: eventState.errMsg ?? "Event cannot be created",
                onTap: () => Navigator.pop(context),
                isSuccess: false,
              ),
            );
          }
        },
        child: widget.type == AttachType.Create
            ? CustomElevatedButton(
                callback: () {
                  if (_key.currentState!.validate()) {
                    if (startDate != null && endDate != null) {
                      final req = CreateEventReq(
                        title: titleController.text,
                        start: startDate,
                        end: endDate,
                        guestLimit: isUnlimitedGuests
                            ? 0
                            : int.parse(guestController.text),
                        duration:
                            "${durationController.text}:${durationTypeController.text.trim()}:00",
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
                  }
                },
                label: "Save",
              )
            : BlocListener<EventBloc, EventState>(
                listenWhen: (previous, current) {
                  if (previous.isEdited != true && current.isEdited == true)
                    return true;
                  return false;
                },
                listener: (context, state) async {
                  if (state.isEdited == true) {
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content: "Event edited successfully",
                        onTap: () {
                          Navigator.popUntil(context, (route) {
                            if (route.settings.name ==
                                EventDetailsPage.routeName) return true;
                            return false;
                          });
                        },
                        isSuccess: true,
                      ),
                    );
                  } else {
                    await showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Error',
                        content: "Something went wrong. Please try again.",
                        onTap: () {},
                        isSuccess: false,
                      ),
                    );
                  }
                },
                child: CustomElevatedButton(
                  callback: () {
                    editedValues.addAll({
                      "start": startDate!.toString(),
                      "end": endDate!.toString(),
                      "guest_limit": int.parse(guestController.text),
                      "duration":
                          "${durationController.text}:${durationTypeController.text}:00",
                      "is_flexible": isFlexible,
                    });

                    eventBloc.add(
                      EventEdited(
                        id: eventBloc.state.event!.id!,
                        data: editedValues,
                      ),
                    );
                  },
                  label: "Save",
                ),
              ),
      ),
    );
  }

  Column _buildEventFlexibity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
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
      ],
    );
  }

  CustomFormField _buildDuration(BuildContext context) {
    return CustomFormField(
      label: "Duration of the event",
      isRequired: widget.type == AttachType.Create ? true : false,
      child: Row(
        children: [
          Flexible(
            child: CustomTextFormField(
              suffixWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hours",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
              textInputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: durationController,
              validator: (p0) {
                if (widget.type == AttachType.Create) {
                  if (startDate == null) return "Provide Start Date";
                  if (endDate == null) return "Provide End Date";
                  if (p0?.length == 0) return "Required Field";
                }
                final d = endDate!.difference(startDate!).inHours - 1;
                if (int.parse(durationController.text) > d)
                  return "Duration cannot be more than given dates";
                return null;
              },
            ),
          ),
          addHorizontalSpace(20),
          Flexible(
            child: CustomDropDownField(
              hintText: "minutes",
              list: [
                "00 minute",
                "15 Minutes",
                "30 Minutes",
                "45 Minutes",
              ],
              onChanged: (value) => setState(
                () {
                  setState(() {
                    final num1 = value!.substring(0, 2);
                    durationTypeController.text = num1;
                  });
                },
              ),
              validator: (p0) {
                if (startDate == null) return "Provide Start Date";
                if (endDate == null) return "Provide End Date";
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  CustomFormField _buildGuest(BuildContext context) {
    return CustomFormField(
      label: "Max No. of Guest",
      isRequired: widget.type == AttachType.Create ? true : false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumberIncDecField(
            controller: guestController,
            width: MediaQuery.of(context).size.width * 0.46,
            onChanged: (value) {
              if (guestController.text != "0" ||
                  guestController.text.isNotEmpty)
                setState(() {
                  isUnlimitedGuests = false;
                });
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Unlimited Guests ?",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Checkbox(
                value: isUnlimitedGuests,
                onChanged: (value) {
                  setState(() {
                    isUnlimitedGuests = !isUnlimitedGuests;
                  });
                  if (isUnlimitedGuests) guestController.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildDate(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CustomFormField(
            label: "Start Date",
            isRequired: widget.type == AttachType.Create ? true : false,
            child: CustomFormContainer(
              leadingWidget: Icon(
                Icons.calendar_today_outlined,
                color: kColorPrimary,
              ),
              hintText: startDate != null
                  ? DateFormat.yMMMd().format(startDate!)
                  : "",
              callback: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  Duration(
                    days: 90,
                  ),
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
            isRequired: widget.type == AttachType.Create ? true : false,
            child: CustomFormContainer(
              leadingWidget: Icon(
                Icons.calendar_today_outlined,
                color: kColorPrimary,
              ),
              hintText:
                  endDate != null ? DateFormat.yMMMd().format(endDate!) : "",
              callback: () => showDatePicker(
                context: context,
                initialDate: startDate?.add(
                      Duration(days: 1),
                    ) ??
                    DateTime.now().add(
                      Duration(
                        days: 1,
                      ),
                    ),
                firstDate: startDate?.add(
                      Duration(days: 1),
                    ) ??
                    DateTime.now().add(
                      Duration(
                        days: 1,
                      ),
                    ),
                lastDate: startDate?.add(
                      Duration(days: 91),
                    ) ??
                    DateTime.now().add(
                      Duration(
                        days: 91,
                      ),
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
    );
  }

  CustomFormField _buildTitle() {
    return CustomFormField(
      label: "Title",
      isRequired: widget.type == AttachType.Create ? true : false,
      child: CustomTextFormField(
        controller: titleController,
        validator: validateNotEmpty,
        onChanged: (p0) {
          editedValues.addAll({
            "title": titleController.text,
          });
        },
      ),
    );
  }

  Align _buildHeader() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        "${widget.type == AttachType.Create ? "Create" : "Edit"} event",
        style: kPurpleText16,
      ),
    );
  }
}
