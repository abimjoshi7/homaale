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
  final String? id;

  const EditTaskEntityServiceForm({Key? key, this.id}) : super(key: key);

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
    context.read<TaskEntityServiceBloc>().add(
          TaskEntityServiceSingleLoaded(
            id: widget.id ?? "",
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        switch (state.theStates) {
          case TheStates.loading:
            return CardLoading(height: 200);
          case TheStates.success:
            titleController = TextEditingController(
              text: state.taskEntityService?.title,
            );
            requirementController = TextEditingController(
              text: state.taskEntityService?.highlights?.join(","),
            );
            descriptionController = TextEditingController(
              text: state.taskEntityService?.description,
            );
            discountController = TextEditingController(
              text: state.taskEntityService?.discountValue,
            );
            addressController = TextEditingController(
              text: state.taskEntityService?.location,
            );
            startPriceController = TextEditingController(
              text: state.taskEntityService?.budgetFrom,
            );
            endPriceController = TextEditingController(
              text: state.taskEntityService?.budgetTo,
            );
            return Form(
              key: _key,
              child: Column(
                children: [
                  _buildTitle(),
                  _buildCategory(),
                  _buildSubCategory(),
                  _buildHighlights(),
                  _buildServiceType(),
                  _buildCity(),
                  _buildDescription(),
                  _buildCurrency(),
                  _buildDialog(),
                  CustomMultimedia(),
                  _buildTerms(context),
                  _buildButton(),
                ],
              ),
            );
          default:
            return CardLoading(height: 200);
        }
      },
    );
  }

  BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState> _buildButton() {
    return BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
      listenWhen: (previous, current) {
        if (previous.isEdited == false && current.isEdited == true) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isEdited == true) {
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
        if (state.theStates == TheStates.failure && state.isEdited == false) {
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
                await uploadBloc
                  ..add(
                    ImageToFilestoreUploaded(
                      list: uploadBloc.state.imageFileList,
                    ),
                  )
                  ..add(
                    VideoToFilestoreUploaded(
                      list: uploadBloc.state.videoFileList,
                    ),
                  );
                if (uploadBloc.state.theStates != TheStates.loading) {
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
                    service: context.read<CategoriesBloc>().state.serviceId,
                    event: "",
                    city: cityCode ?? int.parse(kCityCode),
                    currency: currencyCode ?? kCurrencyCode,
                    images: uploadBloc.state.uploadedImageList,
                    videos: uploadBloc.state.uploadedVideoList,
                  );

                  context.read<TaskEntityServiceBloc>().add(
                        TaskEntityServiceEdited(
                          id: state.taskEntityService?.id,
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
                  onChanged: (value) => setState(
                    () {
                      if (startPriceController.text.isNotEmpty)
                        budgetFrom = getPayableAmount(
                          double.parse(startPriceController.text),
                          double.parse(context.read<CategoriesBloc>().state.commission ?? "0.0"),
                        );
                    },
                  ),
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
                onChanged: (value) => setState(
                  () {
                    if (endPriceController.text.isNotEmpty)
                      budgetTo = getPayableAmount(
                        double.parse(endPriceController.text),
                        double.parse(context.read<CategoriesBloc>().state.commission ?? "0.0"),
                      );
                  },
                ),
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
                  hintText: 'Select budget type',
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
            return CustomDropdownSearch(
              list: List.generate(
                state.categoryList?.length ?? 0,
                (index) => state.categoryList?[index].name ?? "",
              ),
              onChanged: (value) {
                context.read<CategoriesBloc>().add(CategoriesChanged(name: (value as String?) ?? ""));
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  BlocBuilder _buildSubCategory() {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          if (state.serviceList?.isNotEmpty ?? false)
            return CustomFormField(
              label: 'Service',
              isRequired: true,
              child: CustomDropdownSearch(
                list: List.generate(
                  state.serviceList?.length ?? 0,
                  (index) => state.serviceList?[index].title ?? "",
                ),
                onChanged: (value) {
                  context.read<CategoriesBloc>().add(SubCategoriesChanged(name: (value as String?) ?? ""));
                },
                onRemovePressed: () {
                  context.read<CategoriesBloc>().add(CategoriesLoadInitiated());
                },
                serviceId: context.read<CategoriesBloc>().state.serviceId,
              ),
            );
        }
        return const SizedBox.shrink();
      },
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
                            "Your service will be posted in a portal ${(startPriceController.text.length == 0) ? "for" : "with budget ranging from"} ",
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
                                      style: Theme.of(context).textTheme.displayMedium,
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
