import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/documents/data/models/tasker_portfolio_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AddPortfolio extends StatefulWidget with TheModalBottomSheet {
  const AddPortfolio({super.key});
  static const routeName = '/add-portfolio';

  @override
  State<AddPortfolio> createState() => _AddPortfolioState();
}

class _AddPortfolioState extends State<AddPortfolio> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final issuedDateController = TextEditingController();
  final credentialUrlController = TextEditingController();
  DateTime? issuedDate;
  final _key = GlobalKey<FormState>();
  final imageCubit = locator<ImageUploadCubit>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    issuedDateController.dispose();
    credentialUrlController.dispose();
    locator.resetLazySingleton(
      instance: imageCubit,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<ImageUploadCubit, ImageUploadState>(
          listener: (context, state) {
            if (state is ImageUploadSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Uploaded successfully'),
                ),
              );
            } else if (state is ImageUploadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Upload failed. Please try again.'),
                ),
              );
            }
          },
          builder: (context, state) {
            Widget displayImage() {
              if (state is ImageUploadSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check_circle_outline),
                    kWidth5,
                    Text("Image upload successful"),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images.png'),
                    kHeight5,
                    const Text(
                      'Upload or Browse image',
                    ),
                    kHeight10,
                    const Text(
                      'Maximum Image Size 20 MB',
                      style: kHelper13,
                    )
                  ],
                );
              }
            }

            Widget displayFile() {
              if (state is FileUploadSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check_circle_outline),
                    kWidth20,
                    Text("File upload successful"),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/qwe.png'),
                    kHeight20,
                    const Text(
                      'Upload or Browse file',
                    ),
                    kHeight10,
                    const Text(
                      'Maximum file Size 20 MB',
                      style: kHelper13,
                    ),
                  ],
                );
              }
            }

            return Column(
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
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  child: const Text(
                    'Add Portfolio',
                  ),
                ),
                const CustomHorizontalDivider(),
                Form(
                  key: _key,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormField(
                          label: 'Title',
                          isRequired: true,
                          child: CustomTextFormField(
                            hintText: 'Please enter the title',
                            onSaved: (p0) {
                              setState(() {
                                titleController.text = p0!;
                              });
                            },
                            validator: validateNotEmpty,
                          ),
                        ),
                        CustomFormField(
                          label: 'Description',
                          isRequired: true,
                          child: CustomTextFormField(
                            maxLines: 3,
                            hintText: 'Write something...',
                            onSaved: (p0) {
                              setState(
                                () {
                                  descriptionController.text = p0!;
                                },
                              );
                            },
                            validator: validateNotEmpty,
                          ),
                        ),
                        CustomFormField(
                          label: 'Issued Date',
                          isRequired: true,
                          child: InkWell(
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2012),
                                lastDate: DateTime(2050),
                              ).then((value) {
                                setState(() {
                                  issuedDate = value;
                                });
                              });
                            },
                            child: CustomFormContainer(
                              hintText:
                                  issuedDate?.toString().substring(0, 10) ??
                                      '1999-03-06',
                              leadingWidget: const Icon(
                                Icons.calendar_month_rounded,
                                color: kColorPrimary,
                              ),
                            ),
                          ),
                        ),
                        CustomFormField(
                          label: 'Portfolio URL',
                          isRequired: true,
                          child: CustomTextFormField(
                            hintText: 'URL',
                            onSaved: (p0) {
                              setState(() {
                                credentialUrlController.text = p0!;
                              });
                            },
                            validator: validateNotEmpty,
                          ),
                        ),
                        CustomFormField(
                          label: 'Gallery',
                          isRequired: true,
                          child: InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) => ImagePickerDialog(
                                  uploadCubit: imageCubit,
                                ),
                              );
                            },
                            child: SizedBox(
                              height: 150,
                              child: Card(
                                child: Center(
                                  child: displayImage(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomFormField(
                          label: 'Files',
                          isRequired: true,
                          child: InkWell(
                            onTap: () async {
                              await context
                                  .read<ImageUploadCubit>()
                                  .uploadFile();
                            },
                            child: SizedBox(
                              height: 150,
                              child: Card(
                                child: Center(
                                  child: displayFile(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BlocConsumer<TaskerPortfolioCubit, TaskerPortfolioState>(
                  listener: (context, state2) async {
                    final error = await CacheHelper.getCachedString(kErrorLog);
                    if (state2 is TaskerAddPortfolioSuccess) {
                      if (!mounted) return;
                      await showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Success',
                          content: 'Portfolio created successfully',
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            Root.routeName,
                            (route) => false,
                          ),
                          isSuccess: true,
                        ),
                      );
                    } else if (state2 is TaskerAddPortfolioFailure) {
                      if (!mounted) return;
                      await showDialog(
                        context: context,
                        builder: (context) => CustomToast(
                          heading: 'Failure',
                          content: error ?? "Portfolio couldn't be created",
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            Root.routeName,
                            (route) => false,
                          ),
                          isSuccess: false,
                        ),
                      );
                    }
                  },
                  builder: (context, state2) {
                    return Center(
                      child: CustomElevatedButton(
                        callback: () async {
                          if (_key.currentState!.validate()) {
                            if (state is ImageUploadSuccess) {
                              _key.currentState!.save();
                              final taskerPortfolioReq = TaskerPortfolioReq(
                                title: titleController.text,
                                description: descriptionController.text,
                                issuedDate: issuedDate ?? DateTime.now(),
                                credentialUrl:
                                    'https://${credentialUrlController.text}',
                                files: [],
                                images: List<int>.from(state.list),
                              );

                              await context
                                  .read<TaskerPortfolioCubit>()
                                  .addPortfolio(
                                    taskerPortfolioReq,
                                  );
                            }
                          }
                        },
                        label: 'Add',
                      ),
                    );
                  },
                ),
                kHeight50
              ],
            );
          },
        ),
      ),
    );
  }
}
