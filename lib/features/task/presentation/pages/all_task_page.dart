import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/marketing/data/models/marketing_ads_dto.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/features/utilities/presentation/bloc/bloc.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/search_helper.dart';
import '../../../search/presentation/bloc/search_bloc.dart';

enum SortType { budget, date }

class AllTaskPage extends StatefulWidget {
  static const routeName = '/all-task-page';
  const AllTaskPage({super.key});

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  late final taskBloc = locator<TaskBloc>();
  late final ScrollController _controller;
  final searchController = TextEditingController();
  final budgetFrom = TextEditingController();
  final budgetTo = TextEditingController();
  final _categoryKey = GlobalKey<FormFieldState>();
  final _locationKey = GlobalKey<FormFieldState>();

  DateTime? dateFrom;
  DateTime? dateTo;
  String? category;
  String? serviceId;
  String? location;
  String? sortBudget;
  String? sortDate;

  @override
  void initState() {
    super.initState();
    taskBloc.add(AllTaskLoadInitiated(isTask: true));

    _controller = ScrollController()
      ..addListener(() {
        ScrollHelper.nextPageTrigger(
          _controller,
          taskBloc.add(AllTaskLoadInitiated(
            newFetch: false,
            isTask: true,
            dateFrom: dateFrom == null
                ? null
                : DateFormat("yyyy-MM-dd").format(dateFrom!),
            dateTo: dateTo == null
                ? null
                : DateFormat("yyyy-MM-dd").format(dateTo!),
            budgetFrom: budgetFrom.text.length == 0 ? null : budgetFrom.text,
            budgetTo: budgetTo.text.length == 0 ? null : budgetTo.text,
            serviceId: category,
            city: location,
          )),
        );
      });
  }

