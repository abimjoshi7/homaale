// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/content_client/presentation/pages/terms_of_use.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
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

class _PostTaskPageState extends State<PostTaskPage> {
  final titleController = TextEditingController();
  final requirementController = TextEditingController();
  final descriptionController = TextEditingController();
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  final addressController = TextEditingController();
  String? categoryId;
  String? serviceId;
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
    context.read<CategoriesBloc>().add(
          CategoriesLoadInitiated(),
        );
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
      appBar: CustomAppBar(appBarTitle: "Post a task"),
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
                          CustomMultimedia(),
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

  Future<void> upload() async {
    await context.read<UploadBloc>()
      ..add(
        ImageToFilestoreUploaded(
          list: context.read<UploadBloc>().state.imageFileList,
        ),
      )
      ..add(
        VideoToFilestoreUploaded(
          list: context.read<UploadBloc>().state.videoFileList,
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
                Navigator.popUntil(
                  context,
                  (route) =>
                      route.settings.name == Root.routeName ? true : false,
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
                  upload().whenComplete(
                    () {
                      final x =
                          context.watch<UploadBloc>().state.uploadedImageList;
                      final y =
                          context.watch<UploadBloc>().state.uploadedVideoList;
                      log(x.toString());
                      log(y.toString());
                      // final req = TaskEntityServiceReq(
                      //   title: titleController.text,
                      //   description: descriptionController.text,
                      //   highlights: requirementList,
                      //   budgetType: budgetType,
                      //   budgetFrom: double.parse(
                      //     startPriceController.text.isEmpty
                      //         ? "0"
                      //         : startPriceController.text,
                      //   ),
                      //   budgetTo: double.parse(endPriceController.text),
                      //   startDate: DateFormat("yyyy-MM-dd")
                      //       .format(startDate ?? DateTime.now()),
                      //   endDate: DateFormat("yyyy-MM-dd")
                      //       .format(endDate ?? DateTime.now()),
                      //   startTime: startTime?.format(context),
                      //   endTime: endTime?.format(context),
                      //   shareLocation: true,
                      //   isNegotiable: true,
                      //   location: addressController.text,
                      //   revisions: 0,
                      //   avatar: 2,
                      //   isProfessional: true,
                      //   isOnline: true,
                      //   isRequested: true,
                      //   discountType: "Percentage",
                      //   discountValue: "",
                      //   extraData: [],
                      //   noOfReservation: 2147483647,
                      //   isActive: true,
                      //   needsApproval: true,
                      //   isEndorsed: true,
                      //   service: categoryId,
                      //   event: "",
                      //   city: cityCode ??
                      //       int.parse(
                      //         kCityCode,
                      //       ),
                      //   currency: currencyCode ?? kCurrencyCode,
                      //   images: context
                      //           .read<UploadBloc>()
                      //           .state
                      //           .uploadedImageList ??
                      //       [],
                      //   videos: context
                      //           .read<UploadBloc>()
                      //           .state
                      //           .uploadedVideoList ??
                      //       [],
                      // );

                      // context.read<TaskEntityServiceBloc>().add(
                      //       TaskEntityServiceCreated(
                      //         req: req,
                      //       ),
                      //     );
                    },
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
                  controller: endPriceController,
                ),
              ),
              addHorizontalSpace(10),
              Flexible(
                child: CustomDropDownField(
                  list: const ['Project', 'Hourly', 'Daily', 'Monthly'],
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
            return DropdownSearch(
              selectedItem: state.currencyListRes
                  .firstWhere(
                    (element) => element.name!.startsWith("Nepalese"),
                  )
                  .name,
              items: List.generate(
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
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  hintText: 'Enter Your Currency',
                  hintStyle: Theme.of(context).textTheme.displaySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColorSecondary,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                baseStyle: Theme.of(context).textTheme.bodySmall,
              ),
              clearButtonProps: ClearButtonProps(
                padding: EdgeInsets.zero,
                iconSize: 16,
                visualDensity: VisualDensity.compact,
                alignment: Alignment.centerRight,
                isVisible: true,
                color: currencyCode == null ? Colors.white : Colors.black,
              ),
              popupProps: PopupProps.modalBottomSheet(
                showSearchBox: true,
                modalBottomSheetProps: ModalBottomSheetProps(
                  backgroundColor: Theme.of(context).cardColor,
                  useSafeArea: false,
                ),
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
            children: [
              Flexible(
                child: CustomFormField(
                  label: 'Start Date',
                  child: InkWell(
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
                    child: CustomFormContainer(
                      leadingWidget: const Icon(
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
              addHorizontalSpace(10),
              Flexible(
                child: CustomFormField(
                  label: 'End Date',
                  isRequired: true,
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
                      hintText: startTime?.format(context) ?? 'hh:mm',
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
                      hintText: endTime?.format(context) ?? 'hh:mm',
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
            return DropdownSearch(
              selectedItem: state.list
                  .firstWhere(
                    (element) => element.name!.startsWith("Kathmandu"),
                  )
                  .name,
              items: List.generate(
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
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  contentPadding: const EdgeInsets.all(5),
                  hintText: 'Enter Your City',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  // const TextStyle(
                  //   color: Color(0xff9CA0C1),
                  //   fontWeight: FontWeight.w400,
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColorSecondary,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                baseStyle: Theme.of(context).textTheme.bodySmall,
              ),
              clearButtonProps: ClearButtonProps(
                padding: EdgeInsets.zero,
                iconSize: 16,
                visualDensity: VisualDensity.compact,
                alignment: Alignment.centerRight,
                isVisible: true,
                color: cityCode == null ? Colors.white : Colors.black,
              ),
              popupProps: PopupProps.modalBottomSheet(
                showSearchBox: true,
                modalBottomSheetProps: ModalBottomSheetProps(
                  backgroundColor: Theme.of(context).cardColor,
                  useSafeArea: false,
                ),
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
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success) {
            return DropdownSearch(
              items: List.generate(
                state.serviceList?.length ?? 0,
                (index) => state.serviceList?[index].title,
              ),
              onChanged: (value) {
                for (final element in state.serviceList!) {
                  if (value == element.title) {
                    setState(
                      () {
                        categoryId = element.id;
                      },
                    );
                  }
                }
              },
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(5),
                  hintText: 'Trimming & Cutting',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  // const TextStyle(
                  //   color: Color(0xff9CA0C1),
                  //   fontWeight: FontWeight.w400,
                  // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: kColorSecondary,
                    ),
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                ),
                baseStyle: Theme.of(context).textTheme.bodySmall,
                // TextStyle(
                //   color: Colors.black,
                // ),
              ),
              clearButtonProps: ClearButtonProps(
                padding: EdgeInsets.zero,
                iconSize: 16,
                visualDensity: VisualDensity.compact,
                alignment: Alignment.centerRight,
                isVisible: true,
                color: categoryId == null ? Colors.white : Colors.black,
              ),
              popupProps: PopupProps.modalBottomSheet(
                showSearchBox: true,
                modalBottomSheetProps: ModalBottomSheetProps(
                  backgroundColor: Theme.of(context).cardColor,
                  useSafeArea: false,
                ),
              ),
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
}
