// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/core/image_picker/video_picker_dialog.dart';
import 'package:cipher/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:cipher/features/content_client/presentation/pages/terms_of_use.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task_entity_service/data/models/req/task_entity_service_req.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';

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
  String? serviceId;
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
  late final ImageUploadCubit imageCubit;
  late final CategoriesBloc categoriesBloc;

  @override
  void initState() {
    imageCubit = locator<ImageUploadCubit>();
    categoriesBloc = locator<CategoriesBloc>()
      ..add(
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
    discountController.dispose();
    imageCubit.close();
    categoriesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(appBarTitle: "Post a service"),
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
                          CustomFormField(
                            label: 'Title',
                            isRequired: true,
                            child: CustomTextFormField(
                              controller: titleController,
                              hintText: 'Enter your service name',
                              validator: validateNotEmpty,
                            ),
                          ),
                          TheCategoriesDropdown(
                            categoriesBloc: categoriesBloc,
                            onChanged: (value) {
                              categoriesBloc.state.categoryList?.forEach(
                                (element) {
                                  if (value == element.name) {
                                    categoriesBloc.add(
                                      TaskSubCategoryLoaded(
                                        categoryId: element.id,
                                        categoryName: element.name,
                                      ),
                                    );
                                    setState(
                                      () {
                                        serviceId = element.id.toString();
                                      },
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          CustomFormField(
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
                                            requirementList.add(
                                                requirementController.text);
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
                          ),
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
                                  return DropdownSearch(
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
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5),
                                        hintText: 'Enter Your City',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xffDEE2E6)),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      baseStyle:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    clearButtonProps: ClearButtonProps(
                                      padding: EdgeInsets.zero,
                                      iconSize: 16,
                                      visualDensity: VisualDensity.compact,
                                      alignment: Alignment.centerRight,
                                      isVisible: true,
                                      color: cityCode == null
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    popupProps: PopupProps.modalBottomSheet(
                                      showSearchBox: true,
                                      modalBottomSheetProps:
                                          ModalBottomSheetProps(
                                        backgroundColor:
                                            Theme.of(context).cardColor,
                                        useSafeArea: false,
                                      ),
                                    ),
                                  );
                                }
                                return SizedBox.shrink();
                              },
                            ),
                          ),
                          CustomFormField(
                            label: 'Description',
                            isRequired: true,
                            child: CustomTextFormField(
                              controller: descriptionController,
                              hintText: 'Provide additional description',
                              maxLines: 3,
                              validator: validateNotEmpty,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              CustomFormField(
                                label: 'Currency',
                                isRequired: true,
                                child: BlocBuilder<CurrencyBloc, CurrencyState>(
                                  builder: (context, state) {
                                    if (state is CurrencyLoadSuccess) {
                                      return DropdownSearch(
                                        items: List.generate(
                                          state.currencyListRes.length,
                                          (index) =>
                                              state.currencyListRes[index].name,
                                        ),
                                        onChanged: (p0) => setState(
                                          () {
                                            final x = state.currencyListRes
                                                .firstWhere(
                                              (element) => p0 == element.name,
                                            );
                                            currencyCode = x.code;
                                          },
                                        ),
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(5),
                                            hintText: 'Enter Your Currency',
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Color(0xffDEE2E6)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: kColorSecondary,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                            ),
                                          ),
                                          baseStyle: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        clearButtonProps: ClearButtonProps(
                                          padding: EdgeInsets.zero,
                                          iconSize: 16,
                                          visualDensity: VisualDensity.compact,
                                          alignment: Alignment.centerRight,
                                          isVisible: true,
                                          color: currencyCode == null
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        popupProps: PopupProps.modalBottomSheet(
                                          showSearchBox: true,
                                          modalBottomSheetProps:
                                              ModalBottomSheetProps(
                                            backgroundColor:
                                                Theme.of(context).cardColor,
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
                          ),
                          Column(
                            children: [
                              CustomFormField(
                                label: 'Images',
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.info_outline,
                                          color: Colors.orange,
                                        ),
                                        addHorizontalSpace(5),
                                        const Text(
                                          kImageLimit,
                                          // style: kHelper13,
                                        ),
                                      ],
                                    ),
                                    addVerticalSpace(5),
                                    InkWell(
                                      onTap: () async {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              ImagePickerDialog(
                                            uploadCubit: imageCubit,
                                          ),
                                        );
                                      },
                                      child: BlocConsumer<ImageUploadCubit,
                                          ImageUploadState>(
                                        bloc: imageCubit,
                                        listener: (context, state) {
                                          if (state is ImageUploadSuccess) {
                                            setState(() {
                                              imageList =
                                                  List<int>.from(state.list);
                                            });
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is ImageUploadSuccess) {
                                            final fileList = List.generate(
                                              state.imagePathList?.length ?? 0,
                                              (index) => File(state
                                                      .imagePathList?[index]
                                                      ?.path ??
                                                  ""),
                                            );
                                            return Container(
                                              width: double.infinity,
                                              height: 100,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: fileList.length,
                                                itemBuilder: (context, index) =>
                                                    Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 4,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                    child: Image.file(
                                                      fileList[index],
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }

                                          if (state is ImageUploadInitial) {
                                            return CustomDottedContainerStack(
                                              theWidget: imageList == null
                                                  ? Text('Select Images')
                                                  : Text('Image Uploaded'),
                                            );
                                          }

                                          return SizedBox.shrink();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomFormField(
                                label: 'Videos',
                                child: InkWell(
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => VideoPickerDialog(
                                        uploadCubit: imageCubit,
                                      ),
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
                              ),
                            ],
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
                                        'You have successfully created a service',
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
                                  if (isTermsAccepted) {
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
                                        discountValue: discountController
                                                .text.isNotEmpty
                                            ? num.parse(discountController.text)
                                            : 0,
                                        extraData: [],
                                        noOfReservation: 0,
                                        isActive: true,
                                        needsApproval: true,
                                        isEndorsed: true,
                                        service: serviceId,
                                        event: "",
                                        city: cityCode ?? int.parse(kCityCode),
                                        currency: currencyCode ?? "NPR",
                                        images: imageList ?? [],
                                        videos: fileList ?? [],
                                      );

                                      context.read<TaskEntityServiceBloc>().add(
                                            TaskEntityServiceCreated(
                                              req: req,
                                            ),
                                          );
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
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CustomToast(
                                        heading: "Failure",
                                        content:
                                            "Please accept the terms and condititons",
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