  @override
  void dispose() {
    super.dispose();
    taskBloc.close();
    _controller.dispose();
    searchController.dispose();
  }

  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.taskEntityServices![index].id!,
            userId:
                context.read<UserBloc>().state.taskerProfile?.user?.id ?? '',
          ),
        );
    if (isApply) {
      if (CacheHelper.isLoggedIn == false) {
        notLoggedInPopUp(context);
      }
      if (CacheHelper.isLoggedIn) {
        Navigator.pushNamed(context, ApplyTaskPage.routeName);
      }
    }
    if (!isApply) {
      Navigator.pushNamed(context, SingleTaskPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: " All Task Page",
        trailingWidget: SizedBox.shrink(),
        // IconButton(
        //   onPressed: () async => showSearch(
        //     context: context,
        //     delegate: SearchHelper(
        //       context: context,
        //       searchBloc: locator<SearchBloc>(),
        //     ),
        //   ),
        //   icon: Icon(Icons.search),
        // ),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        bloc: taskBloc,
        builder: (context, state) {
          switch (state.theState) {
            case TheStates.initial:
              return const Center(child: LinearProgressIndicator());
            case TheStates.success:
              return Column(
                children: <Widget>[
                  kHeight8,
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      children: <Widget>[
                        Row(
                          children: [
                            Icon(
                              Icons.filter_alt,
                              color: kColorGrey,
                            ),
                            InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: 200,
                                height: 52,
                                child: CustomTextFormField(
                                  hintText: "Search",
                                  controller: searchController,
                                  inputAction: TextInputAction.done,
                                  onFieldSubmitted: (p0) {
                                    if (p0!.length >= 3) {
                                      taskBloc.add(
                                        AllTaskLoadInitiated(
                                          query: p0,
                                          newFetch: true,
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text(
                              //         toText ?? "To",
                              //         overflow: TextOverflow.ellipsis,
                              //       ),
                              //       addHorizontalSpace(8),
                              //       Icon(
                              //         Icons.calendar_today_outlined,
                              //         color: kColorSilver,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ),
                            addHorizontalSpace(5),
                            _buildCategory(),
                            addHorizontalSpace(
                              8,
                            ),
                            _buildLocation(),
                            addHorizontalSpace(
                              8,
                            ),
                            _buildFromDate(context),
                            addHorizontalSpace(
                              8,
                            ),
                            _buildToDate(context),
                            addHorizontalSpace(
                              8,
                            ),
                            _buildBudgetFrom(context),
                            addHorizontalSpace(
                              8,
                            ),
                            _buildBudgetTo(context),
                            addHorizontalSpace(8),
                            _buildBudgetSort(),
                            addHorizontalSpace(8),
                            _buildDateSort(),
                            addHorizontalSpace(8),
                            dateFrom != null ||
                                    dateTo != null ||
                                    budgetFrom.text.length != 0 ||
                                    budgetTo.text.length != 0 ||
                                    category != null ||
                                    location != null ||
                                    sortBudget != null ||
                                    sortDate != null
                                ? _buildClearFilters(context)
                                : SizedBox.shrink(),
                          ],
                        )
                      ],
                    ),
                  ),
                  kHeight8,
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        taskBloc.add(
                            AllTaskLoadInitiated(isTask: true, newFetch: true));
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: _controller,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemCount: state.isLastPage
                            ? state.taskEntityServices!.length
                            : state.taskEntityServices!.length + 1,
                        separatorBuilder: (context, index) {
                          if (index % 5 == 0) {
                            List<Ads>? ads = [
                              ...?context
                                  .read<MarketingAdsBloc>()
                                  .state
                                  .marketingAdsDto
                                  .result
                            ];
                            if (ads.isNotEmpty) {
                              ads.shuffle();
                              return CachedNetworkImage(
                                imageUrl: ads.first.image!,
                                height: 100,
                                fit: BoxFit.fitWidth,
                              );
                            } else {
                              return addVerticalSpace(8);
                            }
                          } else {
                            return addVerticalSpace(8);
                          }
                        },
                        itemBuilder: (BuildContext context, int index) {
                          if (index >= state.taskEntityServices!.length) {
                            return Center(child: const BottomLoader());
                          }
                          return InkWell(
                            onTap: () => onTaskPressed(
                              state: state,
                              index: index,
                              isApply: false,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: TaskCard(
                                id: state.taskEntityServices![index].id,
                                isBookmarked: state
                                    .taskEntityServices![index].isBookmarked,
                                shareLinked:
                                    '$kShareLinks/tasks/${state.taskEntityServices?[index].id}',
                                isRange:
                                    state.taskEntityServices![index].isRange ??
                                        false,
                                buttonLabel: state.taskEntityServices![index]
                                            .createdBy?.id ==
                                        context
                                            .read<UserBloc>()
                                            .state
                                            .taskerProfile
                                            ?.user
                                            ?.id
                                    ? 'View Details'
                                    : 'Apply Now',
                                startRate:
                                    '${state.taskEntityServices![index].budgetFrom ?? 0}',
                                createdByName:
                                    '${state.taskEntityServices![index].createdBy?.fullName}',
                                endRate:
                                    '${state.taskEntityServices![index].budgetTo ?? 0}',
                                budgetType:
                                    '${state.taskEntityServices![index].budgetType ?? 'budgetType'}',
                                count: state.taskEntityServices![index].count
                                        ?.toString() ??
                                    '0',
                                imageUrl: state.taskEntityServices![index]
                                        .createdBy?.profileImage ??
                                    kHomaaleImg,
                                location:
                                    state.taskEntityServices![index].location ??
                                        'remote',
                                endHour: Jiffy(
                                  state.taskEntityServices![index].createdAt
                                          ?.toString() ??
                                      DateTime.now().toString(),
                                ).jm,
                                endDate: Jiffy(
                                  state.taskEntityServices![index].endDate
                                          ?.toString() ??
                                      DateTime.now().toString(),
                                ).yMMMMd,
                                taskName:
                                    state.taskEntityServices![index].title ??
                                        'task title',
                                isOwner: state.taskEntityServices![index]
                                        .createdBy?.id ==
                                    context
                                        .read<UserBloc>()
                                        .state
                                        .taskerProfile
                                        ?.user
                                        ?.id,
                                editCallback: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.75,
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
                                          left: 8,
                                          right: 8,
                                          top: 8),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            EditTaskEntityServiceForm(
                                              id: state
                                                      .taskEntityServices?[
                                                          index]
                                                      .id ??
                                                  "",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                callback: () => onTaskPressed(
                                  state: state,
                                  index: index,
                                  isApply: state.taskEntityServices![index]
                                          .createdBy?.id !=
                                      context
                                          .read<UserBloc>()
                                          .state
                                          .taskerProfile
                                          ?.user
                                          ?.id,
                                ),
                                onTapCallback: () {
                                  if (!CacheHelper.isLoggedIn) {
                                    notLoggedInPopUp(context);
                                  }
                                  if (!CacheHelper.isLoggedIn) return;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            case TheStates.failure:
              return Text("Could Not Load Tasks");
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  SizedBox _buildLocation() {
    return SizedBox(
      width: 170,
      height: 48,
      child: BlocBuilder<CityBloc, CityState>(
        builder: (context, state) {
          if (state is CityLoadSuccess)
            return CustomDropdownSearch(
              key: _locationKey,
              hintText: location ?? "Location",
              list: List.generate(
                state.list.length,
                (index) => state.list[index].name,
              ),
              onChanged: (value) {
                setState(() {
                  location = value as String;
                });
                taskBloc.add(AllTaskLoadInitiated(
                  isTask: true,
                  newFetch: true,
                  budgetFrom: budgetFrom.text,
                  budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
                  dateFrom: dateFrom == null
                      ? null
                      : DateFormat("yyyy-MM-dd").format(dateFrom!),
                  dateTo: dateTo == null
                      ? null
                      : DateFormat("yyyy-MM-dd").format(dateTo!),
                  city: location,
                  category: category,
                ));
              },
            );
          return SizedBox.shrink();
        },
      ),
    );
  }

  SizedBox _buildCategory() {
    return SizedBox(
      width: 170,
      height: 48,
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success)
            return CustomDropdownSearch(
              key: _categoryKey,
              hintText: category ?? "Category",
              list: List.generate(
                state.serviceList!.length,
                (index) => state.serviceList?[index].title ?? "",
              ),
              onChanged: (value) {
                for (var element in state.serviceList!) {
                  if (element.title == value)
                    setState(() {
                      category = value as String;
                      serviceId = element.id.toString();
                    });
                }
                taskBloc.add(
                  AllTaskLoadInitiated(
                    isTask: true,
                    newFetch: true,
                    budgetFrom: budgetFrom.text,
                    budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
                    dateFrom: dateFrom == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(dateTo!),
                    serviceId: serviceId,
                    city: location,
                  ),
                );
              },
            );
          return SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildBudgetFrom(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text("Enter Amount:"), actions: [
            CustomTextFormField(
              autofocus: true,
              controller: budgetFrom,
              hintText: "2000",
              textInputType: TextInputType.number,
              inputAction: TextInputAction.done,
              onFieldSubmitted: (p0) {
                setState(() {
                  budgetFrom.text = p0!;
                });
                taskBloc.add(
                  AllTaskLoadInitiated(
                    newFetch: true,
                    budgetFrom: budgetFrom.text,
                    budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
                    dateFrom: dateFrom == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(dateTo!),
                    serviceId: serviceId,
                    city: location,
                    dateSort: sortDate,
                    budgetSort: sortBudget,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.attach_money_sharp,
              ),
              addHorizontalSpace(4.0),
              Text("${budgetFrom.text.length == 0 ? "From" : budgetFrom.text}"),
              addHorizontalSpace(8.0),
              budgetFrom.length != 0
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          budgetFrom.clear();
                        });

                        taskBloc.add(
                          AllTaskLoadInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            budgetTo:
                                budgetTo.length == 0 ? null : budgetTo.text,
                            budgetFrom:
                                budgetFrom.length == 0 ? null : budgetFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetTo(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(content: Text("Enter Amount:"), actions: [
            CustomTextFormField(
              autofocus: true,
              controller: budgetTo,
              hintText: "2000",
              textInputType: TextInputType.number,
              inputAction: TextInputAction.done,
              onFieldSubmitted: (p0) {
                setState(() {
                  budgetTo.text = p0!;
                });
                taskBloc.add(
                  AllTaskLoadInitiated(
                    newFetch: true,
                    budgetTo: budgetTo.text,
                    budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
                    dateFrom: dateFrom == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null
                        ? null
                        : DateFormat("yyyy-MM-dd").format(dateTo!),
                    serviceId: serviceId,
                    city: location,
                    dateSort: sortDate,
                    budgetSort: sortBudget,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.attach_money_sharp,
              ),
              addHorizontalSpace(4.0),
              Text("${budgetTo.text.length == 0 ? "To" : budgetTo.text}"),
              addHorizontalSpace(8.0),
              budgetTo.length != 0
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          budgetTo.clear();
                        });

                        taskBloc.add(
                          AllTaskLoadInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            budgetTo:
                                budgetTo.length == 0 ? null : budgetTo.text,
                            budgetFrom:
                                budgetFrom.length == 0 ? null : budgetFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFromDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: dateFrom ?? DateTime(2000),
          lastDate: DateTime(2050),
        ).then(
          (value) {
            setState(() {
              dateFrom = value;
            });

            taskBloc.add(
              AllTaskLoadInitiated(
                newFetch: true,
                isTask: false,
                dateFrom: DateFormat("yyyy-MM-dd").format(
                  dateFrom!,
                ),
                dateTo: dateTo == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(
                        dateTo!,
                      ),
                budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
                budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
                serviceId: serviceId,
                city: location,
                dateSort: sortDate,
                budgetSort: sortBudget,
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
              ),
              addHorizontalSpace(4.0),
              Text(
                  "${dateFrom != null ? DateFormat.MMMd().format(dateFrom!) : "From"}"),
              addHorizontalSpace(8.0),
              dateFrom != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          dateFrom = null;
                        });

                        taskBloc.add(
                          AllTaskLoadInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            budgetTo:
                                budgetTo.length == 0 ? null : budgetTo.text,
                            budgetFrom:
                                budgetFrom.length == 0 ? null : budgetFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: dateFrom ?? DateTime(2000),
          lastDate: DateTime(2050),
        ).then(
          (value) {
            setState(() {
              dateTo = value;
            });

            taskBloc.add(
              AllTaskLoadInitiated(
                newFetch: true,
                isTask: false,
                dateTo: DateFormat("yyyy-MM-dd").format(
                  dateTo!,
                ),
                dateFrom: dateFrom == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(
                        dateFrom!,
                      ),
                budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
                budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
                serviceId: serviceId,
                city: location,
                dateSort: sortDate,
                budgetSort: sortBudget,
              ),
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
              ),
              addHorizontalSpace(4.0),
              Text(
                  "${dateTo != null ? DateFormat.MMMd().format(dateTo!) : "To"}"),
              addHorizontalSpace(8.0),
              dateTo != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          dateTo = null;
                        });

                        taskBloc.add(
                          AllTaskLoadInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            budgetTo:
                                budgetTo.length == 0 ? null : budgetTo.text,
                            budgetFrom:
                                budgetFrom.length == 0 ? null : budgetFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetSort() {
    return GestureDetector(
      onTap: () {
        setState(() {
          sortBudget = sortBudget == null
              ? '-budget_to'
              : sortBudget == '-budget_to'
                  ? 'budget_to'
                  : '-budget_to';
        });

        taskBloc.add(
          AllTaskLoadInitiated(
            newFetch: true,
            isTask: false,
            budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
            budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
            dateTo: dateTo == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateTo!,
                  ),
            dateFrom: dateFrom == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateFrom!,
                  ),
            serviceId: serviceId,
            city: location,
            dateSort: sortDate,
            budgetSort: sortBudget,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.attach_money),
              addHorizontalSpace(4.0),
              Text(
                  "${sortBudget != null ? sortBudget == '-budget_to' ? 'Budget Desc' : 'Budget Asec' : 'Sort Budget'}"),
              addHorizontalSpace(8.0),
              sortBudget != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          sortBudget = null;
                        });

                        taskBloc.add(
                          AllTaskLoadInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            budgetTo:
                                budgetTo.length == 0 ? null : budgetTo.text,
                            budgetFrom:
                                budgetFrom.length == 0 ? null : budgetFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSort() {
    return GestureDetector(
      onTap: () {
        setState(() {
          sortDate = sortDate == null
              ? '-created_at'
              : sortDate == '-created_at'
                  ? 'created_at'
                  : '-created_at';
        });
        taskBloc.add(
          AllTaskLoadInitiated(
            newFetch: true,
            isTask: false,
            budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
            budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
            dateTo: dateTo == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateTo!,
                  ),
            dateFrom: dateFrom == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    dateFrom!,
                  ),
            serviceId: serviceId,
            city: location,
            dateSort: sortDate,
            budgetSort: sortBudget,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Icon(Icons.date_range),
              addHorizontalSpace(4.0),
              Text(
                  "${sortDate != null ? sortDate == '-created_at' ? 'Date Desc' : 'Date Asec' : 'Sort Date'}"),
              addHorizontalSpace(8.0),
              sortDate != null
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          sortDate = null;
                        });

                        taskBloc.add(
                          AllTaskLoadInitiated(
                            newFetch: true,
                            isTask: false,
                            dateTo: dateTo == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateTo!),
                            dateFrom: dateFrom == null
                                ? null
                                : DateFormat("yyyy-MM-dd").format(dateFrom!),
                            budgetTo:
                                budgetTo.length == 0 ? null : budgetTo.text,
                            budgetFrom:
                                budgetFrom.length == 0 ? null : budgetFrom.text,
                            serviceId: serviceId,
                            city: location,
                            dateSort: sortDate,
                            budgetSort: sortBudget,
                          ),
                        );
                      },
                      child: Icon(Icons.clear))
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClearFilters(
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () {
        setState(() {
          dateFrom = null;
          dateTo = null;
          budgetFrom.clear();
          budgetTo.clear();
          category = null;
          location = null;
        });
        taskBloc.add(
          AllTaskLoadInitiated(
            newFetch: true,
          ),
        );
      },
      icon: Icon(
        Icons.clear,
        color: kColorSilver,
      ),
    );
  }
}
