import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task/data/models/apply_task_req.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/loading_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ApplyTaskPage extends StatefulWidget {
  static const routeName = '/apply-task-page';
  const ApplyTaskPage({super.key});

  @override
  State<ApplyTaskPage> createState() => _ApplyTaskPageState();
}

class _ApplyTaskPageState extends State<ApplyTaskPage> {
  final _key = GlobalKey<FormState>();
  final offerController = TextEditingController();
  final remarksController = TextEditingController();
  final requirementsController = TextEditingController();
  List<String> requirementList = [];

  bool isLoading = false;

  @override
  void initState() {
    context.read<TaskBloc>().add(const TaskBookInitiated());
    super.initState();
  }

  @override
  void dispose() {
    offerController.dispose();
    remarksController.dispose();
    requirementsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        appBarTitle: "Apply",
        trailingWidget: SizedBox.shrink(),
      ),
      body: LoadingWidget(
        isLoading: isLoading,
        child: BlocConsumer<TaskBloc, TaskState>(
          listener: (context, state) {
            //todo: show error/success message from api

            if (state.applyTaskFail) {
              setState(() {
                isLoading = false;
              });
              showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Error',
                  content: 'Unable to apply for task',
                  onTap: () {
                    context.read<TaskBloc>().add(const TaskBookInitiated());
                    Navigator.pop(context);
                  },
                  isSuccess: false,
                ),
              );
            }

            if (state.applyTaskSuccess) {
              setState(() {
                isLoading = false;
              });
              showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: 'Success',
                  content: 'Task Applied.',
                  onTap: () {
                    context.read<TaskBloc>().add(const TaskBookInitiated());
                    setState(() {
                      offerController.clear();
                      remarksController.clear();
                      requirementList.clear();
                    });
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  isSuccess: true,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.theState == TheStates.success) {
              if (state.taskModel != null) {
                return Form(
                  key: _key,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              CustomFormField(
                                label: 'Task Details',
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Title :'),
                                        Text('${state.taskModel?.title}'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Budget :'),
                                        Text(
                                          '${Decimal.parse(state.taskModel?.budgetFrom ?? '0.0')} to ${Decimal.parse(state.taskModel?.budgetTo ?? '0.0')} ',
                                        ),
                                      ],
                                    ),
                                    addVerticalSpace(8),
                                    Text(
                                      state.taskModel?.description ??
                                          'Hiring a reputable professional landscape gardener entail paying for their knowledge, experience, time, equipment, and materials. They will be able to discuss your vision and tailor your garden design to your exact needs, taking into account your taste, lifestyle, budget.',
                                      style: kHelper13,
                                    ),
                                  ],
                                ),
                              ),
                              if (state.taskModel?.budgetFrom != null ||
                                  state.taskModel?.budgetTo != null) ...[
                                CustomFormField(
                                  label: 'Your Price',
                                  isRequired: true,
                                  child: CustomTextFormField(
                                    hintText: 'Rs 1,000',
                                    controller: offerController,
                                    textInputType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your price';
                                      }
                                      if (double.parse(value) >
                                          double.parse(
                                            state.taskModel?.budgetTo
                                                    .toString() ??
                                                '0',
                                          )) {
                                        return 'Price cannot be greater than given budget';
                                      }
                                      if (double.parse(value) <
                                          double.parse(
                                            state.taskModel?.budgetFrom
                                                    .toString() ??
                                                '0',
                                          )) {
                                        return 'Price cannot be less than given budget';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                              CustomFormField(
                                label: 'Remarks',
                                isRequired: true,
                                child: CustomTextFormField(
                                  hintText: 'Applying (Remark)',
                                  maxLines: 4,
                                  controller: remarksController,
                                  onFieldSubmitted: (p0) {
                                    FocusScope.of(context).unfocus();
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please add a remark';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                              // ***PAUSED AS ASKED***
                              // CustomFormField(
                              //   label: 'Pre-requisites',
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       Column(
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: List.generate(
                              //           requirementList.length,
                              //           (index) => Padding(
                              //             padding: const EdgeInsets.all(2),
                              //             child: Row(
                              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //               children: [
                              //                 Row(
                              //                   children: [
                              //                     const Icon(
                              //                       Icons.circle,
                              //                       size: 12,
                              //                       color: kColorSecondary,
                              //                     ),
                              //                     addHorizontalSpace(20),
                              //                     Text(
                              //                       requirementList[index],
                              //                     ),
                              //                   ],
                              //                 ),
                              //                 InkWell(
                              //                   onTap: () {
                              //                     setState(
                              //                       () {
                              //                         requirementList.remove(
                              //                           requirementList[index],
                              //                         );
                              //                       },
                              //                     );
                              //                   },
                              //                   child: const Icon(
                              //                     Icons.clear,
                              //                     size: 14,
                              //                   ),
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ),
                              //       ),
                              //       const Text(
                              //         'This helps clients to find about your requirements better.',
                              //         style: kHelper13,
                              //       ),
                              //       CustomTextFormField(
                              //         hintText: 'Add requirements',
                              //         controller: requirementsController,
                              //         onFieldSubmitted: (p0) {
                              //           if (p0 != "") {
                              //             setState(() {
                              //               requirementList.add(p0!);
                              //               requirementsController.clear();
                              //             });
                              //           }
                              //         },
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        addVerticalSpace(20),
                        CustomElevatedButton(
                          callback: () async {
                            FocusScope.of(context).unfocus();
                            if (_key.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              final postTaskReq = ApplyTaskReq(
                                budgetTo: double.parse(offerController.text),
                                entityService: state.taskModel?.id,
                                description: remarksController.text,
                                requirements: requirementList,
                              );
                              context
                                  .read<TaskBloc>()
                                  .add(TaskBook(req: postTaskReq));
                            }
                          },
                          label: 'Apply',
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CardLoading(
                    height: 200,
                  ),
                );
              }
            } else {
              return const Center(
                child: CardLoading(
                  height: 200,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
