// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class EditTaskEntityServiceForm extends StatefulWidget {
  final TaskEntityService service;
  const EditTaskEntityServiceForm({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  State<EditTaskEntityServiceForm> createState() =>
      _EditTaskEntityServiceFormState();
}

class _EditTaskEntityServiceFormState extends State<EditTaskEntityServiceForm> {
  final _key = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController requirementController;
  late TextEditingController descriptionController;
  late TextEditingController discountController;
  late TextEditingController addressController;
  late TextEditingController startPriceController;
  late TextEditingController endPriceController;

  final List<String> requirementList = [];

  String? budgetType;
  String? serviceId;
  String? priceType;
  String? currencyCode;
  String? serviceType;

  bool isTermsAccepted = false;
  bool isDiscounted = false;
  bool isBudgetVariable = false;
  bool isAddressVisible = false;

  int? cityCode;

  final uploadBloc = locator<UploadBloc>();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.service.title,
    );
    requirementController = TextEditingController(
      text: widget.service.highlights?.join(","),
    );
    descriptionController = TextEditingController(
      text: widget.service.description,
    );
    discountController = TextEditingController(
      text: widget.service.discountValue,
    );
    addressController = TextEditingController(
      text: widget.service.location,
    );
    startPriceController = TextEditingController(
      text: widget.service.budgetFrom,
    );
    endPriceController = TextEditingController(
      text: widget.service.budgetTo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.92,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  _buildTitle(),
                  _buildCategory(),
                  _buildHighlights(),
                  _buildServiceType(),
                  _buildCity(),
                  _buildDescription(),
                  _buildCurrency(),
                  CustomMultimedia(),
                  _buildTerms(context),
                  _buildButton(),
                ],
              ),
            ),
          ),
        ],
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
              content: 'You have successfully created a service',
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
              content: 'Service cannot be added. Please try again.',
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
                  endPriceController.text.isNotEmpty) {
                // if (cityCode == null &&
                //     currencyCode == null) {
                //   showDialog(
                //     context: context,
                //     builder: (context) => CustomToast(
                //       heading: 'Error',
                //       content: 'Select city or currency',
                //       onTap: () {},
                //       isSuccess: false,
                //     ),
                //   );
                // }
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
                if (context.read<UploadBloc>().state.theStates !=
                    TheStates.loading) {
                  final req = TaskEntityServiceReq(
                    title: titleController.text,
                    description: descriptionController.text,
                    highlights: requirementList,
                    budgetType: budgetType,
                    budgetFrom: double.parse(
                      startPriceController.text.isEmpty
                          ? '0'
                          : startPriceController.text,
                    ),
                    budgetTo: double.parse(
                      endPriceController.text,
                    ),
                    startDate: null,
                    endDate: null,
                    startTime: null,
                    endTime: null,
                    shareLocation: true,
                    isNegotiable: isDiscounted,
                    location: addressController.text,
                    revisions: 0,
                    avatar: 2,
                    isProfessional: true,
                    isOnline: true,
                    isRequested: false,
                    discountType: "Percentage",
                    discountValue: discountController.text.isNotEmpty
                        ? discountController.text
                        : '0.0',
                    noOfReservation: 0,
                    isActive: true,
                    needsApproval: true,
                    isEndorsed: true,
                    service: serviceId,
                    event: "",
                    city: cityCode ?? int.parse(kCityCode),
                    currency: currencyCode ?? kCurrencyCode,
                    images:
                        context.read<UploadBloc>().state.uploadedImageList ??
                            [],
                    videos:
                        context.read<UploadBloc>().state.uploadedVideoList ??
                            [],
                  );

                  context.read<TaskEntityServiceBloc>().add(
                        TaskEntityServiceEdited(
                          taskEntityServiceReq: req,
                        ),
                      );
                }
              } else {
                showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Error',
                    content: 'Please provide necessary details.',
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

  Row _buildTerms(BuildContext context) {
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

  Column _buildCurrency() {
    return Column(
      children: <Widget>[
        CustomFormField(
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
                      hintStyle: Theme.of(context).textTheme.bodySmall,
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
        //* Paused as discussed
        // addVerticalSpace(10),
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
        //     const Text('Add Discount'),
        //   ],
        // ),
        Visibility(
          visible: isDiscounted,
          child: Column(
            children: [
              addVerticalSpace(8),
              Row(
                children: [
                  Flexible(
                    child: NumberIncDecField(
                      controller: discountController,
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
            ],
          ),
        ),
        //* Paused as discussed
        // Row(
        //   children: [
        //     const Icon(
        //       Icons.info_outline_rounded,
        //       color: kColorSecondary,
        //     ),
        //     addHorizontalSpace(10),
        //     const Flexible(
        //       child: Text(
        //         'After 20% discount on the budget i.e. Rs 240, new budget will be Rs 960',
        //         style: TextStyle(
        //           fontSize: 12,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  CustomFormField _buildDescription() {
    return CustomFormField(
      label: 'Description',
      isRequired: true,
      child: CustomTextFormField(
        controller: descriptionController,
        hintText: 'Provide additional description',
        maxLines: 3,
        validator: validateNotEmpty,
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
                  contentPadding: const EdgeInsets.all(5),
                  hintText: 'Enter Your City',
                  hintStyle: Theme.of(context).textTheme.bodySmall,
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

  CustomFormField _buildServiceType() {
    return CustomFormField(
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
                        isAddressVisible = false;
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
                        isAddressVisible = true;
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
            visible: isAddressVisible,
            child: const CustomTextFormField(
              hintText: 'Default Address',
            ),
          ),
        ],
      ),
    );
  }

  CustomFormField _buildHighlights() {
    return CustomFormField(
      label: 'Highlights',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          CustomTextFormField(
            hintText: 'Add highlights',
            inputAction: TextInputAction.next,
            suffixWidget: IconButton(
              onPressed: () {
                if (requirementController.text.isNotEmpty)
                  setState(
                    () {
                      requirementList.add(requirementController.text);
                      requirementController.clear();
                    },
                  );
              },
              icon: Icon(
                Icons.add_box_outlined,
                color: kColorSecondary,
              ),
            ),
            controller: requirementController,
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
                        serviceId = element.id;
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
                color: serviceId == null ? Colors.white : Colors.black,
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
        controller: titleController,
        hintText: 'Enter your service name',
        validator: validateNotEmpty,
      ),
    );
  }
}
