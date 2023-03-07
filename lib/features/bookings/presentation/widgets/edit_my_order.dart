// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EditMyOrdersForm extends StatefulWidget {
  final int selectedIndex;
  const EditMyOrdersForm({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<EditMyOrdersForm> createState() => _EditMyOrdersFormState();
}

class _EditMyOrdersFormState extends State<EditMyOrdersForm> {
  final problemDescController = TextEditingController();
  final cityController = TextEditingController();
  final locationController = TextEditingController();
  final requirementController = TextEditingController();
  final startBudgetController = TextEditingController();
  final endBudgetController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isSpecified = false;
  List<int>? imageList;
  List<int>? fileList;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];
  List<String> requirementList = [];
  late int selectedIndex;
  int? cityCode;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  void dispose() {
    problemDescController.dispose();
    cityController.dispose();
    locationController.dispose();
    requirementController.dispose();
    startBudgetController.dispose();
    endBudgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingState>(
      builder: (context, state) {
        if (state.states == TheStates.success) {
          final myBookingList = state.myBookingList?.result;
          return Padding(
            padding: kPadding10,
            child: ListView(
              children: [
                CustomFormField(
                  label: 'Description',
                  child: CustomTextFormField(
                    controller: problemDescController,
                    validator: validateNotEmpty,
                    hintText: myBookingList?[selectedIndex].description ?? '',
                  ),
                ),
                CustomFormField(
                  label: 'Requirements',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'This helps merchants to find about your requirements better.',
                        style: kHelper13,
                      ),
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
                        hintText: myBookingList?[selectedIndex]
                                .requirements
                                ?.values
                                .join(', ') ??
                            'Add requirements',
                        onFieldSubmitted: (p0) {
                          setState(() {
                            requirementList.add(p0!);
                            requirementController.clear();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'City',
                  child: BlocBuilder<CityBloc, CityState>(
                    builder: (context, cityState) {
                      String? x;
                      if (cityState is CityLoadSuccess) {
                        for (final element in cityState.list) {
                          if (element.id ==
                              myBookingList?[selectedIndex].city) {
                            x = element.name;
                          }
                        }
                        return CustomDropDownField(
                          list: List.generate(
                            cityState.list.length,
                            (index) => cityState.list[index].name,
                          ),
                          hintText: x ?? 'Enter your city',
                          onChanged: (p0) => setState(
                            () async {
                              final x = cityState.list.firstWhere(
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
                  label: 'Location',
                  child: CustomTextFormField(
                    controller: locationController,
                    hintText: myBookingList?[selectedIndex].location ?? '',
                  ),
                ),
                CustomFormField(
                  label: "Budget",
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Starting Price',
                              style: kPurpleText13,
                            ),
                            CustomTextFormField(
                              controller: startBudgetController,
                              hintText: myBookingList?[selectedIndex]
                                          .budgetFrom !=
                                      null
                                  ? "${myBookingList?[selectedIndex].budgetFrom}"
                                  : 'Add starting Price',
                            ),
                          ],
                        ),
                      ),
                      addHorizontalSpace(10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'End Price',
                              style: kPurpleText13,
                            ),
                            CustomTextFormField(
                              controller: endBudgetController,
                              hintText: myBookingList?[selectedIndex]
                                          .budgetTo !=
                                      null
                                  ? "${myBookingList?[selectedIndex].budgetTo}"
                                  : 'Add end Price',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'When do you need this done?',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Start Date',
                                  style: kPurpleText13,
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2050),
                                    ).then(
                                      (value) => setState(
                                        () {
                                          startDate = value;
                                        },
                                      ),
                                    );
                                  },
                                  child: CustomFormContainer(
                                    hintText: DateFormat.yMMMMEEEEd().format(
                                      myBookingList?[selectedIndex].startDate ??
                                          DateTime.now(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          addHorizontalSpace(10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'End Date',
                                      style: kPurpleText13,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
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
                                    hintText: DateFormat.yMMMMEEEEd().format(
                                      myBookingList?[selectedIndex].endDate ??
                                          DateTime.now(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                          await context.read<ImageUploadCubit>().uploadImage();
                        },
                        child: BlocListener<ImageUploadCubit, ImageUploadState>(
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
                          await context.read<ImageUploadCubit>().uploadVideo();
                        },
                        child: BlocListener<ImageUploadCubit, ImageUploadState>(
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
                    height: MediaQuery.of(context).size.height * 0.085,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Flexible(
                          child: CustomFormField(
                            label: 'Start Time',
                            child: CustomFormContainer(
                              hintText: startTime?.format(context) ??
                                  myBookingList?[selectedIndex]
                                      .startTime
                                      .toString() ??
                                  '',
                              callback: () async {
                                await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) => setState(
                                    () => startTime = value,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        addHorizontalSpace(10),
                        Flexible(
                          child: CustomFormField(
                            label: 'End Time',
                            child: CustomFormContainer(
                              hintText: endTime?.format(context) ??
                                  myBookingList?[selectedIndex]
                                      .endTime
                                      .toString() ??
                                  '',
                              callback: () async {
                                await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then(
                                  (value) => setState(
                                    () => endTime = value,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: isSpecified == true ? widgetList : [],
                ),
                Padding(
                  padding: kPadding20,
                  child: CustomElevatedButton(
                    callback: () {
                      final req = EditBookingReq(
                        // bookingMerchant:
                        //     data?[selectedIndex].bookingMerchant.toString(),
                        description: problemDescController.text.isNotEmpty
                            ? problemDescController.text
                            : myBookingList?[selectedIndex].description,
                        requirements: requirementList.asMap().map(
                              (key, value) => MapEntry(
                                key.toString(),
                                value as dynamic,
                              ),
                            ),
                        city: cityCode ??
                            myBookingList?[selectedIndex].city?.toInt(),
                        location: locationController.text.isNotEmpty
                            ? locationController.text
                            : myBookingList?[selectedIndex].location,
                        budgetTo: startBudgetController.text.isNotEmpty
                            ? double.parse(startBudgetController.text)
                            : myBookingList?[selectedIndex].budgetTo,
                        budgetFrom: endBudgetController.text.isNotEmpty
                            ? double.parse(endBudgetController.text)
                            : myBookingList?[selectedIndex].budgetFrom,
                        // images: imageList ?? data?[selectedIndex].images,
                        videos:
                            fileList ?? myBookingList?[selectedIndex].videos,
                        startDate: startDate ??
                            myBookingList?[selectedIndex].startDate,
                        endDate:
                            endDate ?? myBookingList?[selectedIndex].endDate,
                        // startTime: startTime?.format(context) ??
                        //     data?[selectedIndex].startTime.toString(),
                        // endTime: endTime?.format(context) ??
                        //     data?[selectedIndex].endTime.toString(),
                        createdBy:
                            myBookingList?[selectedIndex].createdBy?.user?.id ??
                                '',
                        entityService:
                            myBookingList?[selectedIndex].entityService?.id ??
                                '',
                        extraData: myBookingList?[selectedIndex].extraData
                                as Map<String, dynamic>? ??
                            {},
                        isActive: myBookingList?[selectedIndex].isActive,
                        status: "pending",
                      );

                      print(myBookingList?[selectedIndex].id);
                      print(
                        jsonEncode(req.toJson()),
                      );
                      // context.read<BookingsBloc>().add(
                      //       ServiceBookingEditInitiated(
                      //         id: data?[selectedIndex].id?.toInt() ?? 0,
                      //         req: req,
                      //       ),
                      //     );
                    },
                    label: 'Save',
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
