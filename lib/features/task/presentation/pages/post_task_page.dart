import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task/data/models/post_task_req.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostTaskPage extends StatefulWidget {
  static const routeName = '/post-task-page';
  const PostTaskPage({super.key});

  @override
  State<PostTaskPage> createState() => _PostTaskPageState();
}

class _PostTaskPageState extends State<PostTaskPage> {
  String? priceType;
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  bool isDiscounted = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isSpecified = false;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];
  List<int>? imageList;
  List<int>? fileList;
  bool isAddressVisibile = false;
  bool isBudgetVariable = false;
  bool isCustomDate = false;
  bool isTermsAccepted = false;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final addressController = TextEditingController();
  String? categoryId;
  DateTime? startDate;
  DateTime? endDate;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<ServicesBloc>().add(
          const ServicesLoadInitiated(),
        );
    super.initState();
  }

  @override
  void dispose() {
    startPriceController.dispose();
    endPriceController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (state is ServicesLoadSuccess) {
                      print(state.list.first.id);
                    }
                    // context.read<ServicesBloc>().add(
                    //       ServicesLoadInitiated(),
                    //     );
                  },
                  icon: const Icon(Icons.search),
                );
              },
            ),
            child: const Text('Post a Task'),
          ),
          const Divider(),
          Form(
            key: _key,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 140,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CustomFormField(
                            label: 'Title',
                            isRequired: true,
                            child: CustomTextFormField(
                              validator: validateNotEmpty,
                              controller: titleController,
                              hintText: 'Need a Garden Cleaner',
                            ),
                          ),
                          CustomFormField(
                            label: 'Task Description',
                            isRequired: true,
                            child: CustomTextFormField(
                              validator: validateNotEmpty,
                              controller: descriptionController,
                              hintText:
                                  'Describe your requirements in few words',
                              maxLines: 3,
                            ),
                          ),
                          const CustomFormField(
                            label: 'Requirements',
                            isRequired: true,
                            child: CustomTextFormField(
                              hintText: 'Add requirements',
                            ),
                          ),
                          CustomFormField(
                            label: 'Category',
                            isRequired: true,
                            child: BlocBuilder<ServicesBloc, ServicesState>(
                              builder: (context, state) {
                                if (state is ServicesLoadSuccess) {
                                  return CustomDropDownField(
                                    list: List.generate(
                                      state.list.length,
                                      (index) => state.list[index].title,
                                    ),
                                    hintText: 'Trimming & Cutting',
                                    onChanged: (value) {
                                      for (final element in state.list) {
                                        if (value == element.title) {
                                          setState(
                                            () {
                                              categoryId = element.id;
                                            },
                                          );
                                        }
                                      }
                                    },
                                  );
                                }
                                return const CustomTextFormField();
                              },
                            ),
                          ),
                          CustomFormField(
                            label: 'Select Task Type',
                            isRequired: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Remote',
                                      groupValue: priceType,
                                      onChanged: (value) => setState(
                                        () {
                                          priceType = value;
                                          isAddressVisibile = false;
                                        },
                                      ),
                                    ),
                                    const Text('Remote'),
                                    addHorizontalSpace(10),
                                    Radio<String>(
                                      value: 'On premise',
                                      groupValue: priceType,
                                      onChanged: (value) => setState(
                                        () {
                                          priceType = value;
                                          isAddressVisibile = true;
                                        },
                                      ),
                                    ),
                                    const Text('On premise'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isAddressVisibile,
                            child: CustomTextFormField(
                              controller: addressController,
                              hintText: 'Default Address (Home)',
                            ),
                          ),
                          CustomFormField(
                            label: 'Budget',
                            isRequired: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Fixed',
                                      groupValue: priceType,
                                      onChanged: (value) => setState(
                                        () {
                                          priceType = value;
                                          isBudgetVariable = false;
                                        },
                                      ),
                                    ),
                                    const Text('Fixed'),
                                    addHorizontalSpace(10),
                                    Radio<String>(
                                      value: 'Variable',
                                      groupValue: priceType,
                                      onChanged: (value) => setState(
                                        () {
                                          priceType = value;
                                          isBudgetVariable = true;
                                        },
                                      ),
                                    ),
                                    const Text('Variable'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: NumberIncDecField(
                                  controller: startPriceController,
                                ),
                              ),
                              addHorizontalSpace(10),
                              Visibility(
                                visible: isBudgetVariable,
                                child: Flexible(
                                  child: Row(
                                    children: [
                                      const Text('To'),
                                      addHorizontalSpace(10),
                                      Flexible(
                                        child: NumberIncDecField(
                                          controller: endPriceController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: CustomDropDownField(
                                  list: ['Per Project'],
                                  hintText: 'Per project',
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(10),
                          Row(
                            children: [
                              CustomCheckBox(
                                isChecked: isDiscounted,
                                onTap: () => setState(
                                  () {
                                    isDiscounted = !isDiscounted;
                                  },
                                ),
                              ),
                              addHorizontalSpace(10),
                              const Text('Yes, it is negotiable.'),
                            ],
                          ),
                          addVerticalSpace(10),
                          CustomFormField(
                            label: 'Images',
                            isRequired: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Maximum Image Size 20 MB',
                                      style: kHelper13,
                                    ),
                                    addHorizontalSpace(5),
                                    const Icon(
                                      Icons.info_outline,
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                                addVerticalSpace(5),
                                InkWell(
                                  onTap: () async {
                                    await context
                                        .read<ImageUploadCubit>()
                                        .uploadImage();
                                  },
                                  child: BlocListener<ImageUploadCubit,
                                      ImageUploadState>(
                                    listener: (context, state) {
                                      if (state is ImageUploadSuccess) {
                                        setState(() {
                                          imageList =
                                              List<int>.from(state.list);
                                        });
                                      }
                                    },
                                    child: CustomDottedContainerStack(
                                      label: imageList == null
                                          ? 'Select Images'
                                          : 'Image Uploaded',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomFormField(
                            label: 'Videos',
                            isRequired: false,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Maximum Video Size 20 MB',
                                      style: kHelper13,
                                    ),
                                    addHorizontalSpace(5),
                                    const Icon(
                                      Icons.info_outline,
                                      color: Colors.orange,
                                    ),
                                  ],
                                ),
                                addVerticalSpace(5),
                                InkWell(
                                  onTap: () async {
                                    await context
                                        .read<ImageUploadCubit>()
                                        .uploadVideo();
                                  },
                                  child: BlocListener<ImageUploadCubit,
                                      ImageUploadState>(
                                    listener: (context, state) {
                                      if (state is VideoUploadSuccess) {
                                        setState(() {
                                          fileList = List<int>.from(state.list);
                                        });
                                      }
                                    },
                                    child: CustomDottedContainerStack(
                                      label: fileList == null
                                          ? 'Select Videos'
                                          : 'File Uploaded',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(10),
                          CustomFormField(
                            label: 'When do you need this done?',
                            isRequired: true,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Radio<String>(
                                      value: 'Fixed',
                                      groupValue: priceType,
                                      onChanged: (value) => setState(
                                        () {
                                          priceType = value;
                                          isCustomDate = false;
                                        },
                                      ),
                                    ),
                                    const Text('Fixed'),
                                    addHorizontalSpace(10),
                                    Radio<String>(
                                      value: 'Custom',
                                      groupValue: priceType,
                                      onChanged: (value) => setState(
                                        () {
                                          priceType = value;
                                          isCustomDate = true;
                                        },
                                      ),
                                    ),
                                    const Text('Custom'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          buildDate(),
                          addVerticalSpace(20),
                          Row(
                            children: [
                              CustomCheckBox(
                                isChecked: isTermsAccepted,
                                onTap: () {
                                  setState(
                                    () {
                                      isTermsAccepted = !isTermsAccepted;
                                    },
                                  );
                                },
                              ),
                              addHorizontalSpace(10),
                              const Flexible(
                                child: Text(
                                  'Accept all',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Terms and Conditions.',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(20),
                          CustomElevatedButton(
                            callback: () async {
                              if (_key.currentState!.validate() &&
                                  startPriceController.text.isNotEmpty &&
                                  startDate != null &&
                                  isTermsAccepted == true) {
                                if (startDate!.isAfter(
                                  endDate ?? startDate!,
                                )) {
                                  return showDialog(
                                    context: context,
                                    builder: (context) => CustomToast(
                                      heading: 'Error',
                                      content: 'Please verify dates',
                                      onTap: () {},
                                      isSuccess: false,
                                    ),
                                  );
                                } else {
                                  final req = PostTaskReq(
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    highlights: {},
                                    budgetType: "Hourly",
                                    budgetFrom: int.parse(
                                      startPriceController.text,
                                    ),
                                    budgetTo: int.parse(
                                      endPriceController.text.isEmpty
                                          ? startPriceController.text
                                          : endPriceController.text,
                                    ),
                                    startDate: startDate,
                                    endDate: endDate,
                                    startTime: startTime?.format(context),
                                    endTime: endTime?.format(context),
                                    shareLocation: true,
                                    isNegotiable: true,
                                    revisions: 32767,
                                    recursionType: "weekly",
                                    location: addressController.text,
                                    isProfessional: true,
                                    isOnline: true,
                                    isRequested: true,
                                    discountType: "Percentage",
                                    discountValue: 0,
                                    extraData: {},
                                    noOfReservation: 2147483647,
                                    isActive: true,
                                    needsApproval: true,
                                    isEndorsed: true,
                                    service: categoryId,
                                    event:
                                        "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                                    city: 0,
                                    currency: "string",
                                    avatar: 0,
                                    images: imageList,
                                    videos: fileList,
                                  );

                                  print(req.toJson());

                                  // context.read<TaskBloc>().add(
                                  //       TaskAddInitiated(
                                  //         req: req,
                                  //       ),
                                  //     );
                                }
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Error',
                                    content:
                                        'Error validating form. Please verify the data and try again.',
                                    onTap: () {},
                                    isSuccess: false,
                                  ),
                                );
                              }
                            },
                            label: 'Next',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDate() {
    if (isCustomDate == false) {
      return Column(
        children: [
          CustomFormField(
            label: 'Date',
            isRequired: false,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: InkWell(
                onTap: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(
                      2050,
                    ),
                  ).then(
                    (value) => setState(
                      () {
                        startDate = value;
                      },
                    ),
                  );
                },
                child: CustomFormContainer(
                  leadingWidget: Icon(
                    Icons.calendar_today_rounded,
                  ),
                  hintText: startDate?.toIso8601String().substring(
                            0,
                            10,
                          ) ??
                      'dd/mm/yy',
                ),
              ),
            ),
          ),
          Row(
            children: [
              CustomCheckBox(
                isChecked: isSpecified,
                onTap: () {
                  setState(
                    () {
                      isSpecified = !isSpecified;
                    },
                  );
                },
              ),
              addHorizontalSpace(5),
              const Text('Set specific time'),
            ],
          ),
          Visibility(
            visible: isSpecified,
            child: SizedBox(
              height: 130,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: InkWell(
                            onTap: () async {
                              await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then(
                                (value) => setState(
                                  () {
                                    startTime = value;
                                  },
                                ),
                              );
                            },
                            child: CustomFormContainer(
                              hintText:
                                  startTime?.format(context) ?? 'hh:mm A.M',
                            ),
                          ),
                        ),
                        const Text(' - '),
                        Flexible(
                          child: InkWell(
                            onTap: () async {
                              await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then(
                                (value) => setState(
                                  () {
                                    endTime = value;
                                  },
                                ),
                              );
                            },
                            child: CustomFormContainer(
                              hintText: endTime?.format(context) ?? 'hh:mm A.M',
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            color: kColorSecondary,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.0,
                        right: MediaQuery.of(context).size.width * 0.6,
                      ),
                      child: CustomElevatedButton(
                        callback: () {},
                        label: 'Add',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        Row(
          children: const [
            Flexible(
              child: CustomFormField(
                label: 'Start Date',
                isRequired: false,
                child: SizedBox(
                  child: CustomFormContainer(
                    leadingWidget: Icon(
                      Icons.calendar_today_rounded,
                    ),
                    hintText: 'dd/mm/yy',
                  ),
                ),
              ),
            ),
            Flexible(
              child: CustomFormField(
                label: 'End Date',
                isRequired: false,
                child: SizedBox(
                  child: CustomFormContainer(
                    leadingWidget: Icon(
                      Icons.calendar_today_rounded,
                    ),
                    hintText: 'dd/mm/yy',
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            CustomCheckBox(
              isChecked: isSpecified,
              onTap: () {
                setState(() {
                  isSpecified = !isSpecified;
                });
              },
            ),
            addHorizontalSpace(5),
            const Text('Set specific time'),
          ],
        ),
        Visibility(
          visible: isSpecified,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (selectedWeekDay.contains(index) == false) {
                      setState(
                        () {
                          selectedWeekDay.add(index);
                          switch (index) {
                            case 0:
                              widgetList.add(
                                WeekTimeSpecifier(
                                  weekName: 'Sunday',
                                  onTap1: () async {
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then(
                                      (value) => setState(
                                        () {
                                          startTime = value;
                                        },
                                      ),
                                    );
                                  },
                                  onTap2: () async {
                                    await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then(
                                      (value) => setState(
                                        () {
                                          endTime = value;
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                              break;
                            case 1:
                              widgetList.add(
                                const WeekTimeSpecifier(
                                  weekName: 'Monday',
                                ),
                              );
                              break;
                            case 2:
                              widgetList.add(
                                const WeekTimeSpecifier(
                                  weekName: 'Tuesday',
                                ),
                              );
                              break;
                            case 3:
                              widgetList.add(
                                const WeekTimeSpecifier(
                                  weekName: 'Wednesday',
                                ),
                              );
                              break;
                            case 4:
                              widgetList.add(
                                const WeekTimeSpecifier(
                                  weekName: 'Thursday',
                                ),
                              );
                              break;
                            case 5:
                              widgetList.add(
                                const WeekTimeSpecifier(
                                  weekName: 'Friday',
                                ),
                              );
                              break;
                            case 6:
                              widgetList.add(
                                const WeekTimeSpecifier(
                                  weekName: 'Saturday',
                                ),
                              );
                              break;
                            default:
                              widgetList.clear();
                              break;
                          }
                        },
                      );
                    } else {
                      setState(
                        () {
                          selectedWeekDay.remove(index);
                          switch (index) {
                            case 0:
                              widgetList.removeAt(0);
                              break;
                            case 1:
                              widgetList.remove(widgetList[index]);
                              break;
                            case 2:
                              widgetList.remove(widgetList[index]);
                              break;
                            case 3:
                              widgetList.remove(widgetList[index]);
                              break;
                            case 4:
                              widgetList.remove(widgetList[index]);
                              break;
                            case 5:
                              print(index);
                              // widgetList.removeAt(widgetList[5]);
                              break;
                            case 6:
                              widgetList.removeLast();
                              break;
                            default:
                              widgetList.clear();
                              break;
                          }
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                      child: Container(
                        width: 40,
                        color: selectedWeekDay.contains(index)
                            ? kColorPrimary
                            : kColorGrey,
                        child: Center(
                          child: Text(
                            weekNames[index],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => kWidth10,
              itemCount: weekNames.length,
            ),
          ),
        ),
        Column(
          children: isSpecified == true ? widgetList : [],
        ),
      ],
    );
  }
}
