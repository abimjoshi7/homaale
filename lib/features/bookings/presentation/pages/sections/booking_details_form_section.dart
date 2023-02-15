import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';

class BookingDetailsFormSection extends StatefulWidget {
  const BookingDetailsFormSection({
    super.key,
  });

  @override
  State<BookingDetailsFormSection> createState() =>
      _BookingDetailsFormSectionState();
}

class _BookingDetailsFormSectionState extends State<BookingDetailsFormSection> {
  final _key = GlobalKey<FormState>();
  final problemDescController = TextEditingController();
  final tagController = TextfieldTagsController();
  List<int>? imageList;
  List<int>? fileList;
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isSpecified = false;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];

  @override
  void dispose() {
    problemDescController.dispose();
    tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleEntityServiceCubit, SingleEntityServiceState>(
      builder: (context, state) {
        if (state is SingleEntityServiceLoadSuccess) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _key,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomFormField(
                            label: 'Problem Description',
                            isRequired: true,
                            child: CustomTextFormField(
                              controller: problemDescController,
                              validator: validateNotEmpty,
                            ),
                          ),
                          CustomFormField(
                            label: 'Requirements',
                            isRequired: false,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'This helps merchants to find about your requirements better.',
                                  style: kHelper13,
                                ),
                                addVerticalSpace(10),
                                CustomTagTextField(
                                  tagController: tagController,
                                ),
                              ],
                            ),
                          ),
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
                          CustomFormField(
                            label: 'When do you need this done?',
                            isRequired: true,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Start Date',
                                            style: kPurpleText12,
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
                                              hintText:
                                                  '${startDate?.year ?? 'yy'}-${startDate?.month ?? 'mm'}-${startDate?.day ?? 'dd'}',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    addHorizontalSpace(10),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'End Date',
                                            style: kPurpleText12,
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
                                              hintText:
                                                  '${endDate?.year ?? 'yy'}-${endDate?.month ?? 'mm'}-${endDate?.day ?? 'dd'}',
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BlocListener<BookingsBloc, BookingsState>(
                listener: (context, state) {
                  if (state is BookEntityServiceAddSuccess) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content:
                            'Your booking completed successfully. Please wait for approval',
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
                  if (state is BookEntityServiceAddFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Error',
                        content: 'Cannot be booked. Please try again',
                        onTap: () {},
                        isSuccess: false,
                      ),
                    );
                  }
                },
                child: PriceBookFooterSection(
                  onPressed: () async {
                    if (_key.currentState!.validate() &&
                        startDate != null &&
                        endDate != null &&
                        startDate!.isBefore(endDate!)) {
                      final req = BookEntityServiceReq(
                        endDate: endDate,
                        startDate: startDate,
                        videos: fileList,
                        images: imageList,
                        requirements: tagController.getTags!.asMap().map(
                              (key, value) => MapEntry(
                                key.toString(),
                                value as dynamic,
                              ),
                            ),
                        description: problemDescController.text,
                        budgetFrom: state.result.budgetFrom?.toInt(),
                        budgetTo: state.result.budgetTo?.toInt(),
                        startTime: startTime?.format(context),
                        endTime: endTime?.format(context),
                        entityService: state.result.id,
                        location: state.result.location,
                        city: state.result.city?.id?.toInt(),
                      );
                      context.read<BookingsBloc>().add(
                            EntityServiceBookingInitiated(req),
                          );
                    } else {
                      await showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Error',
                          content: 'Please verify dates',
                          onTap: () {},
                          isSuccess: false,
                        ),
                      );
                    }
                  },
                  price: 'Rs. ${state.result.budgetTo}',
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
