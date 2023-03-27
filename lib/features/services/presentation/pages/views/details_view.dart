import 'dart:convert';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/presentation/pages/sections/detail_header_section.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final requirementController = TextEditingController();
  final problemDescController = TextEditingController();
  final budgetController = TextEditingController();

  List<String> requirementList = [];
  List<int>? imageList;
  List<int>? fileList;
  Map<String, dynamic>? map;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () async {
        final savedMap = await CacheHelper.getCachedString(kBookedMap);
        setState(() {
          map = jsonDecode(savedMap ?? '') as Map<String, dynamic>;
        });
      },
    );
  }

  @override
  void dispose() {
    requirementController.dispose();
    problemDescController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        if (state.theStates == TheStates.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.theStates == TheStates.success) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const DetailHeaderSection(),
                const Divider(),
                addVerticalSpace(
                  8,
                ),
                CustomFormField(
                  label: "Your Budget (Non negotiable)",
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: NumberIncDecField(
                      controller: budgetController,
                      onChanged: (value) async {
                        map!.update(
                          "budget_to",
                          (value) => double.parse(budgetController.text),
                          ifAbsent: () => double.parse(budgetController.text),
                        );
                        await CacheHelper.setCachedString(
                          kBookedMap,
                          jsonEncode(
                            map,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                CustomFormField(
                  label: 'Requirements',
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
                        onFieldSubmitted: (p0) async {
                          setState(() async {
                            requirementList.add(p0!);
                            map!.update(
                              "requirements",
                              (value) => requirementList,
                              ifAbsent: () => requirementList,
                            );
                            await CacheHelper.setCachedString(
                              kBookedMap,
                              jsonEncode(
                                map,
                              ),
                            );

                            requirementController.clear();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'Description',
                  isRequired: true,
                  child: CustomTextFormField(
                    maxLines: 3,
                    hintText: "Service Desciption Here",
                    controller: problemDescController,
                    validator: validateNotEmpty,
                    onChanged: (p0) async {
                      map!.update(
                        "description",
                        (value) => problemDescController.text,
                        ifAbsent: () => problemDescController.text,
                      );
                      await CacheHelper.setCachedString(
                        kBookedMap,
                        jsonEncode(
                          map,
                        ),
                      );
                    },
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
                          listener: (context, state) async {
                            if (state is ImageUploadSuccess) {
                              setState(() async {
                                imageList = List<int>.from(state.list);
                                map!.update(
                                  "images",
                                  (value) => imageList,
                                  ifAbsent: () => imageList,
                                );
                                await CacheHelper.setCachedString(
                                  kBookedMap,
                                  jsonEncode(
                                    map,
                                  ),
                                );
                              });
                            }
                          },
                          child: CustomDottedContainerStack(
                            theWidget: imageList == null
                                ? Text('Select Images')
                                : Text('Image Uploaded'),
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
                          listener: (context, state) async {
                            if (state is VideoUploadSuccess) {
                              setState(() {
                                fileList = List<int>.from(state.list);
                              });
                              map!.update(
                                "videos",
                                (value) => fileList,
                                ifAbsent: () => fileList,
                              );
                              await CacheHelper.setCachedString(
                                kBookedMap,
                                jsonEncode(
                                  map,
                                ),
                              );
                            }
                          },
                          child: CustomDottedContainerStack(
                            theWidget: fileList == null
                                ? Text('Select Videos')
                                : Text('File Uploaded'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const ErrorPage();
      },
    );
  }
}
