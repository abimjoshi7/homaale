// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/event/presentation/bloc/event/event_bloc.dart';
import 'package:cipher/features/event/presentation/widgets/schedule_form.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';

class ScheduleSection extends StatefulWidget with TheModalBottomSheet {
  final TaskEntityServiceState taskEntityServiceState;
  final UserState userState;
  const ScheduleSection({
    Key? key,
    required this.taskEntityServiceState,
    required this.userState,
  }) : super(key: key);

  @override
  State<ScheduleSection> createState() => _ScheduleSectionState();
}

class _ScheduleSectionState extends State<ScheduleSection> {
  @override
  void initState() {
    super.initState();
    context.read<EventBloc>().add(
          EventLoaded(
              id: widget.taskEntityServiceState.taskEntityService?.event?.id ??
                  ''),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
        return Visibility(
          visible:
              widget.taskEntityServiceState.taskEntityService?.createdBy?.id ==
                  widget.userState.taskerProfile?.user?.id,
          child: state.event?.allShifts?.length != 0
              ? SizedBox.shrink()
              : CustomFormField(
                  label:
                      widget.taskEntityServiceState.taskEntityService?.event !=
                              null
                          ? "Schedule"
                          : "",
                  child:
                      widget.taskEntityServiceState.taskEntityService?.event !=
                              null
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: kColorGrey.withOpacity(
                                  0.3,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.edit_calendar_outlined,
                                        color: kColorSilver,
                                      ),
                                      addHorizontalSpace(10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AutoSizeText(
                                            "No Schedule Found",
                                            style: kText15,
                                          ),
                                          AutoSizeText(
                                            "Add New Schedule",
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  TextButton.icon(
                                    onPressed: () {
                                      widget.showCustomBottomSheet(
                                        context: context,
                                        widget: ScheduleForm(),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      size: 14,
                                    ),
                                    label: AutoSizeText("Create New"),
                                  )
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                ),
        );
      },
    );
  }
}
