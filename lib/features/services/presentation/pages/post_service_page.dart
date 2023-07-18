// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/core/helpers/upload_helper.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/locator.dart';
import 'package:dependencies/dependencies.dart';
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
import 'package:flutter/services.dart';

class PostServicePage extends StatefulWidget {
  static const routeName = '/add-service-page';
  const PostServicePage({super.key});

  @override
  State<PostServicePage> createState() => _PostServicePageState();
}

class _PostServicePageState extends State<PostServicePage> {
  final startPriceController = TextEditingController();
  final endPriceController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final requirementController = TextEditingController();
  final addressController = TextEditingController();
  final discountController = TextEditingController();
  //validation controllers
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  //
  String? dateType = 'Fixed';
  String? priceType = 'Fixed';
  String? serviceType = 'On Premise';
  String? budgetType = 'Project';
  String? currencyCode;
  bool isDiscounted = false;
  bool isSpecified = true;
  bool isAddressVisibile = true;
  bool isBudgetVariable = false;
  bool isCustomDate = false;
  bool isTermsAccepted = false;
  bool isNegotiable = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];
  List<String> requirementList = [];
  List<XFile?>? imagePathList;
  List<int>? imageList;
  List<int>? fileList;
  DateTime? startDate;
  DateTime? endDate;
  int? cityCode;
  int? budgetTo;
  int? budgetFrom;
  final _key = GlobalKey<FormState>();
  final UploadBloc uploadBloc = locator<UploadBloc>();

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
    discountController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  // Future<void> _uploadFile() async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (context) => Center(
  //       child: CustomLoader(),
  //     ),
  //   );
  //   // if (uploadBloc.state.isFileUploaded) return;
  //   if (uploadBloc.state.imageFileList.isNotEmpty) {
  //     uploadBloc.add(
  //       ImageToFilestoreUploaded(
  //         list: uploadBloc.state.imageFileList,
  //       ),
  //     );
  //   }
  //   if (uploadBloc.state.videoFileList.isNotEmpty) {
  //     uploadBloc.add(
  //       VideoToFilestoreUploaded(
  //         list: uploadBloc.state.videoFileList,
  //       ),
  //     );
  //   }

  //   if (uploadBloc.state.uploadedImageList.isNotEmpty) return;
  //   if (uploadBloc.state.uploadedImageList.isEmpty) _uploadFile();

  //   // await Future.delayed(
  //   //   Duration(
  //   //     seconds: 15,
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          appBarTitle: "Post a service", trailingWidget: SizedBox()),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _key,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16.0,
                      ),
                      child: Column(
                        children: [
                          addVerticalSpace(10.0),
                          _buildTitle(),
                          addVerticalSpace(10.0),
                          _buildCategory(),
                          addVerticalSpace(10.0),
                          _buildHighlights(),
                          addVerticalSpace(10.0),
                          _buildServiceType(),
                          _buildAddress(),
                          addVerticalSpace(10.0),
                          _buildCity(),
                          addVerticalSpace(10.0),
                          _buildDescription(),
                          addVerticalSpace(10.0),
                          _buildCurrency(),
                          _buildBudget(),
                          _buildIsNegotiable(),
                          _buildDialog(),
                          addVerticalSpace(10.0),
                          CustomMultimedia(
                            bloc: uploadBloc,
                          ),
                          addVerticalSpace(10.0),
                          _buildTerms(context),
                          addVerticalSpace(10.0),
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

  Visibility _buildAddress() {
    return Visibility(
      visible: isAddressVisibile,
      child: CustomFormField(
        label: "Address Information",
        isRequired: true,
        child: CustomTextFormField(
          validator: validateNotEmpty,
          controller: addressController,
          hintText: "Enter your address details",
        ),
      ),
    );
  }

  BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState> _buildButton() {
    return BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
      listener: (context, state) {
        if (state.theStates == TheStates.success && state.isCreated == true) {
          showDialog(
            barrierDismissible: false,
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
            barrierDismissible: false,
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
        if (state.theStates == TheStates.loading) {
          return CustomLoader();
        }
        final upload = UploadHelper(bloc: uploadBloc, context: context);

        return BlocListener<UploadBloc, UploadState>(
          bloc: uploadBloc,
          listenWhen: (previous, current) {
            if (previous.isImageUploaded != true &&
                current.isImageUploaded == true) return true;
            if (previous.isVideoUploaded != true &&
                current.isVideoUploaded == true) return true;
            return false;
          },
          listener: (context, state) {
            if (state.isImageUploaded && state.isVideoUploaded) {
              final req = TaskEntityServiceReq(
                // owner:
                //     context.read<UserBloc>().state.taskerProfile?.user?.id,
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
                startDate: null,
                endDate: null,
                startTime: null,
                endTime: null,
                shareLocation: true,
                isNegotiable: isNegotiable,
                location: addressController.text,
                revisions: 0,
                avatar: 2,
                isProfessional: true,
                isOnline: !isAddressVisibile,
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
                isRange: isBudgetVariable,
              );

              context.read<TaskEntityServiceBloc>().add(
                    TaskEntityServiceCreated(
                      req: req,
                    ),
                  );
            }
          },
          child: CustomElevatedButton(
            callback: () async {
              if (context.read<CategoriesBloc>().state.serviceId != null) {
                if (isTermsAccepted) {
                  if (_key.currentState!.validate() &&
                      endPriceController.text.isNotEmpty) {
                    if (uploadBloc.state.imageFileList.length != 0 ||
                        uploadBloc.state.videoFileList.length != 0) {
                      await upload
                        ..uploadImage()
                        ..uploadVideo();
                    } else {
                      final req = TaskEntityServiceReq(
                        // owner:
                        //     context.read<UserBloc>().state.taskerProfile?.user?.id,
                        title: titleController.text,
                        description: descriptionController.text,
                        highlights: requirementList,
                        budgetType: budgetType,
                        budgetFrom: startPriceController.text.length == 0
                            ? null
                            : double.parse(
                                startPriceController.text,
                              ),
                        budgetTo: double.parse(
                          endPriceController.text,
                        ),
                        startDate: null,
                        endDate: null,
                        startTime: null,
                        endTime: null,
                        shareLocation: true,
                        isNegotiable: isNegotiable,
                        location: addressController.text,
                        revisions: 0,
                        avatar: 2,
                        isProfessional: true,
                        isOnline: !isAddressVisibile,
                        isRequested: false,
                        discountType: "Percentage",
                        discountValue: discountController.text.isNotEmpty
                            ? discountController.text
                            : '0.0',
                        noOfReservation: 0,
                        isRange: isBudgetVariable,
                        isActive: true,
                        needsApproval: true,
                        isEndorsed: true,
                        service: context.read<CategoriesBloc>().state.serviceId,
                        event: "",
                        city: cityCode ?? int.parse(kCityCode),
                        currency: currencyCode ?? kCurrencyCode,
                        images: [],
                        videos: [],
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
          ),
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
        addVerticalSpace(10.0),
      ],
    );
  }

  Column _buildBudget() {
    return Column(
      children: [
        CustomFormField(
          label: 'Price',
          isRequired: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildPriceRadio(),
            ],
          ),
        ),
        addVerticalSpace(10.0),
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
                  validator: (p0) {
                    if (!isBudgetVariable) return null;
                    if (p0 == null || p0.isEmpty) {
                      return "Required Field";
                    }
                    if (p0.isEmpty) return null;
                    if (int.parse(p0) < 10) {
                      return "Budget Cannot Be Less Than 10";
                    }
                    if (p0 == endPriceController.text) {
                      return "Invalid Range";
                    }
                    if (endPriceController.text.isNotEmpty) {
                      if (int.parse(p0) > int.parse(endPriceController.text)) {
                        return "Cannot be more than End budget";
                      }
                    }
                    return null;
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: startPriceController,
                  style: Theme.of(context).textTheme.displayLarge,
                  onChanged: (value) => setState(
                    () {
                      if (startPriceController.text.isNotEmpty)
                        budgetFrom = getPayableAmount(
                          double.parse(startPriceController.text),
                          double.parse(
                              context.read<CategoriesBloc>().state.commission ??
                                  "0.0"),
                        );
                      print(budgetFrom);
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
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Required Field";
                  }
                  if (p0.isEmpty) ;
                  if (int.parse(p0) < 10) {
                    return "Budget Cannot Be Less Than 10";
                  }
                  if (isBudgetVariable &&
                      startPriceController.text.isNotEmpty) {
                    if (p0 == startPriceController.text) {
                      return "Invalid Range";
                    }
                    if (int.parse(p0) < int.parse(startPriceController.text)) {
                      return "Cannot be less than Start budget";
                    }
                  }

                  return null;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: endPriceController,
                style: Theme.of(context).textTheme.displayLarge,
                onChanged: (value) => setState(
                  () {
                    if (endPriceController.text.isNotEmpty)
                      budgetTo = getPayableAmount(
                        double.parse(endPriceController.text),
                        double.parse(
                            context.read<CategoriesBloc>().state.commission ??
                                "0"),
                      );
                  },
                ),
                suffixWidget: budgetIncrementIcon(endPriceController),
              ),
            ),
            Flexible(
              flex: isBudgetVariable ? 1 : 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CustomDropDownField(
                  initialValue: 'Project',
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

  Row _buildPriceRadio() {
    return Row(
      children: [
        Radio<String>(
          value: 'Fixed',
          groupValue: priceType,
          onChanged: (value) => setState(
            () {
              priceType = value;
              isBudgetVariable = false;
              // startPriceController.clear();
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
    );
  }

  Padding budgetIncrementIcon(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5.0,
      ),
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
        ],
      ),
    );
  }

  CustomFormField _buildHighlights() {
    return CustomFormField(
      label: 'Highlights',
      isRequired: true,
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
            hintText: 'Add Highlights',
            inputAction: TextInputAction.next,
            validator: (value) => requirementList.length == 0
                ? "Atleast 1 Highlight Required"
                : null,
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
                  },
                ),
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
                      onRemovePressed: () {
                        context.read<CategoriesBloc>().add(
                              CategoriesLoadInitiated(),
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
        controller: titleController,
        hintText: 'Enter your service name',
        validator: validateNotEmpty,
      ),
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
}
