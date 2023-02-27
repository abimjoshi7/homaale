import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/data/models/add_service_req.dart';
import 'package:cipher/features/services/presentation/manager/add_service/add_service_cubit.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddServicePage extends StatefulWidget {
  static const routeName = '/add-service-page';
  const AddServicePage({super.key});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final requirementController = TextEditingController();
  final addressController = TextEditingController();
  String? categoryId;
  String? dateType = 'Fixed';
  String? priceType = 'Fixed';
  String? serviceType = 'Remote';
  String? budgetType = 'Project';
  String? currencyCode;
  bool isDiscounted = false;
  bool isSpecified = true;
  bool isAddressVisibile = false;
  bool isBudgetVariable = false;
  bool isCustomDate = false;
  bool isTermsAccepted = false;
  bool isNegotiable = false;
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
            child: const Text('Add Service'),
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
                            label: 'Service Title',
                            isRequired: true,
                            child: CustomTextFormField(
                              controller: titleController,
                              hintText: 'Trimming & Cutting',
                              validator: validateNotEmpty,
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
                            label: 'Service Description',
                            isRequired: true,
                            child: CustomTextFormField(
                              controller: descriptionController,
                              hintText: 'Trimming & Cutting',
                              maxLines: 3,
                              validator: validateNotEmpty,
                            ),
                          ),
                          CustomFormField(
                            label: 'Service Highlights',
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
                                  hintText: 'Add Highlights',
                                  onFieldSubmitted: (p0) {
                                    requirementList.add(p0!);
                                    requirementController.clear();
                                  },
                                ),
                              ],
                            ),
                          ),
                          CustomFormField(
                            label: 'Price',
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
                              Visibility(
                                visible: isBudgetVariable,
                                child: Flexible(
                                  child: NumberIncDecField(
                                    controller: startPriceController,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isBudgetVariable,
                                child: const Text(' To '),
                              ),
                              Flexible(
                                child: NumberIncDecField(
                                  controller: endPriceController,
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: CustomDropDownField(
                                    list: const [
                                      'Project',
                                      'Hourly',
                                      'Daily',
                                      'Monthly',
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
                              ),
                            ],
                          ),
                          // addVerticalSpace(10),
                          // Row(
                          //   children: [
                          //     CustomCheckBox(
                          //       isChecked: isNegotiable,
                          //       onTap: () => setState(
                          //         () {
                          //           isNegotiable = !isNegotiable;
                          //         },
                          //       ),
                          //     ),
                          //     addHorizontalSpace(10),
                          //     const Text('Yes, it is negotiable.'),
                          //   ],
                          // ),
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
                              const Text('Add Discount'),
                            ],
                          ),
                          Visibility(
                            visible: isDiscounted,
                            child: Row(
                              children: [
                                Flexible(
                                  child: NumberIncDecField(
                                    controller: endPriceController,
                                  ),
                                ),
                                addHorizontalSpace(10),
                                Flexible(
                                  child: CustomDropDownField(
                                    list: const [
                                      'Project',
                                      'Hourly',
                                      'Daily',
                                      'Monthly',
                                    ],
                                    hintText: 'Specify',
                                    onChanged: (value) {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addVerticalSpace(10),
                          Row(
                            children: [
                              const Icon(
                                Icons.info_outline_rounded,
                                color: kColorSecondary,
                              ),
                              addHorizontalSpace(10),
                              const Flexible(
                                child: Text(
                                  'After 20% discount on the budget i.e. Rs 240, new budget will be Rs 960',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                                      groupValue: dateType,
                                      onChanged: (value) => setState(
                                        () {
                                          dateType = value;
                                          isCustomDate = false;
                                        },
                                      ),
                                    ),
                                    const Text('Fixed'),
                                    addHorizontalSpace(10),
                                    Radio<String>(
                                      value: 'Custom',
                                      groupValue: dateType,
                                      onChanged: (value) => setState(
                                        () {
                                          dateType = value;
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

                          CustomFormField(
                            label: 'Service Type',
                            isRequired: true,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 'Remote',
                                          groupValue: serviceType,
                                          onChanged: (value) => setState(
                                            () {
                                              isAddressVisibile = false;
                                              serviceType = value;
                                            },
                                          ),
                                        ),
                                        const Text('Remote')
                                      ],
                                    ),
                                    addHorizontalSpace(10),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 'On Premise',
                                          groupValue: serviceType,
                                          onChanged: (value) => setState(
                                            () {
                                              isAddressVisibile = true;
                                              serviceType = value;
                                            },
                                          ),
                                        ),
                                        const Text('On Premise')
                                      ],
                                    ),
                                  ],
                                ),
                                addVerticalSpace(5),
                                Visibility(
                                  visible: isAddressVisibile,
                                  child: const CustomTextFormField(
                                    hintText: 'Default Address',
                                  ),
                                ),
                              ],
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
                          // CustomFormField(
                          //   label: 'Number of Revision',
                          //   isRequired: false,
                          //   child: CustomTextFormField(),
                          // ),
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
                          BlocConsumer<AddServiceCubit, AddServiceState>(
                            listener: (context, state) {
                              if (state is AddServiceSuccess) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Success',
                                    content:
                                        'You have successfully added a service',
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
                              if (state is AddServiceFailure) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CustomToast(
                                    heading: 'Failure',
                                    content:
                                        'Service cannot be added. Please try again.',
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
                                      endPriceController.text.isNotEmpty) {
                                    if (cityCode == null &&
                                        currencyCode == null) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => CustomToast(
                                          heading: 'Error',
                                          content: 'Select city or currency',
                                          onTap: () {},
                                          isSuccess: false,
                                        ),
                                      );
                                    }
                                    final req = AddServiceReq(
                                      title: titleController.text,
                                      description: descriptionController.text,
                                      highlights: requirementList.asMap().map(
                                            (key, value) => MapEntry(
                                              key.toString(),
                                              value as dynamic,
                                            ),
                                          ),
                                      budgetType: budgetType,
                                      budgetFrom: int.parse(
                                        startPriceController.text.isEmpty
                                            ? '0'
                                            : startPriceController.text,
                                      ),
                                      budgetTo: int.parse(
                                        endPriceController.text,
                                      ),
                                      startDate: startDate ?? DateTime.now(),
                                      endDate: endDate,
                                      startTime: startTime?.format(context),
                                      endTime: endTime?.format(context),
                                      shareLocation: true,
                                      isNegotiable: true,
                                      location: addressController.text,
                                      revisions: 0,
                                      avatar: 2,
                                      isProfessional: true,
                                      isOnline: true,
                                      isRequested: false,
                                      discountType: "Percentage",
                                      discountValue: 0,
                                      extraData: {},
                                      noOfReservation: 2147483647,
                                      isActive: true,
                                      needsApproval: true,
                                      isEndorsed: true,
                                      service: categoryId,
                                      event: "",
                                      city: cityCode,
                                      currency: currencyCode,
                                      images: imageList,
                                      videos: fileList,
                                    );

                                    context
                                        .read<AddServiceCubit>()
                                        .addService(req);
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomToast(
                                        heading: 'Error',
                                        content:
                                            'Please provide necessary details.',
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

  Widget buildDate() {
    if (isCustomDate == false) {
      return Column(
        children: [
          CustomFormField(
            label: 'Date',
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
                        endDate = value;
                      },
                    ),
                  );
                },
                child: CustomFormContainer(
                  leadingWidget: const Icon(
                    Icons.calendar_today_rounded,
                  ),
                  hintText: endDate?.toIso8601String().substring(
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
          children: [
            Flexible(
              child: CustomFormField(
                label: 'Start Date',
                child: SizedBox(
                  child: InkWell(
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
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
                      hintText: startDate != null
                          ? DateFormat('yy/MM/dd').format(startDate!)
                          : 'dd/mm/yy',
                    ),
                  ),
                ),
              ),
            ),
            addHorizontalSpace(10),
            Flexible(
              child: CustomFormField(
                label: 'End Date',
                child: SizedBox(
                  child: InkWell(
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
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
                      hintText: endDate != null
                          ? DateFormat('yy/MM/dd').format(endDate!)
                          : 'dd/mm/yy',
                    ),
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
