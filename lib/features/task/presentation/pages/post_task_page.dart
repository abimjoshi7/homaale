import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostTaskPage extends StatefulWidget {
  static const routeName = '/post-task-page';
  const PostTaskPage({super.key});

  @override
  State<PostTaskPage> createState() => _PostTaskPageState();
}

class _PostTaskPageState extends State<PostTaskPage> {
  String? priceType;
  final controller = TextEditingController();
  bool isDiscounted = false;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  bool isSpecified = false;
  List<int> selectedWeekDay = [];
  List<Widget> widgetList = [];
  List<int>? imageList;
  List<int>? fileList;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text('Post a Task'),
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
                          label: 'Title',
                          isRequired: true,
                          child: CustomTextFormField(
                            hintText: 'Need a Garden Cleaner',
                          ),
                        ),
                        CustomFormField(
                          label: 'Task Description',
                          child: CustomTextFormField(
                            hintText: 'Describe your requirements in few words',
                            maxLines: 3,
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Requirements',
                          child: CustomTextFormField(
                            hintText: 'Add requirements',
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Category',
                          child: CustomTextFormField(
                            hintText: 'Trimming & Cutting',
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Select Task Type',
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Radio<String>(
                                    value: 'Remote',
                                    groupValue: priceType,
                                    onChanged: (value) => setState(
                                      () {
                                        priceType = value;
                                      },
                                    ),
                                  ),
                                  Text('Remote'),
                                  addHorizontalSpace(10),
                                  Radio<String>(
                                    value: 'On premise',
                                    groupValue: priceType,
                                    onChanged: (value) => setState(
                                      () {
                                        priceType = value;
                                      },
                                    ),
                                  ),
                                  Text('On premise'),
                                ],
                              )
                            ],
                          ),
                          isRequired: true,
                        ),
                        CustomFormField(
                          label: 'Budget',
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
                                      },
                                    ),
                                  ),
                                  Text('Fixed'),
                                  addHorizontalSpace(10),
                                  Radio<String>(
                                    value: 'Variable',
                                    groupValue: priceType,
                                    onChanged: (value) => setState(
                                      () {
                                        priceType = value;
                                      },
                                    ),
                                  ),
                                  Text('Variable'),
                                ],
                              )
                            ],
                          ),
                          isRequired: true,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: NumberIncDecField(
                                controller: controller,
                              ),
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: CustomDropDownField(
                                list: ['Per Project'],
                                hintText: 'Per project',
                                onChanged: (value) {},
                              ),
                            ),
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
                            Text('Yes, it is negotiable.'),
                          ],
                        ),
                        addVerticalSpace(10),
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
                        addVerticalSpace(10),
                        CustomFormField(
                          label: 'Date',
                          child: CustomFormContainer(
                            hintText: 'dd/mm/yy',
                            leadingWidget: Icon(
                              Icons.calendar_month_rounded,
                              color: kColorGrey,
                            ),
                          ),
                          isRequired: false,
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
                        ),
                        addVerticalSpace(10),
                        Row(
                          children: [
                            CustomCheckBox(
                              onTap: () {},
                            ),
                            addHorizontalSpace(10),
                            Flexible(
                              child: Text(
                                'Accept all Terms and Conditions.',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          callback: () {},
                          label: 'Next',
                        ),
                        addVerticalSpace(10),
                        CustomElevatedButton(
                          mainColor: Colors.white,
                          textColor: kColorPrimary,
                          callback: () {},
                          label: 'Cancel',
                        ),
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
