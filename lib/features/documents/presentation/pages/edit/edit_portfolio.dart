import 'dart:io';

import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/image_picker/image_picker_dialog.dart';
import 'package:cipher/features/documents/data/models/tasker_portfolio_req.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/user/data/models/tasker_profile.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EditPortfolio extends StatefulWidget {
  static const routeName = "/edit-portfolio";
  const EditPortfolio({super.key});

  @override
  State<EditPortfolio> createState() => _EditPortfolioState();
}

class _EditPortfolioState extends State<EditPortfolio> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final issuedDateController = TextEditingController();
  final credentialUrlController = TextEditingController();
  DateTime? issuedDate;
  Portfolio? portfolio;
  late String? imagePath;
  final imageCubit = locator<ImageUploadCubit>();
  final uploadBloc = locator<UploadBloc>();
  List<String> imageList1 = <String>[];
  File? file;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    issuedDateController.dispose();
    credentialUrlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskerPortfolioCubit, TaskerPortfolioState>(
      listener: (context, portfolioState) async {
        final error = await CacheHelper.getCachedString(kErrorLog);
        if (portfolioState.isEdited) {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Portfolio edited successfully',
              onTap: () async {
                if (!mounted) return;
                Navigator.pop(context);
              },
              isSuccess: true,
            ),
          ).then(
            (value) => context.read<TaskerPortfolioCubit>().getPortfolio(),
          );
        }
        if (!portfolioState.isEdited) {
          if (!mounted) return;
          await showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Failure',
              content: error ?? "Portfolio cannot be updated",
              onTap: () async {},
              isSuccess: false,
            ),
          ).then(
            (value) async =>
                context.read<TaskerPortfolioCubit>().getPortfolio(),
          );
        }
      },
      builder: (context, portfolioState) {
        if (portfolioState.taskerPortfolioList.isNotEmpty) {
          return Scaffold(
            appBar: CustomAppBar(appBarTitle: "Edit Portfolio"),
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
                  for (final x in portfolioState.taskerPortfolioList) {
                    if (x.id == portfolioState.taskerPortfolio.id) {
                      portfolio = x;
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
                          // Image.asset('assets/qwe.png'),
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

                  return BlocBuilder<TaskerPortfolioCubit,
                      TaskerPortfolioState>(
                    builder: (context, tpState) {
                      if (tpState.taskerPortfolio.id != null)
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTitle(),
                              _buildDescription(),
                              _buildIssuedDate(context),
                              _buildPortfolioUrl(),
                              _buildGallery(
                                tpState,
                              ),
                              _buildFiles(displayFile),
                              _buildButton(state, context, portfolioState),
                            ],
                          ),
                        );
                      return CommonErrorContainer();
                    },
                  );
                },
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  CustomFormField _buildTitle() {
    return CustomFormField(
      label: 'Title',
      isRequired: true,
      child: CustomTextFormField(
        hintText: titleController.text.isNotEmpty
            ? titleController.text
            : portfolio?.title ?? 'Please enter the title',
        onChanged: (p0) {
          setState(
            () {
              titleController.text = p0!;
            },
          );
        },
        validator: validateNotEmpty,
      ),
    );
  }

  CustomFormField _buildDescription() {
    return CustomFormField(
      label: 'Description',
      isRequired: true,
      child: CustomTextFormField(
        maxLines: 3,
        hintText: descriptionController.text.isNotEmpty
            ? descriptionController.text
            : portfolio?.description ?? 'Write something...',
        onChanged: (p0) {
          setState(
            () {
              descriptionController.text = p0!;
            },
          );
        },
        validator: validateNotEmpty,
      ),
    );
  }

  CustomFormField _buildIssuedDate(BuildContext context) {
    return CustomFormField(
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
          hintText: issuedDate?.toString().substring(0, 10) ??
              portfolio?.issuedDate.toString().substring(0, 10) ??
              '1999-03-06',
          leadingWidget: const Icon(
            Icons.calendar_month_rounded,
            color: kColorPrimary,
          ),
        ),
      ),
    );
  }

  CustomFormField _buildPortfolioUrl() {
    return CustomFormField(
      label: 'Portfolio URL',
      isRequired: true,
      child: CustomTextFormField(
        hintText: portfolio?.credentialUrl ?? 'URL',
        onChanged: (p0) {
          setState(() {
            credentialUrlController.text = p0!;
          });
        },
        validator: validateNotEmpty,
      ),
    );
  }

  Widget _buildGallery(TaskerPortfolioState state) {
    if (state.taskerPortfolio.images!.isNotEmpty) {
      List<String> fileList = List.generate(
        state.taskerPortfolio.images?.length ?? 0,
        (index) => state.taskerPortfolio.images![index].media!,
      );
      imageList1.addAll(fileList);
      // var imageList = [...uploadBloc.state.imageFileList, ...fileList];
      return SizedBox(
        height: 140,
        child: CustomFormField(
          label: "Gallery",
          rightSection: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ImagePickerDialog(
                  bloc: uploadBloc,
                ),
              );
            },
            child: Text(
              "Add+",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          child: SizedBox(
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: imageList1.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        imageList1[index],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            // ! TODO
            // child: Image.network(
            //   portfolio?.images?[0]['media'].toString() ??
            //       kNoImageNImg,
            //   fit: BoxFit.cover,
            // ),
          ),
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

  CustomFormField _buildFiles(Widget displayFile()) {
    return CustomFormField(
      label: 'Files',
      isRequired: true,
      child: InkWell(
        onTap: () async {
          await imageCubit.uploadFile(file);
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
    );
  }

  Widget _buildButton(
    ImageUploadState state,
    BuildContext context,
    TaskerPortfolioState portfolioState,
  ) {
    return Center(
      child: CustomElevatedButton(
        callback: () async {
          List list = [];
          if (state is ImageUploadSuccess) {
            setState(() {
              list = state.list;
            });
          } else {
            setState(() {
              // list.add(
              //   portfolioState.taskerPortfolioList.first.images!
              //       .first['id'] as int,
              // );
            });
          }

          final req = TaskerPortfolioReq(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : portfolio!.title!,
            description: descriptionController.text.isNotEmpty
                ? descriptionController.text
                : portfolio!.description!,
            issuedDate: issuedDate ?? portfolio!.issuedDate!,
            credentialUrl: credentialUrlController.text.isNotEmpty
                ? 'https://${credentialUrlController.text}'
                : portfolio!.credentialUrl!,
            files: [],
            images: List<int>.from(list),
          );

          await context.read<TaskerPortfolioCubit>().editTaskerPortfolio(
                req,
                portfolioState.taskerPortfolio.id!,
              );
        },
        label: 'Save',
      ),
    );
  }
}
