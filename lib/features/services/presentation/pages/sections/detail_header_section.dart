import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class DetailHeaderSection extends StatelessWidget {
  const DetailHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          return CustomFormField(
            label: 'Service Details',
            child: Wrap(
              direction: Axis.vertical,
              spacing: 8,
              children: [
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Title:",
                      ),
                    ),
                    Text(
                      // state.taskEntityService?.service?.title ??
                      state.taskEntityService?.title ?? "Title goes here",
                    )
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Service:",
                      ),
                    ),
                    Text(
                      state.taskEntityService?.service?.title ?? "Test",
                    )
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Category:",
                      ),
                    ),
                    Text(
                      state.taskEntityService?.service?.category?.name ??
                          '',
                    )
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Pricing:",
                      ),
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: state.taskEntityService?.isRange ?? false,
                          child: Text(
                            "Rs. ${state.taskEntityService?.payableFrom ?? '0'} - ",
                          ),
                        ),
                        Text(
                            "Rs. ${double.parse(state.taskEntityService?.payableTo ?? "0").toInt()}"),
                      ],
                    )
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Start Date:",
                      ),
                    ),
                    Text(
                      state.taskEntityService?.event == null
                          ? "N/A"
                          : DateFormat.yMMMEd().format(
                              state.taskEntityService?.event?.start ??
                                  DateTime.now(),
                            ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "End Date:",
                      ),
                    ),
                    Text(
                      state.taskEntityService?.event == null
                          ? "N/A"
                          : DateFormat.yMMMEd().format(
                              state.taskEntityService?.event?.end ??
                                  DateTime.now(),
                            ),
                    ),
                  ],
                ),
                // Wrap(
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width * 0.3,
                //       child: const Text(
                //         "Time:",
                //       ),
                //     ),
                //     Text(
                //         "${DateFormat.yMMMEd().format(state.taskEntityService!.event!.start!) ?? "6:30 AM"} to 7:30 AM")
                //   ],
                // ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Address:",
                      ),
                    ),
                    Text(
                      state.taskEntityService?.city?.name ??
                          "Buddhanagar, Kathmandu",
                    )
                  ],
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
