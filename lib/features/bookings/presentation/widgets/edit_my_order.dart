import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_pick_helper.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EditMyOrdersForm extends StatefulWidget with TheModalBottomSheet {
  final Result result;
  final bool isTask;
  final BookingsBloc bookingsBloc;

  const EditMyOrdersForm({
    super.key,
    required this.result,
    required this.isTask,
    required this.bookingsBloc,
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
  final _formKey = GlobalKey<FormState>();

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
  int? cityCode;
  XFile? imagePath;
  XFile? videoPath;

  late Result result;
  late bool isTask;
  late BookingsBloc bookingsBloc;
  final uploadBloc = locator<UploadBloc>();

  @override
  void initState() {
    result = widget.result;
    isTask = widget.isTask;
    bookingsBloc = widget.bookingsBloc;
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
    return BlocBuilder<BookingsBloc, BookingsState>(
      bloc: bookingsBloc,
      builder: (context, state) {
        return Padding(
          padding: kPadding10,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                CustomFormField(
                  label: 'Description',
                  isRequired: true,
                  child: CustomTextFormField(
                    controller: problemDescController,
                    validator: validateNotEmpty,
                    hintText: result.description ?? '',
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
                        hintText: result.requirements!.join(', '),
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
                          if (element.id == result.city) {
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
                            () {
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
                  isRequired: true,
                  child: CustomTextFormField(
                    controller: locationController,
                    hintText: result.location ?? '',
                    validator: validateNotEmpty,
                  ),
                ),
                CustomFormField(
                  label: "Budget",
                  child: Row(
                    children: [
                      //TODO: the field will have earning if its a task or price if its a service, please change form fields acc.
                      // Flexible(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //         'Starting Price',
                      //         style: kPurpleText13,
                      //       ),
                      //       CustomTextFormField(
                      //         controller: startBudgetController,
                      //         hintText: result.budgetFrom != null ? "${result.budgetFrom}" : 'Add starting Price',
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // addHorizontalSpace(10),
                      // Flexible(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //         'End Price',
                      //         style: kPurpleText13,
                      //       ),
                      //       CustomTextFormField(
                      //         controller: endBudgetController,
                      //         hintText: result.budgetTo != null ? "${result.budgetTo}" : 'Add end Price',
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
                                    hintText: DateFormat.yMMMMd().format(
                                      startDate ??
                                          result.startDate ??
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
                                    hintText: DateFormat.yMMMMd().format(
                                      endDate ??
                                          result.endDate ??
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
                CustomMultimedia(
                  bloc: uploadBloc,
                  imagePage: ImagePage.Form,
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
                                  result.startTime.toString(),
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
                                  result.endTime.toString(),
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
                      if (_formKey.currentState!.validate()) {
                        final req = EditBookingReq(
                          description: problemDescController.text.isNotEmpty
                              ? problemDescController.text
                              : result.description,
                          requirements: requirementList.isNotEmpty
                              ? requirementList
                              : result.requirements,
                          city: cityCode ?? result.city?.toInt(),
                          location: locationController.text.isNotEmpty
                              ? locationController.text
                              : result.location,
                          budgetTo: endBudgetController.text.isNotEmpty
                              ? double.parse(endBudgetController.text)
                              : double.parse(
                                  result.entityService?.budgetTo ?? '0.0'),
                          budgetFrom: startBudgetController.text.isNotEmpty
                              ? double.parse(startBudgetController.text)
                              : double.parse(
                                  result.entityService?.budgetFrom ?? '0.0'),
                          images: imageList ??
                              List.generate(result.images?.length ?? 0,
                                  (index) => result.images?[index].id),
                          videos: fileList ??
                              List.generate(result.videos?.length ?? 0,
                                  (index) => result.videos?[index].id),
                          startDate: startDate ?? result.startDate,
                          endDate: endDate ?? result.endDate,
                          startTime:
                              startTime?.format(context) ?? result.startTime,
                          endTime: endTime?.format(context) ?? result.endTime,
                          createdBy: result.createdBy?.user?.id ?? '',
                          entityService: result.entityService?.id ?? '',
                          isActive: result.isActive,
                          status: "pending",
                        );

                        bookingsBloc.add(
                          BookingEdited(
                            id: result.id!,
                            req: req,
                            isTask: isTask,
                          ),
                        );

                        Navigator.pop(context);
                      }
                    },
                    label: 'Save',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
