import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/data/models/add_service_req.dart';
import 'package:cipher/features/services/data/repositories/services_repositories.dart';
import 'package:cipher/features/services/presentation/manager/add_service/add_service_cubit.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              icon: Icon(Icons.search),
            ),
            child: Text('Add Service'),
          ),
          Divider(),
          SizedBox(
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
                          ),
                        ),
                        CustomFormField(
                          label: 'Service Description',
                          isRequired: true,
                          child: CustomTextFormField(
                            controller: descriptionController,
                            hintText: 'Trimming & Cutting',
                            maxLines: 3,
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
                          label: 'Highlights',
                          isRequired: false,
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
                                          onTap: () {},
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
                                list: [
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
                          ],
                        ),
                        addVerticalSpace(10),
                        Row(
                          children: [
                            CustomCheckBox(
                              isChecked: isNegotiable,
                              onTap: () => setState(
                                () {
                                  isNegotiable = !isNegotiable;
                                },
                              ),
                            ),
                            addHorizontalSpace(10),
                            const Text('Yes, it is negotiable.'),
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
                            Text('Add Discount'),
                          ],
                        ),
                        addVerticalSpace(10),
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
                                  list: [
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
                            Icon(
                              Icons.info_outline_rounded,
                              color: kColorSecondary,
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: Text(
                                'After 20% discount on the budget i.e. Rs 240, new budget will be Rs 960',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        addVerticalSpace(10),
                        // Row(
                        //   children: [
                        //     Flexible(
                        //       child: CustomFormField(
                        //         label: 'Start Date',
                        //         isRequired: false,
                        //         child: CustomFormContainer(
                        //           hintText: 'dd/mm/yy',
                        //           leadingWidget: Icon(
                        //             Icons.calendar_month_rounded,
                        //             color: kColorGrey,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     addHorizontalSpace(10),
                        //     Flexible(
                        //       child: CustomFormField(
                        //         label: 'End Date',
                        //         isRequired: false,
                        //         child: CustomFormContainer(
                        //           hintText: 'dd/mm/yy',
                        //           leadingWidget: Icon(
                        //             Icons.calendar_month_rounded,
                        //             color: kColorGrey,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
                        Visibility(
                          // visible: isSpecified,
                          visible: false,
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (selectedWeekDay.contains(index) ==
                                        false) {
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
                                                      initialTime:
                                                          TimeOfDay.now(),
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
                                                      initialTime:
                                                          TimeOfDay.now(),
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
                                                WeekTimeSpecifier(
                                                  weekName: 'Monday',
                                                ),
                                              );
                                              break;
                                            case 2:
                                              widgetList.add(
                                                WeekTimeSpecifier(
                                                  weekName: 'Tuesday',
                                                ),
                                              );
                                              break;
                                            case 3:
                                              widgetList.add(
                                                WeekTimeSpecifier(
                                                  weekName: 'Wednesday',
                                                ),
                                              );
                                              break;
                                            case 4:
                                              widgetList.add(
                                                WeekTimeSpecifier(
                                                  weekName: 'Thursday',
                                                ),
                                              );
                                              break;
                                            case 5:
                                              widgetList.add(
                                                WeekTimeSpecifier(
                                                  weekName: 'Friday',
                                                ),
                                              );
                                              break;
                                            case 6:
                                              widgetList.add(
                                                WeekTimeSpecifier(
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
                                              widgetList
                                                  .remove(widgetList[index]);
                                              break;
                                            case 2:
                                              widgetList
                                                  .remove(widgetList[index]);
                                              break;
                                            case 3:
                                              widgetList
                                                  .remove(widgetList[index]);
                                              break;
                                            case 4:
                                              widgetList
                                                  .remove(widgetList[index]);
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
                                      Text('Remote')
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
                                      Text('On Premise')
                                    ],
                                  ),
                                ],
                              ),
                              addVerticalSpace(5),
                              Visibility(
                                visible: isAddressVisibile,
                                child: CustomTextFormField(
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
                                        imageList = List<int>.from(state.list);
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
                        BlocConsumer<AddServiceCubit, AddServiceState>(
                          listener: (context, state) {
                            // TODO: implement listener
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              callback: () async {
                                print(321);
                                final req = AddServiceReq(
                                  title: titleController.text,
                                  description: descriptionController.text,
                                  highlights: requirementList.asMap().map(
                                        (key, value) => MapEntry(
                                          key.toString(),
                                          value as dynamic,
                                        ),
                                      ),
                                  // budgetType: budgetType,
                                  // budgetFrom: int.parse(
                                  //   startPriceController.text,
                                  // ),
                                  // budgetTo: int.parse(
                                  //   endPriceController.text.isEmpty
                                  //       ? startPriceController.text
                                  //       : endPriceController.text,
                                  // ),
                                  // startDate: startDate ?? DateTime.now(),
                                  // endDate: endDate,
                                  // startTime: startTime?.format(context),
                                  // endTime: endTime?.format(context),
                                  // shareLocation: true,
                                  // isNegotiable: true,
                                  // location: addressController.text,
                                  // revisions: 0,
                                  // avatar: 2,
                                  // isProfessional: true,
                                  // isOnline: true,
                                  // isRequested: true,
                                  // discountType: "Percentage",
                                  // discountValue: 0,
                                  // extraData: {},
                                  // noOfReservation: 2147483647,
                                  // isActive: true,
                                  // needsApproval: true,
                                  // isEndorsed: true,
                                  // service: categoryId,
                                  // event: "",
                                  // city: cityCode,
                                  // currency: currencyCode,
                                  // images: imageList,
                                  // videos: fileList,
                                );

                                print(123);

                                // await ServicesRepositories()
                                //     .addEntityService(req);

                                // print(req);
                                // context.read<AddServiceCubit>().addService(req);
                              },
                              label: 'Next',
                            );
                          },
                        ),
                        // addVerticalSpace(10),
                        // CustomElevatedButton(
                        //   mainColor: Colors.white,
                        //   textColor: kColorPrimary,
                        //   callback: () {},
                        //   label: 'Cancel',
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
