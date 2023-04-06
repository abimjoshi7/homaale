import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/core/image_picker/video_picker_dialog.dart';
import 'package:cipher/features/content_client/presentation/pages/terms_of_use.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PostTaskPage extends StatefulWidget {
  static const routeName = '/post-task-page';
  const PostTaskPage({super.key});

  @override
  State<PostTaskPage> createState() => _PostTaskPageState();
}

class _PostTaskPageState extends State<PostTaskPage> {
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final requirementController = TextEditingController();
  final addressController = TextEditingController();
  String? categoryId;
  String? dateType = 'Fixed';
  String? priceType = 'Fixed';
  String? taskType = 'Remote';
  String? budgetType = 'Project';
  String? currencyCode;
  bool isDiscounted = false;
  bool isSpecified = true;
  bool isAddressVisibile = false;
  bool isBudgetVariable = false;
  bool isCustomDate = false;
  bool isTermsAccepted = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];
  List<String> requirementList = [];
  List<int>? imageList;
  List<int>? fileList;
  DateTime? startDate;
  DateTime? endDate;
  int? cityCode;
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
    requirementController.dispose();
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
            trailingWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
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
                            label: 'Category',
                            isRequired: true,
                            child: BlocBuilder<ServicesBloc, ServicesState>(
                              builder: (context, state) {
                                if (state.theStates == TheStates.success) {
                                  return CustomDropDownField(
                                    list: List.generate(
                                      state.serviceList?.length ?? 0,
                                      (index) =>
                                          state.serviceList?[index].title,
                                    ),
                                    hintText: 'Trimming & Cutting',
                                    onChanged: (value) {
                                      for (final element
                                          in state.serviceList!) {
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
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                          CustomFormField(
                            label: 'Requirements',
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    requirementList.length,
                                    (index) => Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.circle,
                                                size: 12,
                                                color: kColorSecondary,
                                              ),
                                              addHorizontalSpace(20),
                                              Text(
                                                requirementList[index],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  requirementList.remove(
                                                    requirementList[index],
                                                  );
                                                },
                                              );
                                            },
                                            child: const Icon(
                                              Icons.clear,
                                              size: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                addVerticalSpace(5),
                                CustomTextFormField(
                                  controller: requirementController,
                                  hintText: 'Add requirements',
                                  onFieldSubmitted: (p0) {
                                    requirementList.add(p0!);
                                    requirementController.clear();
                                  },
                                ),
                              ],
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
                                      groupValue: taskType,
                                      onChanged: (value) => setState(
                                        () {
                                          taskType = value;
                                          isAddressVisibile = false;
                                        },
                                      ),
                                    ),
                                    const Text('Remote'),
                                    addHorizontalSpace(10),
                                    Radio<String>(
                                      value: 'On premise',
                                      groupValue: taskType,
                                      onChanged: (value) => setState(
                                        () {
                                          taskType = value;
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
                          CustomFormField(
                            label: 'Description',
                            isRequired: true,
                            child: CustomTextFormField(
                              validator: validateNotEmpty,
                              controller: descriptionController,
                              hintText:
                                  'Describe your requirements in few words',
                              maxLines: 3,
                            ),
                          ),
                          CustomFormField(
                            isRequired: true,
                            label: 'City',
                            child: BlocBuilder<CityBloc, CityState>(
                              builder: (context, state) {
                                if (state is CityLoadSuccess) {
                                  return CustomDropDownField(
                                    list: List.generate(
                                      state.list.length,
                                      (index) => state.list[index].name,
                                    ),
                                    hintText: 'Enter your city',
                                    onChanged: (p0) => setState(
                                      () async {
                                        final x = state.list.firstWhere(
                                          (element) => p0 == element.name,
                                        );
                                        cityCode = x.id;
                                      },
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),

                          CustomFormField(
                            label: 'When do you want the task to be completed?',
                            isRequired: true,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: CustomFormField(
                                        label: 'Start Date',
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
                                            leadingWidget: const Icon(
                                              Icons.calendar_today_rounded,
                                            ),
                                            hintText: startDate
                                                    ?.toIso8601String()
                                                    .substring(
                                                      0,
                                                      10,
                                                    ) ??
                                                'dd/mm/yy',
                                          ),
                                        ),
                                      ),
                                    ),
                                    addHorizontalSpace(10),
                                    Flexible(
                                      child: CustomFormField(
                                        label: 'End Date',
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
                                                  endDate = value;
                                                },
                                              ),
                                            );
                                          },
                                          child: CustomFormContainer(
                                            leadingWidget: const Icon(
                                              Icons.calendar_today_rounded,
                                            ),
                                            hintText: endDate
                                                    ?.toIso8601String()
                                                    .substring(
                                                      0,
                                                      10,
                                                    ) ??
                                                'dd/mm/yy',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     CustomCheckBox(
                                //       isChecked: isSpecified,
                                //       onTap: () {
                                //         setState(
                                //           () {
                                //             isSpecified = !isSpecified;
                                //           },
                                //         );
                                //       },
                                //     ),
                                //     addHorizontalSpace(5),
                                //     const Text('Set specific time'),
                                //   ],
                                // ),
                                CustomFormField(
                                  label: "Select Time",
                                  child: Row(
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
                                                startTime?.format(context) ??
                                                    'hh:mm',
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
                                            hintText:
                                                endTime?.format(context) ??
                                                    'hh:mm',
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            startTime = null;
                                            endTime = null;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline_rounded,
                                          color: kColorSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // buildDate(),
                          // Visibility(
                          //   visible: isAddressVisibile,
                          //   child: CustomTextFormField(
                          //     controller: addressController,
                          //     hintText: 'Default Address (Home)',
                          //   ),
                          // ),
                          CustomFormField(
                            label: 'Currency',
                            isRequired: true,
                            child: BlocBuilder<CurrencyBloc, CurrencyState>(
                              builder: (context, state) {
                                if (state is CurrencyLoadSuccess) {
                                  return CustomDropDownField(
                                    list: List.generate(
                                      state.currencyListRes.length,
                                      (index) =>
                                          state.currencyListRes[index].name,
                                    ),
                                    hintText: 'Enter your Currency',
                                    onChanged: (p0) => setState(
                                      () async {
                                        final x =
                                            state.currencyListRes.firstWhere(
                                          (element) => p0 == element.name,
                                        );
                                        currencyCode = x.code;
                                      },
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ),

                          CustomFormField(
                            label: 'Budget(Mininum Rs.10)',
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
                                  list: const [
                                    'Project',
                                    'Hourly',
                                    'Daily',
                                    'Monthly'
                                  ],
                                  hintText: 'Per project',
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        budgetType = value;
                                      },
                                    );
                                  },
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
                                    showDialog(
                                      context: context,
                                      builder: (context) => ImagePickerDialog(),
                                    );
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
                                      theWidget: imageList == null
                                          ? Text('Select Images')
                                          : Text('Image Uploaded'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomFormField(
                            label: 'Videos',
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
                                    showDialog(
                                      context: context,
                                      builder: (context) => VideoPickerDialog(),
                                    );
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
                                      theWidget: fileList == null
                                          ? Text('Select Videos')
                                          : Text('File Uploaded'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(10),
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
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      TermsOfUsePage.routeName,
                                    );
                                  },
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
                          BlocConsumer<TaskEntityServiceBloc,
                              TaskEntityServiceState>(
                            listener: (context, state) {
                              if (state.theStates == TheStates.success &&
                                  state.isCreated == true) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Success',
                                    content:
                                        'You have successfully posted a task',
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Root.routeName,
                                      );
                                    },
                                    isSuccess: true,
                                  ),
                                );
                              }
                              if (state.theStates == TheStates.failure &&
                                  state.isCreated == false) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Failure',
                                    content:
                                        'Post cannot be posted. Please try again.',
                                    onTap: () {},
                                    isSuccess: false,
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return CustomElevatedButton(
                                callback: () async {
                                  if (_key.currentState!.validate() &&
                                      startPriceController.text.isNotEmpty &&
                                      endDate != null &&
                                      isTermsAccepted == true) {
                                    if (endDate!.isBefore(
                                      startDate ?? endDate!,
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
                                      final req = TaskEntityServiceReq(
                                        title: titleController.text,
                                        description: descriptionController.text,
                                        highlights: requirementList,
                                        budgetType: budgetType,
                                        budgetFrom: int.parse(
                                          startPriceController.text,
                                        ),
                                        budgetTo: int.parse(
                                          endPriceController.text.isEmpty
                                              ? startPriceController.text
                                              : endPriceController.text,
                                        ),
                                        startDate: DateFormat("yyyy-MM-dd")
                                            .format(
                                                startDate ?? DateTime.now()),
                                        endDate: DateFormat("yyyy-MM-dd")
                                            .format(endDate ?? DateTime.now()),
                                        startTime: startTime?.format(context),
                                        endTime: endTime?.format(context),
                                        shareLocation: true,
                                        isNegotiable: true,
                                        location: addressController.text,
                                        revisions: 0,
                                        avatar: 2,
                                        isProfessional: true,
                                        isOnline: true,
                                        isRequested: true,
                                        discountType: "Percentage",
                                        discountValue: 0,
                                        extraData: [],
                                        noOfReservation: 2147483647,
                                        isActive: true,
                                        needsApproval: true,
                                        isEndorsed: true,
                                        service: categoryId,
                                        event: "",
                                        city: cityCode,
                                        currency: currencyCode,
                                        images: imageList ?? [],
                                        videos: fileList ?? [],
                                      );
                                      context.read<TaskEntityServiceBloc>().add(
                                          TaskEntityServiceCreated(req: req));
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
                              );
                            },
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
}
