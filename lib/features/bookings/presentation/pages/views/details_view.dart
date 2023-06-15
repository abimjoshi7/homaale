import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/services/presentation/pages/sections/detail_header_section.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/locator.dart';
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
  final addressController = TextEditingController();

  List<String> requirementList = [];
  List<int>? imageList;
  List<int>? fileList;
  int? cityCode;
  String? addressType = 'On premise';
  bool isAddressVisible = true;
  bool isTermsAccepted = false;

  final uploadBloc = locator<UploadBloc>();

  @override
  void initState() {
    super.initState();

    budgetController.setText(
      double.parse(context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService!
              .payableTo!)
          .toInt()
          .toString(),
    );
  }

  @override
  void dispose() {
    requirementController.dispose();
    problemDescController.dispose();
    budgetController.dispose();
    addressController.dispose();
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
            label: "Your Budget",
            child: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
              builder: (context, state) {
                if (state.taskEntityService?.isRange == true &&
                    state.taskEntityService?.isNegotiable == false)
                  return SizedBox(
                    width: 100,
                    child: CustomTextFormField(
                      textInputType: TextInputType.number,
                      controller: budgetController,
                      onChanged: (p0) {
                        if (double.parse(budgetController.text) >
                                double.parse(
                                    state.taskEntityService!.payableTo!) ||
                            double.parse(budgetController.text) <
                                double.parse(
                                    state.taskEntityService!.payableFrom!)) {
                          ScaffoldMessenger.of(context)
                            ..clearSnackBars()
                            ..showSnackBar(
                              SnackBar(
                                showCloseIcon: true,
                                content: Text(
                                  "Budget cannot be higher or lower than the given pricing",
                                ),
                              ),
                            );
                        } else
                          context.read<BookEventHandlerBloc>().add(
                                BookEventPicked(
                                  req: BookEntityServiceReq(
                                    budgetTo: double.parse(
                                      p0!,
                                    ),
                                    endDate: DateTime.parse(context
                                        .read<BookEventHandlerBloc>()
                                        .state
                                        .endDate!),
                                  ),
                                ),
                              );
                      },
                    ),
                  );
                if (state.taskEntityService?.isNegotiable == true)
                  return NumberIncDecField(
                    controller: budgetController,
                    onSubmit: (value) =>
                        context.read<BookEventHandlerBloc>().add(
                              BookEventPicked(
                                req: BookEntityServiceReq(
                                  budgetTo: double.parse(
                                    budgetController.text,
                                  ),
                                  endDate: DateTime.parse(context
                                      .read<BookEventHandlerBloc>()
                                      .state
                                      .endDate!),
                                ),
                              ),
                            ),
                  );
                return SizedBox(
                  width: 100,
                  child: CustomTextFormField(
                    readOnly: true,
                    controller: budgetController,
                  ),
                );
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFormField(
            label: 'Requirements',
            child: Column(
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
                              size: 15,
                              color: kColorGrey,
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
                  validator: (value) => requirementList.length == 0
                      ? "Atleast 1 Requirement Required"
                      : null,
                  suffixWidget: IconButton(
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: kColorSecondary,
                    ),
                    onPressed: () {
                      if (requirementController.text.isNotEmpty)
                        setState(
                          () {
                            requirementList.add(requirementController.text);
                            context.read<BookEventHandlerBloc>().add(
                                  BookEventPicked(
                                    req: BookEntityServiceReq(
                                      requirements: requirementList,
                                      endDate: DateTime.parse(context
                                          .read<BookEventHandlerBloc>()
                                          .state
                                          .endDate!),
                                    ),
                                  ),
                                );
                            requirementController.clear();
                          },
                        );
                    },
                  ),
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
              onChanged: (p0) => context.read<BookEventHandlerBloc>().add(
                    BookEventPicked(
                      req: BookEntityServiceReq(
                        description: problemDescController.text,
                        endDate: DateTime.parse(context
                            .read<BookEventHandlerBloc>()
                            .state
                            .endDate!),
                      ),
                    ),
                  ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomFormField(
            label: "Address",
            isRequired: true,
            child: Column(
              children: [
                Row(
                  children: [
                    Radio<String>(
                      value: 'Remote',
                      groupValue: addressType,
                      onChanged: (value) => setState(
                        () {
                          addressType = value;
                          isAddressVisible = false;
                        },
                      ),
                    ),
                    const Text('Remote'),
                    addHorizontalSpace(10),
                    Radio<String>(
                      value: 'On premise',
                      groupValue: addressType,
                      onChanged: (value) => setState(
                        () {
                          addressType = value;
                          isAddressVisible = true;
                        },
                      ),
                    ),
                    const Text('On premise'),
                  ],
                ),
                Visibility(
                  visible: isAddressVisible,
                  child: CustomTextFormField(
                    hintText: "Enter address details",
                    controller: addressController,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CustomMultimedia(
              bloc: uploadBloc,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              CustomCheckBox(
                isChecked: isTermsAccepted,
                onTap: () async {
                  setState(
                    () {
                      isTermsAccepted = !isTermsAccepted;
                    },
                  );
                },
              ),
              addHorizontalSpace(10),
              const Flexible(
                child: Text(
                  'Accept all',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      TermsOfUsePage.routeName,
                    );
                  },
                  child: const Text(
                    'Terms and Conditions.',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
