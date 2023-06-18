import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
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
  final budgetFrom = TextEditingController();
  final budgetTo = TextEditingController();
  final _categoryKey = GlobalKey<FormFieldState>();
  final _locationKey = GlobalKey<FormFieldState>();

  DateTime? dateFrom;
  DateTime? dateTo;
  String? category;
  String? serviceId;
  String? location;

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
            dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
            dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
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
  }

  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.taskEntityServiceModel.result![index].id!,
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
        trailingWidget: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SearchPage.routeName);
          },
          icon: Icon(Icons.search),
        ),
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
                            addHorizontalSpace(
                              8,
                            ),
                            _buildClearFilters(context),
                          ],
                        )
                      ],
                    ),
                  ),
                  kHeight8,
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      controller: _controller,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      itemCount:
                          state.isLastPage ? state.taskEntityServices!.length : state.taskEntityServices!.length + 1,
                      separatorBuilder: (context, index) => addVerticalSpace(8),
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
                              isRange: state.taskEntityServices![index].isRange ?? false,
                              buttonLabel: state.taskEntityServices![index].createdBy?.id ==
                                      context.read<UserBloc>().state.taskerProfile?.user?.id
                                  ? 'View Details'
                                  : 'Apply Now',
                              startRate: '${state.taskEntityServices![index].budgetFrom ?? 0}',
                              createdByName: '${state.taskEntityServices![index].createdBy?.fullName}',
                              endRate: '${state.taskEntityServices![index].budgetTo ?? 0}',
                              budgetType: '${state.taskEntityServices![index].budgetType ?? 'budgetType'}',
                              count: state.taskEntityServices![index].count?.toString() ?? '0',
                              imageUrl: state.taskEntityServices![index].createdBy?.profileImage ?? kHomaaleImg,
                              location: state.taskEntityServices![index].location ?? 'remote',
                              endHour: Jiffy(
                                state.taskEntityServices![index].createdAt?.toString() ?? DateTime.now().toString(),
                              ).jm,
                              endDate: Jiffy(
                                state.taskEntityServices![index].endDate?.toString() ?? DateTime.now().toString(),
                              ).yMMMMd,
                              taskName: state.taskEntityServices![index].title ?? 'task title',
                              isOwner: state.taskEntityServices![index].createdBy?.id ==
                                  context.read<UserBloc>().state.taskerProfile?.user?.id,
                              editCallback: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height * 0.75,
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context).viewInsets.bottom, left: 8, right: 8, top: 8),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          EditTaskEntityServiceForm(
                                            id: state.taskEntityServices?[index].id ?? "",
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
                                isApply: state.taskEntityServices![index].createdBy?.id !=
                                    context.read<UserBloc>().state.taskerProfile?.user?.id,
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
                  dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                  dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
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
                    dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
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
    return CustomFilterChip(
      iconData: Icons.attach_money_sharp,
      label: budgetFrom.text.length == 0 ? "From" : budgetFrom.text,
      callback: (value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("Enter Amount:"), actions: [
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
                    isTask: true,
                    newFetch: true,
                    budgetFrom: budgetFrom.text,
                    budgetTo: budgetTo.length == 0 ? null : budgetTo.text,
                    dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                    city: location,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
    );
  }

  Widget _buildBudgetTo(BuildContext context) {
    return CustomFilterChip(
      iconData: Icons.attach_money_sharp,
      label: budgetTo.text.length == 0 ? "To" : budgetTo.text,
      callback: (value) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text("Enter Amount:"), actions: [
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
                    isTask: true,
                    newFetch: true,
                    budgetTo: budgetTo.text,
                    budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
                    dateFrom: dateFrom == null ? null : DateFormat("yyyy-MM-dd").format(dateFrom!),
                    dateTo: dateTo == null ? null : DateFormat("yyyy-MM-dd").format(dateTo!),
                    city: location,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ]),
        );
      },
    );
  }

  Widget _buildFromDate(BuildContext context) {
    return CustomFilterChip(
      label: dateFrom != null ? DateFormat.MMMd().format(dateFrom!) : "From",
      iconData: Icons.calendar_today_outlined,
      callback: (value) {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(
            2000,
          ),
          lastDate: DateTime(
            2050,
          ),
        ).then(
          (value) {
            setState(() {
              dateFrom = value;
            });
            taskBloc.add(
              AllTaskLoadInitiated(
                isTask: true,
                newFetch: true,
                budgetTo: budgetTo.text,
                budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
                dateFrom: DateFormat("yyyy-MM-dd").format(
                  dateFrom!,
                ),
                dateTo: dateTo == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(
                        dateTo!,
                      ),
                city: location,
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildToDate(BuildContext context) {
    return CustomFilterChip(
      label: dateTo != null ? DateFormat.MMMd().format(dateTo!) : "To",
      iconData: Icons.calendar_today_outlined,
      callback: (value) {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(
            2000,
          ),
          lastDate: DateTime(
            2050,
          ),
        ).then(
          (value) {
            setState(() {
              dateTo = value;
            });

            taskBloc.add(
              AllTaskLoadInitiated(
                isTask: true,
                newFetch: true,
                budgetTo: budgetTo.text,
                budgetFrom: budgetFrom.length == 0 ? null : budgetFrom.text,
                dateTo: DateFormat("yyyy-MM-dd").format(
                  dateTo!,
                ),
                dateFrom: dateFrom == null
                    ? null
                    : DateFormat("yyyy-MM-dd").format(
                        dateFrom!,
                      ),
                city: location,
              ),
            );
          },
        );
      },
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
