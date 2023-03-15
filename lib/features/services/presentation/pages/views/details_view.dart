import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
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

  @override
  void dispose() {
    requirementController.dispose();
    problemDescController.dispose();
    budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomFormField(
            label: 'Service Details',
            child: Wrap(
              direction: Axis.vertical,
              spacing: 8,
              children: [
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Category:",
                      ),
                    ),
                    const Text("Gardening")
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Title:",
                      ),
                    ),
                    const Text("Need a garden cleaner")
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Pricing:",
                      ),
                    ),
                    const Text("Rs 1200 per hour")
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Date:",
                      ),
                    ),
                    const Text("3 Dec")
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Time:",
                      ),
                    ),
                    const Text("6:30 AM to 7:30 AM")
                  ],
                ),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const Text(
                        "Address:",
                      ),
                    ),
                    const Text("Buddhanagar, Kathmandu")
                  ],
                ),
              ],
            ),
          ),
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
            label: 'Description',
            isRequired: true,
            child: CustomTextFormField(
              maxLines: 3,
              hintText: "Service Desciption Here",
              controller: problemDescController,
              validator: validateNotEmpty,
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
                      label:
                          fileList == null ? 'Select Videos' : 'File Uploaded',
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
}
