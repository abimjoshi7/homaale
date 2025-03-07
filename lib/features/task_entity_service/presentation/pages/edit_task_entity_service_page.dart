import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/services.dart';

class EditTaskEntityServiceForm extends StatefulWidget {
  final String? id;
  final bool isRequested;

  const EditTaskEntityServiceForm({
    Key? key,
    this.id,
    this.isRequested = false,
  }) : super(key: key);

  @override
  State<EditTaskEntityServiceForm> createState() =>
      _EditTaskEntityServiceFormState();
}

class _EditTaskEntityServiceFormState extends State<EditTaskEntityServiceForm>
    with TheModalBottomSheet {
  final _key123 = GlobalKey<FormState>();
  final uploadBloc = locator<UploadBloc>();

  TextEditingController titleController = TextEditingController();
  TextEditingController requirementController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController startPriceController = TextEditingController();
  TextEditingController endPriceController = TextEditingController();

  List<String> requirementList = [];

  String? budgetType;
  String? serviceId;
  String? priceType;
  String? currencyCode;
  String? serviceType;
  String? category;
  String? subCategory;

  List<int> images = [];
  List<int> videos = [];

  bool isTermsAccepted = false;
  bool isBudgetVariable = false;
  bool isAddressVisible = false;
  bool informationLoaded = false;
  bool isNegotiable = false;
  bool isLoading = false;

  int? cityCode;
  int? budgetTo;
  int? budgetFrom;

  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? startTimeNew;
  String? endTimeNew;
  String? endTime;

  @override
  void initState() {
    super.initState();
    context
        .read<TaskEntityServiceBloc>()
        .add(TaskEntityServiceSingleLoaded(id: widget.id ?? "", isEdit: true));

    Future.delayed(Duration(seconds: 2), () {
      context.read<CategoriesBloc>().add(CategoriesChanged(
          name: context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService
                  .service
                  ?.category
                  ?.name ??
              ''));

      titleController.text =
          context.read<TaskEntityServiceBloc>().state.taskEntityService.title ??
              '';
      requirementList = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .highlights ??
          [];
      descriptionController.text = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .description ??
          '';
      addressController.text = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .location ??
          '';
      startPriceController.text = widget.isRequested
          ? Decimal.parse(context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService
                  .payableFrom
                  .toString())
              .toString()
          : Decimal.parse(context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService
                  .budgetFrom
                  .toString())
              .toString();
      endPriceController.text = widget.isRequested
          ? Decimal.parse(context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService
                  .payableTo
                  .toString())
              .toString()
          : Decimal.parse(context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService
                  .budgetTo
                  .toString())
              .toString();
      cityCode = context
          .read<TaskEntityServiceBloc>()
          .state
          .taskEntityService
          .city
          ?.id
          ?.toInt();
      currencyCode = context
          .read<TaskEntityServiceBloc>()
          .state
          .taskEntityService
          .currency
          ?.code;
      isBudgetVariable = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .isRange ??
          false;
      priceType = context
                  .read<TaskEntityServiceBloc>()
                  .state
                  .taskEntityService
                  .isRange ??
              false
          ? 'Variable'
          : 'Fixed';
      category = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .service
              ?.category
              ?.name ??
          '';
      subCategory = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .service
              ?.title ??
          '';
      serviceId = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .service
              ?.id ??
          '';
      budgetType = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .budgetType ??
          '';
      startDate = context
          .read<TaskEntityServiceBloc>()
          .state
          .taskEntityService
          .startDate;
      endDate =
          context.read<TaskEntityServiceBloc>().state.taskEntityService.endDate;
      startTime = context
          .read<TaskEntityServiceBloc>()
          .state
          .taskEntityService
          .startTime;
      endTime =
          context.read<TaskEntityServiceBloc>().state.taskEntityService.endTime;
      isNegotiable = context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .isNegotiable ??
          false;
      serviceType = 'Remote';

      context
          .read<TaskEntityServiceBloc>()
          .state
          .taskEntityService
          .images
          ?.forEach(
        (element) {
          setState(() {
            images.add(element.id!.toInt());
          });
        },
      );

      context
          .read<TaskEntityServiceBloc>()
          .state
          .taskEntityService
          .videos
          ?.forEach(
        (element) {
          setState(() {
            videos.add(element.id!.toInt());
          });
        },
      );
      setState(() {
        informationLoaded = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    requirementController.dispose();
    descriptionController.dispose();
    discountController.dispose();
    addressController.dispose();
    startPriceController.dispose();
    endPriceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        switch (state.theStates) {
          case TheStates.initial:
            return CardLoading(height: 200);
          case TheStates.loading:
            return CardLoading(height: 200);
          case TheStates.success:
            return informationLoaded || isLoading
                ? Form(
                    key: _key123,
                    child: Column(
                      children: [
                        _buildTitle(),
                        _buildCategory(),
                        _buildSubCategory(),
                        _buildHighlights(),
                        _buildServiceType(),
                        _buildCity(),
                        widget.isRequested ? _buildDate(context) : SizedBox(),
                        _buildDescription(),
                        _buildCurrency(),
                        _buildBudget(),
                        _buildDialog(),
                        _buildIsNegotiable(),
                        CustomMultimedia(
                          bloc: uploadBloc,
                        ),
                        _buildTerms(context),
                        _buildButton(),
                      ],
                    ),
                  )
                : CardLoading(height: 200);
          case TheStates.failure:
            return informationLoaded || isLoading
                ? Column(
                    children: [
                      _buildTitle(),
                      _buildCategory(),
                      _buildSubCategory(),
                      _buildHighlights(),
                      _buildServiceType(),
                      _buildCity(),
                      widget.isRequested ? _buildDate(context) : SizedBox(),
                      _buildDescription(),
                      _buildCurrency(),
                      _buildDialog(),
                      _buildIsNegotiable(),
                      CustomMultimedia(
                        bloc: uploadBloc,
                      ),
                      _buildTerms(context),
                      _buildButton(),
                    ],
                  )
                : CardLoading(height: 200);
        }
      },
    );
  }

  BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState> _buildButton() {
    return BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isEdited == true) {
          setState(() {
            isLoading = false;
          });
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Information updated successfully!',
              onTap: () {
                context.read<TaskEntityServiceBloc>().add(ResetTESEditStatus());
                context
                    .read<TaskBloc>()
                    .add(AllTaskLoadInitiated(page: 1, newFetch: true));
                context.read<TaskEntityServiceBloc>().add(
                      TaskEntityServiceInitiated(
                        isTask: false,
                        newFetch: true,
                      ),
                    );
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
          setState(() {
            isLoading = false;
          });
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: 'Please try again.',
              onTap: () {
                context.read<TaskEntityServiceBloc>().add(ResetTESEditStatus());
                Navigator.pop(context);
              },
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<UploadBloc, UploadState>(
          bloc: uploadBloc,
          listener: (context, state) {
            if (state.theStates == TheStates.success) {
              final req = TaskEntityServiceReq(
                title: titleController.text,
                description: descriptionController.text,
                highlights: requirementList,
                budgetType: budgetType,
                budgetFrom: priceType == 'Variable'
                    ? double.parse(startPriceController.text)
                    : 0,
                budgetTo: double.parse(endPriceController.text),
                startDate: DateFormat("yyyy-MM-dd")
                    .format(startDate ?? DateTime.now()),
                endDate:
                    DateFormat("yyyy-MM-dd").format(endDate ?? DateTime.now()),
                startTime: startTimeNew != null
                    ? DateFormat.jm().format(DateTime.parse(startTimeNew!))
                    : startTime != null
                        ? startTime
                        : null,
                endTime: endTimeNew != null
                    ? DateFormat.jm().format(DateTime.parse(endTimeNew!))
                    : endTime != null
                        ? endTime
                        : null,
                shareLocation: true,
                isNegotiable: isNegotiable,
                location: addressController.text,
                revisions: 0,
                avatar: 2,
                isProfessional: true,
                isOnline: true,
                isRequested: widget.isRequested,
                discountType: "Percentage",
                discountValue: discountController.text.isNotEmpty
                    ? discountController.text
                    : '0.0',
                noOfReservation: 0,
                isRange: isBudgetVariable,
                isActive: true,
                needsApproval: true,
                isEndorsed: true,
                service:
                    context.read<CategoriesBloc>().state.serviceId?.isEmpty ??
                            true
                        ? serviceId
                        : context.read<CategoriesBloc>().state.serviceId,
                event: "",
                city: cityCode ?? int.parse(kCityCode),
                currency: currencyCode ?? kCurrencyCode,
                images: uploadBloc.state.uploadedImageList.isNotEmpty
                    ? [...images, ...uploadBloc.state.uploadedImageList]
                    : [],
                videos: uploadBloc.state.uploadedVideoList.isNotEmpty
                    ? [...videos, ...uploadBloc.state.uploadedVideoList]
                    : [],
              );

              context.read<TaskEntityServiceBloc>().add(
                    TaskEntityServiceEdited(
                      id: widget.id,
                      taskEntityServiceReq: req,
                    ),
                  );
            }
          },
          builder: (context, state) {
            return CustomElevatedButton(
              callback: () async {
                if (isTermsAccepted) {
                  if (_key123.currentState!.validate() &&
                      endPriceController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
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

                    /// If problem add the code in the upload bloc listener here
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

  Padding _buildIsNegotiable() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: <Widget>[
          CustomCheckBox(
            isChecked: isNegotiable,
            onTap: () async {
              setState(
                () {
                  isNegotiable = !isNegotiable;
                },
              );
            },
          ),
          addHorizontalSpace(10),
          Text(
            "Do you want to negotiate the price?",
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }

  Widget _buildCurrency() {
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

  Widget _buildBudget() {
    return Column(
      children: [
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isBudgetVariable,
              child: Expanded(
                flex: isBudgetVariable ? 1 : 2,
                child: CustomTextFormField(
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  controller: startPriceController,
                  validator: (p0) {
                    if (isBudgetVariable) {
                      if (startPriceController.text.length == 0) {
                        return "Required Field";
                      }

                      if (int.parse(p0 ?? '0') < 10) {
                        return "Budget Cannot Be Less Than 10";
                      }

                      if (p0 == endPriceController.text) {
                        return "Invalid Range";
                      }
                      if (endPriceController.text.isNotEmpty) {
                        if (int.parse(p0 ?? '0') >
                            int.parse(endPriceController.text)) {
                          return "Cannot be more than End budget";
                        }
                      }
                    }

                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: Theme.of(context).textTheme.displayLarge,
                  onChanged: (value) => setState(
                    () {
                      if (startPriceController.text.isNotEmpty)
                        budgetFrom = getRecievableAmount(
                          double.parse(startPriceController.text),
                          double.parse(
                              context.read<CategoriesBloc>().state.commission ??
                                  "0.0"),
                        );
                    },
                  ),
                  suffixWidget: budgetIncrementIcon(startPriceController),
                ),
              ),
            ),
            Visibility(
              visible: isBudgetVariable,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10.0,
                ),
                child: const Text(
                  "To",
                ),
              ),
            ),
            Expanded(
              flex: isBudgetVariable ? 1 : 2,
              child: CustomTextFormField(
                errorMaxLines: 3,
                errorStyle: TextStyle(),
                textInputType: TextInputType.numberWithOptions(decimal: true),
                controller: endPriceController,
                validator: (p0) {
                  if (endPriceController.text.length == 0) {
                    return "Required Field";
                  }
                  if (int.parse(p0 ?? '0') < 10) {
                    return "Budget Cannot Be Less Than 10";
                  }
                  if (isBudgetVariable &&
                      startPriceController.text.isNotEmpty) {
                    if (p0 == startPriceController.text) {
                      return "Invalid Range";
                    }
                    if (int.parse(p0 ?? '0') <
                        int.parse(startPriceController.text)) {
                      return "Cannot be less than Start budget";
                    }
                  }
                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                style: Theme.of(context).textTheme.displayLarge,
                onChanged: (p0) {
                  setState(
                    () {
                      if (endPriceController.text.isNotEmpty)
                        budgetTo = getRecievableAmount(
                          double.parse(endPriceController.text),
                          double.parse(
                              context.read<CategoriesBloc>().state.commission ??
                                  "0.0"),
                        );
                    },
                  );
                },
                suffixWidget: budgetIncrementIcon(endPriceController),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CustomDropDownField(
                  initialValue: budgetType,
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
            child: CustomTextFormField(
              hintText: 'Default Address',
              controller: addressController,
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
            hintText: 'Add Highlight',
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
              selectedItem: category,
              list: List.generate(
                state.categoryList?.length ?? 0,
                (index) => state.categoryList?[index].name ?? "",
              ),
              onChanged: (value) {
                context
                    .read<CategoriesBloc>()
                    .add(CategoriesChanged(name: (value as String?) ?? ""));
                setState(() {
                  subCategory = null;
                });
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
            context.read<CategoriesBloc>().add(SubCategoriesChanged(
                name: context
                        .read<TaskEntityServiceBloc>()
                        .state
                        .taskEntityService
                        .service
                        ?.title ??
                    ''));
          return CustomFormField(
            label: 'Service',
            isRequired: true,
            child: CustomDropdownSearch(
              selectedItem: subCategory,
              list: List.generate(
                state.serviceList?.length ?? 0,
                (index) => state.serviceList?[index].title ?? "",
              ),
              onChanged: (value) {
                context
                    .read<CategoriesBloc>()
                    .add(SubCategoriesChanged(name: (value as String?) ?? ""));
              },
              onRemovePressed: () {
                context.read<CategoriesBloc>().add(CategoriesLoadInitiated());
                setState(() {
                  category = null;
                  subCategory = null;
                });
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

  Padding budgetIncrementIcon(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          InkWell(
            child: const Icon(
              Icons.keyboard_arrow_up_rounded,
              size: 18,
              color: kColorGrey,
            ),
            onTap: () {
              int currentValue = int.parse(controller.text);
              setState(
                () {
                  currentValue++;
                  controller
                      .setText((currentValue).toString()); // incrementing value
                },
              );
            },
          ),
          InkWell(
            child: const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: kColorGrey,
            ),
            onTap: () {
              int currentValue = int.parse(
                controller.text,
              );
              setState(
                () {
                  currentValue--;
                  controller.setText((currentValue > 0 ? currentValue : 0)
                      .toString()); // decrementing value
                },
              );
            },
          ),
        ],
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
                        initialDate:
                            startDate?.add(Duration(days: 1)) ?? DateTime.now(),
                        firstDate:
                            startDate?.add(Duration(days: 1)) ?? DateTime.now(),
                        lastDate: DateTime(2050),
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
                            onDateTimeChanged: (value) {
                              setState(() {
                                startTimeNew = value.toString();
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: CustomFormContainer(
                      hintText: startTimeNew != null
                          ? DateFormat.jm()
                              .format(DateTime.parse(startTimeNew!))
                          : startTime != null
                              ? DateFormat.jm().format(
                                  DateFormat('hh:mm:ss').parse(startTime!))
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
                            onDateTimeChanged: (value) {
                              setState(() {
                                endTimeNew = value.toString();
                              });
                            },
                          ),
                        ),
                      );
                    },
                    child: CustomFormContainer(
                      hintText: endTimeNew != null
                          ? DateFormat.jm().format(DateTime.parse(endTimeNew!))
                          : endTime != null
                              ? DateFormat.jm().format(
                                  DateFormat('hh:mm:ss').parse(endTime!))
                              : 'hh:mm:ss',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      startTime = null;
                      startTimeNew = null;
                      endTimeNew = null;
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
