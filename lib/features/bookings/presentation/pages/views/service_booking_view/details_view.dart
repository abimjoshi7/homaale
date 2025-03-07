// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/bookings/presentation/bloc/book_event_handler_bloc.dart';
import 'package:cipher/features/content_client/presentation/pages/pages.dart';
import 'package:cipher/features/services/presentation/pages/sections/detail_header_section.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/upload/presentation/bloc/upload_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/widgets/widgets.dart';

class DetailsView extends StatefulWidget {
  final UploadBloc uploadBloc;
  final BookEventHandlerBloc bookEventHandlerBloc;
  final TextEditingController requirementController;
  final TextEditingController problemDescController;
  final TextEditingController addressController;
  final List<String> requirementList;
  const DetailsView({
    Key? key,
    required this.uploadBloc,
    required this.bookEventHandlerBloc,
    required this.requirementController,
    required this.problemDescController,
    required this.addressController,
    required this.requirementList,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  List<int>? imageList;
  List<int>? fileList;
  int? cityCode;
  String? addressType = 'On premise';
  bool isAddressVisible = true;
  bool isTermsAccepted = false;

  final TextEditingController budgetController = TextEditingController();

  @override
  void initState() {
    super.initState();
    budgetController.setText(
      double.parse(context
              .read<TaskEntityServiceBloc>()
              .state
              .taskEntityService
              .payableTo!)
          .toInt()
          .toString(),
    );
  }

  @override
  void dispose() {
    budgetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildServiceDetails(),
        _buildBudget(),
        _buildRequirements(context),
        _buildDescription(context),
        _buildCity(),
        _buildAddress(),
        _buildMultimedia(),
        _buildTerms(context)
      ],
    );
  }

  SliverToBoxAdapter _buildServiceDetails() {
    return SliverToBoxAdapter(
      child: const DetailHeaderSection(),
    );
  }

  SliverToBoxAdapter _buildBudget() {
    return SliverToBoxAdapter(
      child: CustomFormField(
        label: "Your Budget",
        child: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
          builder: (context, state) {
            if (state.taskEntityService.isRange == true &&
                state.taskEntityService.isNegotiable == false)
              return SizedBox(
                width: 100,
                child: CustomTextFormField(
                  textInputType: TextInputType.number,
                  controller: budgetController,
                  onChanged: (p0) {
                    if (double.parse(budgetController.text) >
                            double.parse(state.taskEntityService.payableTo!) ||
                        double.parse(budgetController.text) <
                            double.parse(
                                state.taskEntityService.payableFrom!)) {
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
                      widget.bookEventHandlerBloc.add(
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
            if (state.taskEntityService.isNegotiable == true)
              return CustomTextFormField(
                theWidth: 106.0,
                errorMaxLines: 2,
                validator: (p0) {
                  if (budgetController.text.isEmpty) {
                    return 'Required Field';
                  }
                  if (double.parse(budgetController.text) < 10.0) {
                    return "Cannot be less than 10";
                  }
                  return null;
                },
                controller: budgetController,
                onSaved: (value) => widget.bookEventHandlerBloc.add(
                  BookEventPicked(
                    req: BookEntityServiceReq(
                      budgetTo: double.parse(
                        budgetController.text,
                      ),
                      endDate: DateTime.parse(
                          widget.bookEventHandlerBloc.state.endDate!),
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
    );
  }

  SliverToBoxAdapter _buildRequirements(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomFormField(
        label: 'Highlights',
        isRequired: true,
        child: Column(
          children: [
            BlocBuilder<BookEventHandlerBloc, BookEventHandlerState>(
              bloc: widget.bookEventHandlerBloc,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    state.requirements.length,
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
                                state.requirements[index],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(
                                () {
                                  widget.requirementList.remove(
                                    widget.requirementList[index],
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
                );
              },
            ),
            addVerticalSpace(5),
            CustomTextFormField(
              controller: widget.requirementController,
              hintText: 'Add Highlight',
              validator: (value) => widget.requirementList.length == 0
                  ? "Atleast 1 Highlight Required"
                  : null,
              suffixWidget: IconButton(
                icon: Icon(
                  Icons.add_box_outlined,
                  color: kColorSecondary,
                ),
                onPressed: () {
                  if (widget.requirementController.text.isNotEmpty)
                    setState(
                      () {
                        widget.requirementList
                            .add(widget.requirementController.text);
                        widget.bookEventHandlerBloc.add(
                          BookEventPicked(
                            req: BookEntityServiceReq(
                              requirements: widget.requirementList,
                            ),
                          ),
                        );
                        widget.requirementController.clear();
                      },
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildDescription(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomFormField(
        label: 'Description',
        isRequired: true,
        child: CustomTextFormField(
          maxLines: 3,
          hintText: "Service Desciption Here",
          controller: widget.problemDescController,
          validator: validateNotEmpty,
          onChanged: (p0) => widget.bookEventHandlerBloc.add(
            BookEventPicked(
              req: BookEntityServiceReq(
                description: widget.problemDescController.text,
                endDate: DateTime.parse(
                  widget.bookEventHandlerBloc.state.endDate!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildCity() {
    return SliverToBoxAdapter(
      child: CustomFormField(
        isRequired: true,
        label: 'City',
        child: BlocBuilder<CityBloc, CityState>(
          builder: (context, state) {
            widget.bookEventHandlerBloc.add(
              BookEventPicked(
                req: BookEntityServiceReq(
                  city: int.parse(kCityCode),
                ),
              ),
            );
            if (state is CityLoadSuccess) {
              return CustomDropdownSearch(
                selectedItem: state.list
                    .firstWhere(
                      (element) => element.name!.startsWith("Kathmandu"),
                    )
                    .name,
                list: List.generate(
                  state.list.length,
                  (index) => state.list[index].name,
                ),
                onChanged: (p0) {
                  setState(
                    () {
                      final x = state.list.firstWhere(
                        (element) => p0 == element.name,
                      );
                      cityCode = x.id;
                    },
                  );
                  widget.bookEventHandlerBloc.add(
                    BookEventPicked(
                      req: BookEntityServiceReq(
                        city: cityCode,
                      ),
                    ),
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAddress() {
    return SliverToBoxAdapter(
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
                  onChanged: (value) {
                    setState(
                      () {
                        addressType = value;
                        isAddressVisible = false;
                      },
                    );
                    widget.bookEventHandlerBloc.add(
                      BookEventPicked(
                          req: BookEntityServiceReq(
                        location: addressType,
                      )),
                    );
                  },
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
                controller: widget.addressController,
                validator: validateNotEmpty,
                onChanged: (p0) {
                  widget.bookEventHandlerBloc.add(
                    BookEventPicked(
                      req: BookEntityServiceReq(
                        location: p0,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildMultimedia() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: CustomMultimedia(
          bloc: widget.uploadBloc,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTerms(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          CustomCheckBox(
            isChecked: isTermsAccepted,
            onTap: () async {
              isTermsAccepted = !isTermsAccepted;
              widget.bookEventHandlerBloc.add(
                BookEventAcceptTerms(
                  isTermAccepted: isTermsAccepted,
                ),
              );
              setState(() {});
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
    );
  }
}
