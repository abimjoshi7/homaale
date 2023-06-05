import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/sandbox/presentation/pages/sandbox_page.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/content_client/presentation/pages/terms_of_use.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class PostTaskPage extends StatefulWidget {
  static const routeName = '/post-task-page';
  const PostTaskPage({super.key});

  @override
  State<PostTaskPage> createState() => _PostTaskPageState();
}

class _PostTaskPageState extends State<PostTaskPage> with TheModalBottomSheet {
  final titleController = TextEditingController();
  final requirementController = TextEditingController();
  final descriptionController = TextEditingController();
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  final addressController = TextEditingController();
  String? priceType = 'Fixed';
  String? taskType = 'On premise';
  String? budgetType = 'Project';
  String? currencyCode;
  DateTime? startTime;
  DateTime? endTime;
  bool isDiscounted = false;
  bool isSpecified = true;
  bool isAddressVisibile = true;
  bool isBudgetVariable = false;
  bool isCustomDate = false;
  bool isTermsAccepted = false;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];
  List<String> requirementList = [];
  List<int>? imageList;
  List<int>? fileList;
  DateTime? startDate;
  DateTime? endDate;
  int? cityCode;
  int? budgetTo;
  int? budgetFrom;
  final _key = GlobalKey<FormState>();
  final uploadBloc = locator<UploadBloc>();

  @override
  void initState() {
    context.read<CategoriesBloc>().add(
          CategoriesLoadInitiated(),
        );
    // context.read<ServicesBloc>().add(
    //       const ServicesLoadInitiated(),
    //     );

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
      appBar: CustomAppBar(
        appBarTitle: "Post a task",
        trailingWidget: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            SandboxPage.routeName,
          ),
          child: Container(
            height: 50,
            width: 50,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _key,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          _buildTitle(),
                          _buildCategory(),
                          _buildRequirements(),
                          _buildTaskType(),
                          Visibility(
                            visible: isAddressVisibile,
                            child: CustomFormField(
                              label: "Address Information",
                              isRequired: true,
                              child: CustomTextFormField(
                                hintText: "Enter address details",
                                controller: addressController,
                              ),
                            ),
                          ),
                          _buildDescription(),
                          _buildCity(),
                          _buildDate(context),
                          // Visibility(
                          //   visible: isAddressVisibile,
                          //   child: CustomTextFormField(
                          //     controller: addressController,
                          //     hintText: 'Default Address (Home)',
                          //   ),
                          // ),
                          _buildCurrency(),
                          _buildBudget(),
                          _buildDialog(),
                          //* Paused as discussed
                          // Row(
                          //   children: [
                          //     CustomCheckBox(
                          //       isChecked: isDiscounted,
                          //       onTap: () => setState(
                          //         () {
                          //           isDiscounted = !isDiscounted;
                          //         },
                          //       ),
                          //     ),
                          //     addHorizontalSpace(10),
                          //     const Text('Yes, it is negotiable.'),
                          //   ],
                          // ),
                          CustomMultimedia(
                            bloc: uploadBloc,
                          ),
                          _buildTermsConditions(context),
                          _buildButton(),
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

  Future<void> _uploadFile() async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );

    uploadBloc
      ..add(
        VideoToFilestoreUploaded(
          list: uploadBloc.state.videoFileList,
        ),
      )
      ..add(
        ImageToFilestoreUploaded(
          list: uploadBloc.state.imageFileList,
        ),
      );

    await Future.delayed(
      Duration(
        seconds: 15,
      ),
    );
  }

  BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState> _buildButton() {
    return BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isCreated == true) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'You have successfully posted a task',
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
        if (state.theStates == TheStates.failure && state.isCreated == false) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: 'Post cannot be posted. Please try again.',
              onTap: () {},
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          callback: () async {
            if (context.read<CategoriesBloc>().state.serviceId != null) {
              if (isTermsAccepted) {
                if (_key.currentState!.validate() &&
                    endPriceController.text.isNotEmpty &&
                    endDate != null) {
                  if (endDate!.isBefore(
                    startDate ??
                        endDate!.subtract(
                          Duration(
                            seconds: 5,
                          ),
                        ),
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
                    if (uploadBloc.state.imageFileList.length != 0 ||
                        uploadBloc.state.videoFileList.length != 0)
                      await _uploadFile();
                    final req = TaskEntityServiceReq(
                      title: titleController.text,
                      description: descriptionController.text,
                      highlights: requirementList,
                      budgetType: budgetType,
                      budgetFrom: startPriceController.text.isEmpty
                          ? null
                          : double.parse(
                              startPriceController.text,
                            ),
                      budgetTo: double.parse(
                        endPriceController.text,
                      ),
                      startDate: DateFormat("yyyy-MM-dd")
                          .format(startDate ?? DateTime.now()),
                      endDate: DateFormat("yyyy-MM-dd")
                          .format(endDate ?? DateTime.now()),
                      startTime: startTime != null
                          ? DateFormat.jms().format(startTime!)
                          : null,
                      endTime: endTime != null
                          ? DateFormat.jms().format(endTime!)
                          : null,
                      shareLocation: true,
                      isNegotiable: true,
                      location: addressController.text,
                      revisions: 0,
                      avatar: 2,
                      isProfessional: true,
                      isOnline: !isAddressVisibile,
                      isRequested: true,
                      discountType: "Percentage",
                      discountValue: '0.0',
                      noOfReservation: 0,
                      isActive: true,
                      needsApproval: true,
                      isEndorsed: true,
                      service: context.read<CategoriesBloc>().state.serviceId,
                      event: "",
                      city: cityCode ?? int.parse(kCityCode),
                      currency: currencyCode ?? kCurrencyCode,
                      images: uploadBloc.state.uploadedImageList,
                      videos: uploadBloc.state.uploadedVideoList,
                    );

                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceCreated(
                            req: req,
                          ),
                        );
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
              } else {
                showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: "Failure",
                    content: "Please accept the terms and condititons",
                    onTap: () {},
                    isSuccess: false,
                  ),
                );
              }
            } else {
              showDialog(
                context: context,
                builder: (context) => CustomToast(
                  heading: "Failure",
                  content: "Please choose a service",
                  onTap: () {},
                  isSuccess: false,
                ),
              );
            }
          },
          label: 'Next',
        );
      },
    );
  }

  Row _buildTermsConditions(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onTap: () async {
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
    );
  }

  CustomFormField _buildBudget() {
    return CustomFormField(
      label: 'Budget(Mininum Rs.10)',
      isRequired: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio<String>(
                value: 'Fixed',
                groupValue: priceType,
                onChanged: (value) => setState(
                  () {
                    priceType = value;
                    isBudgetVariable = false;
                    startPriceController.clear();
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
          ),
          Row(
            children: [
              Visibility(
                visible: isBudgetVariable,
                child: Flexible(
                  child: Row(
                    children: [
                      NumberIncDecField(
                        controller: startPriceController,
                        validator: (p0) {
                          if (isBudgetVariable) {
                            return p0 == null || p0.isEmpty
                                ? "Required Field"
                                : null;
                          }
                          return null;
                        },
                        onChanged: (value) => setState(
                          () {
                            if (startPriceController.text.isNotEmpty)
                              budgetFrom = getRecievableAmount(
                                double.parse(startPriceController.text),
                                double.parse(context
                                        .read<CategoriesBloc>()
                                        .state
                                        .commission ??
                                    "0.0"),
                              );
                          },
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: const Text(
                            "-",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: NumberIncDecField(
                  validator: (p0) =>
                      p0 == null || p0.isEmpty ? "Required" : null,
                  controller: endPriceController,
                  onChanged: (value) => setState(
                    () {
                      if (endPriceController.text.isNotEmpty)
                        budgetTo = getRecievableAmount(
                          double.parse(endPriceController.text),
                          double.parse(
                              context.read<CategoriesBloc>().state.commission ??
                                  "0.0"),
                        );
                    },
                  ),
                ),
              ),
              Flexible(
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
        ],
      ),
    );
  }

  CustomFormField _buildCurrency() {
    return CustomFormField(
      label: 'Currency',
      isRequired: true,
      child: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyLoadSuccess) {
            return CustomDropdownSearch(
              selectedItem: state.currencyListRes
                  .firstWhere(
                    (element) => element.name!.startsWith("Nepalese"),
                  )
                  .name,
              list: List.generate(
                state.currencyListRes.length,
                (index) => state.currencyListRes[index].name,
              ),
              onChanged: (p0) => setState(
                () {
                  final x = state.currencyListRes.firstWhere(
                    (element) => p0 == element.name,
                  );
                  currencyCode = x.code;
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  CustomFormField _buildDate(BuildContext context) {
    return CustomFormField(
      label: 'When do you want the task to be completed?',
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: CustomFormField(
                  label: 'Start Date',
                  child: CustomTextFormField(
                    readOnly: true,
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
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
                    prefixWidget: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.grey.shade800,
                    ),
                    hintText: startDate?.toIso8601String().substring(
                              0,
                              10,
                            ) ??
                        'yy/mm/dd',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey.shade900),
                  ),
                ),
              ),
              addHorizontalSpace(10),
              Flexible(
                child: CustomFormField(
                  label: 'End Date',
                  isRequired: true,
                  child: CustomTextFormField(
                    readOnly: true,
                    validator: (value) =>
                        endDate == null ? "Required Field" : null,
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
                    hintText: endDate?.toIso8601String().substring(
                              0,
                              10,
                            ) ??
                        'yy/mm/dd',
                    theHeight: 48.0,
                    theWidth: double.infinity,
                    prefixWidget: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.grey.shade800,
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey.shade900),
                  ),
                ),
              ),
            ],
          ),
          //* Paused as discussed
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
                      await showCustomBottomSheet(
                        context: context,
                        widget: SizedBox.fromSize(
                          size: Size.fromHeight(250),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (value) => setState(
                              () {
                                startTime = value;
                              },
                            ),
                          ),
                        ),
                      );
                      // await showTimePicker(
                      //   context: context,
                      //   initialTime: TimeOfDay.now(),
                      // ).then(
                      //   (value) => setState(
                      //     () {
                      //       startTime = value;
                      //     },
                      //   ),
                      // );
                    },
                    child: CustomFormContainer(
                      hintText: startTime != null
                          ? DateFormat.jm().format(startTime!)
                          : 'hh:mm:ss',
                    ),
                  ),
                ),
                const Text(' - '),
                Flexible(
                  child: InkWell(
                    onTap: () async {
                      await showCustomBottomSheet(
                        context: context,
                        widget: SizedBox.fromSize(
                          size: Size.fromHeight(250),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            onDateTimeChanged: (value) => setState(
                              () {
                                endTime = value;
                              },
                            ),
                          ),
                        ),
                      );

                      // await showTimePicker(
                      //   context: context,
                      //   initialTime: TimeOfDay.now(),
                      // ).then(
                      //   (value) => setState(
                      //     () {
                      //       endTime = value;
                      //     },
                      //   ),
                      // );
                    },
                    child: CustomFormContainer(
                      hintText: endTime != null
                          ? DateFormat.jm().format(endTime!)
                          : 'hh:mm:ss',
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
    );
  }

  CustomFormField _buildCity() {
    return CustomFormField(
      isRequired: true,
      label: 'City',
      child: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          if (state is CityLoadSuccess) {
            return CustomDropdownSearch(
              selectedItem: state.list
                  .firstWhere(
                    (element) => element.name!.startsWith("Kathmandu"),
                  )
                  .name,
              list: List.generate(
                state.list.length,
                (index) => state.list[index].name,
              ),
              onChanged: (p0) => setState(
                () {
                  final x = state.list.firstWhere(
                    (element) => p0 == element.name,
                  );
                  cityCode = x.id;
                },
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  CustomFormField _buildDescription() {
    return CustomFormField(
      label: 'Description',
      isRequired: true,
      child: CustomTextFormField(
        validator: validateNotEmpty,
        controller: descriptionController,
        hintText: 'Describe your requirements in few words',
        maxLines: 3,
      ),
    );
  }

  CustomFormField _buildTaskType() {
    return CustomFormField(
      label: 'Task Type',
      isRequired: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
    );
  }

  CustomFormField _buildRequirements() {
    return CustomFormField(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        size: 15,
                        color: kColorGrey,
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
            validator: (value) => requirementList.length == 0
                ? "Atleast 1 Requirement Required"
                : null,
            suffixWidget: IconButton(
              icon: Icon(
                Icons.add_box_outlined,
                color: kColorSecondary,
              ),
              onPressed: () {
                if (requirementController.text.isNotEmpty)
                  setState(
                    () {
                      requirementList.add(requirementController.text);
                      requirementController.clear();
                    },
                  );
              },
            ),
          ),
        ],
      ),
    );
  }

  CustomFormField _buildCategory() {
    return CustomFormField(
      label: 'Category',
      isRequired: true,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success) {
            return Column(
              children: [
                CustomDropdownSearch(
                    list: List.generate(
                      state.categoryList?.length ?? 0,
                      (index) => state.categoryList?[index].name ?? "",
                    ),
                    onChanged: (value) {
                      context.read<CategoriesBloc>().add(
                            CategoriesChanged(
                              name: (value as String?) ?? "",
                            ),
                          );
                    }),
                addVerticalSpace(
                  8,
                ),
                if (state.serviceList?.isNotEmpty ?? false)
                  CustomFormField(
                    label: "Service",
                    isRequired: true,
                    child: CustomDropdownSearch(
                      list: List.generate(
                        state.serviceList?.length ?? 0,
                        (index) => state.serviceList?[index].title ?? "",
                      ),
                      onChanged: (value) {
                        context.read<CategoriesBloc>().add(
                              SubCategoriesChanged(
                                name: (value as String?) ?? "",
                              ),
                            );
                      },
                    ),
                  ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  CustomFormField _buildTitle() {
    return CustomFormField(
      label: 'Title',
      isRequired: true,
      child: CustomTextFormField(
        validator: validateNotEmpty,
        controller: titleController,
        hintText: 'Need a Garden Cleaner',
      ),
    );
  }

  Widget _buildDialog() {
    if (endPriceController.text.length != 0) {
      if (context.read<CategoriesBloc>().state.commission != null)
        return Visibility(
          visible: budgetTo != null,
          child: Container(
            constraints: BoxConstraints.loose(
              Size(
                double.maxFinite,
                60,
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 4),
            color: kColorLightSkyBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: kColorBlue,
                  ),
                  addHorizontalSpace(
                    8,
                  ),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text:
                            "Your task will be posted in a portal ${(startPriceController.text.length == 0) ? "for" : "with budget ranging from"} ",
                        style: Theme.of(context).textTheme.displayMedium,
                        children: startPriceController.text.length == 0
                            ? [
                                TextSpan(
                                  text: "Rs $budgetTo",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: kColorSecondary,
                                  ),
                                )
                              ]
                            : [
                                TextSpan(
                                  text: "Rs $budgetFrom",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: kColorSecondary,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " to ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                      children: [
                                        TextSpan(
                                          text: "Rs $budgetTo",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            color: kColorSecondary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
    }
    return SizedBox.shrink();
  }
}
