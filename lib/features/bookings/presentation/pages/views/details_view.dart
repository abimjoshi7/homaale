import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/documents/presentation/cubit/cubits.dart';
import 'package:cipher/features/services/presentation/pages/sections/detail_header_section.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
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

  late final eventCache = locator<BookEventHandlerBloc>();
  late final imageCubit = locator<ImageUploadCubit>();
  final uploadBloc = locator<UploadBloc>();

  @override
  void dispose() {
    requirementController.dispose();
    problemDescController.dispose();
    budgetController.dispose();
    locator.resetLazySingleton(
      instance: imageCubit,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: const DetailHeaderSection(),
        ),
        SliverToBoxAdapter(
          child: CustomFormField(
            label: "Your Budget (Non negotiable)",
            child: SizedBox(
              height: 40,
              width: 160,
              child: NumberIncDecField(
                controller: budgetController,
                onSubmit: (value) => eventCache.add(
                  BookEventPicked(
                    req: BookEntityServiceReq(
                      budgetTo: double.parse(
                        budgetController.text,
                      ),
                      endDate: DateTime.parse(eventCache.state.endDate!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFormField(
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
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onFieldSubmitted: (p0) async {
                    requirementList.add(p0!);
                    eventCache.add(
                      BookEventPicked(
                        req: BookEntityServiceReq(
                          requirements: requirementList,
                          endDate: DateTime.parse(eventCache.state.endDate!),
                        ),
                      ),
                    );
                    requirementController.clear();
                  },
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFormField(
            label: 'Description',
            isRequired: true,
            child: CustomTextFormField(
              maxLines: 3,
              hintText: "Service Desciption Here",
              controller: problemDescController,
              validator: validateNotEmpty,
              inputAction: TextInputAction.done,
              onFieldSubmitted: (p0) => eventCache.add(
                BookEventPicked(
                  req: BookEntityServiceReq(
                    description: problemDescController.text,
                    endDate: DateTime.parse(eventCache.state.endDate!),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomMultimedia(),
        )
        // SliverToBoxAdapter(
        //   child: CustomFormField(
        //     label: 'Images',
        //     child: Column(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Row(
        //           children: [
        //             Text(
        //               'Maximum Image Size 20 MB',
        //               style: Theme.of(context).textTheme.bodySmall,
        //             ),
        //             addHorizontalSpace(5),
        //             const Icon(
        //               Icons.info_outline,
        //               color: Colors.orange,
        //             ),
        //           ],
        //         ),
        //         addVerticalSpace(5),
        //         InkWell(
        //           onTap: () async {
        //             showDialog(
        //               context: context,
        //               builder: (context) => ImagePickerDialog(),
        //             ).whenComplete(
        //               () => eventCache.add(
        //                 BookEventPicked(
        //                   req: BookEntityServiceReq(
        //                     images: imageList,
        //                     endDate: DateTime.parse(eventCache.state.endDate!),
        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //           child: BlocListener<ImageUploadCubit, ImageUploadState>(
        //             listener: (context, state) async {
        //               if (state is ImageUploadSuccess) {
        //                 setState(
        //                   () async {
        //                     imageList = List<int>.from(state.list);
        //                   },
        //                 );
        //               }
        //             },
        //             child: CustomDottedContainerStack(
        //               theWidget: imageList == null
        //                   ? Text('Select Images')
        //                   : Text('Image Uploaded'),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // SliverToBoxAdapter(
        //   child: CustomFormField(
        //     label: 'Videos',
        //     child: Column(
        //       children: [
        //         Row(
        //           children: [
        //             Text(
        //               'Maximum Video Size 20 MB',
        //               style: Theme.of(context).textTheme.bodySmall,
        //             ),
        //             addHorizontalSpace(5),
        //             const Icon(
        //               Icons.info_outline,
        //               color: Colors.orange,
        //             ),
        //           ],
        //         ),
        //         addVerticalSpace(5),
        //         InkWell(
        //           onTap: () async {
        //             showDialog(
        //               context: context,
        //               builder: (context) => VideoPickerDialog(),
        //             ).whenComplete(
        //               () => eventCache.add(
        //                 BookEventPicked(
        //                   req: BookEntityServiceReq(
        //                     videos: fileList,
        //                     endDate: DateTime.parse(eventCache.state.endDate!),
        //                   ),
        //                 ),
        //               ),
        //             );
        //           },
        //           child: BlocListener<ImageUploadCubit, ImageUploadState>(
        //             listener: (context, state) async {
        //               if (state is VideoUploadSuccess) {
        //                 setState(
        //                   () {
        //                     fileList = List<int>.from(state.list);
        //                   },
        //                 );
        //               }
        //             },
        //             child: CustomDottedContainerStack(
        //               theWidget: fileList == null
        //                   ? Text('Select Videos')
        //                   : Text('File Uploaded'),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
