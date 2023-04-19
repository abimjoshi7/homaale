import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/user/presentation/bloc/user_bloc.dart';
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
  late final user = locator<UserBloc>();
  List<EntityService> taskList = [];
  List<String>? items = [];

  bool dateSelected = true;
  bool budgetSelected = false;
  bool categorySelected = false;
  bool locationSelected = false;

  bool sortDateIsAscending = true;
  bool sortBudgetIsAscending = true;

  SortType sortType = SortType.date;
  List<String>? order = ['-created_at'];
  String? selectedCategoryId;
  String? selectedLocation;

  //initialize page controller
  final PagingController<int, EntityService> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    user.add(UserLoaded());
    taskBloc.add(FetchServicesList());

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => taskBloc.add(
        AllTaskLoadInitiated(
          page: pageKey,
          order: order,
          city: selectedLocation,
          serviceId: selectedCategoryId,
          isBudgetSort: false,
          isDateSort: false,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    taskBloc.close();
    user.close();
    _pagingController.dispose();
  }

  void onFilterCategory({String? category}) {
    if (category != null) {
      for (ServiceList element in taskBloc.state.serviceList ?? []) {
        if (element.title == category) {
          setState(() {
            selectedCategoryId = element.id.toString();
          });
          break;
        }
      }
    } else {
      setState(() {
        selectedCategoryId = null;
      });
    }

    taskBloc.add(AllTaskLoadInitiated(
      page: 1,
      order: order,
      serviceId: selectedCategoryId,
      city: selectedLocation,
      isFilter: selectedCategoryId != null
          ? true
          : selectedLocation != null
              ? true
              : false,
      isDateSort: taskBloc.state.isDateSort,
      isBudgetSort: taskBloc.state.isBudgetSort,
    ));
  }

  void onFilterLocation({String? location}) {
    if (location != null) {
      setState(() {
        selectedLocation = location;
      });
    } else {
      setState(() {
        selectedLocation = null;
      });
    }

    taskBloc.add(AllTaskLoadInitiated(
      page: 1,
      order: order,
      serviceId: selectedCategoryId,
      city: selectedLocation,
      isFilter: selectedCategoryId != null
          ? true
          : selectedLocation != null
              ? true
              : false,
      isDateSort: taskBloc.state.isDateSort,
      isBudgetSort: taskBloc.state.isBudgetSort,
    ));
  }

  void onBudgetDateClear({required SortType sortType}) {
    if (sortType == SortType.date) {
      if (order?.contains('-created_at') ?? false) {
        setState(() {
          order?.remove('-created_at');
        });
      }
      if (order?.contains('created_at') ?? false) {
        setState(() {
          order?.remove('created_at');
        });
      }
    }

    if (sortType == SortType.budget) {
      if (order?.contains('-budget_to') ?? false) {
        setState(() {
          order?.remove('-budget_to');
        });
      }
      if (order?.contains('budget_to') ?? false) {
        setState(() {
          order?.remove('budget_to');
        });
      }
    }

    taskBloc.add(AllTaskLoadInitiated(
        page: 1,
        order: order,
        city: selectedLocation,
        serviceId: selectedCategoryId,
        isFilter: selectedCategoryId != null
            ? true
            : selectedLocation != null
                ? true
                : false,
        isDateSort: sortType == SortType.date,
        isBudgetSort: sortType == SortType.budget));
  }

  void onBudgetDateSort(
      {required SortType sortType, required bool isAscending}) {
    if (sortType == SortType.date) {
      if (isAscending) {
        setState(() {
          order?.remove('created_at');
          order?.add('-created_at');
        });
      } else {
        setState(() {
          order?.remove('-created_at');
          order?.add('created_at');
        });
      }
    }

    if (sortType == SortType.budget) {
      if (isAscending) {
        setState(() {
          order?.remove('budget_to');
          order?.add('-budget_to');
        });
      } else {
        setState(() {
          order?.remove('-budget_to');
          order?.add('budget_to');
        });
      }
    }

    taskBloc.add(AllTaskLoadInitiated(
        page: 1,
        order: order,
        city: selectedLocation,
        serviceId: selectedCategoryId,
        isFilter: selectedCategoryId != null
            ? true
            : selectedLocation != null
                ? true
                : false,
        isDateSort: sortType == SortType.date,
        isBudgetSort: sortType == SortType.budget));
  }

  void onTaskPressed({
    required TaskState state,
    required int index,
    required bool isApply,
  }) {
    context.read<TaskBloc>().add(
          SingleEntityTaskLoadInitiated(
            id: state.tasksList!.result![index].id!,
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
      body: BlocListener<TaskBloc, TaskState>(
        bloc: taskBloc,
        listener: (context, state) {
          if ((state.isFilter ?? false) ||
              (state.isDateSort ?? false) ||
              (state.isBudgetSort ?? false)) {
            _pagingController.refresh();
            taskBloc.add(ResetFilterSort());
          }

          if (state.servicesLoaded ?? false) {
            setState(() {
              items = [...?state.serviceList?.map((e) => e.title!).toList()];
            });
          }

          if (state.theState == TheStates.failure) {
            _pagingController.error = 'Error';
          }

          if (state.theState == TheStates.success) {
            taskList = state.tasksList!.result!;

            final lastPage = state.tasksList!.totalPages!;
            final next = 1 + state.tasksList!.current!;

            if (next > lastPage) {
              _pagingController.appendLastPage(taskList);
            } else {
              _pagingController.appendPage(taskList, next);
            }
          }
        },
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                addVerticalSpace(50),
                const CustomHeader(
                  label: 'All Task Page',
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    children: <Widget>[
                      items?.isNotEmpty ?? false
                          ? Container(
                              width: 170,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: categorySelected
                                    ? kColorAmber
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: kColorGrey),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownSearch<String?>(
                                      items: items ?? [''],
                                      onChanged: (value) {
                                        setState(() {
                                          categorySelected =
                                              value != null ? true : false;
                                        });
                                        onFilterCategory(category: value);
                                      },
                                      clearButtonProps: ClearButtonProps(
                                        padding: EdgeInsets.zero,
                                        iconSize: 16,
                                        visualDensity: VisualDensity.compact,
                                        alignment: Alignment.centerRight,
                                        isVisible: categorySelected,
                                        color: categorySelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          hintText: 'Category',
                                          hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          suffixIconColor: categorySelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        baseStyle: TextStyle(
                                          color: categorySelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      popupProps: PopupProps.modalBottomSheet(
                                        showSearchBox: true,
                                        modalBottomSheetProps:
                                            ModalBottomSheetProps(
                                          backgroundColor:
                                              Theme.of(context).cardColor,
                                          useSafeArea: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ChoiceChip(
                              label: Row(
                                children: const [
                                  Text('Category'),
                                  Icon(Icons.keyboard_arrow_down_outlined),
                                ],
                              ),
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: kColorGrey),
                              selected: false,
                              disabledColor: Colors.white,
                            ),
                      addHorizontalSpace(5),
                      BlocBuilder<CityBloc, CityState>(
                        builder: (context, state) {
                          if (state is CityLoadSuccess) {
                            return Container(
                              width: 170,
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: locationSelected
                                    ? kColorAmber
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(color: kColorGrey),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: DropdownSearch<String?>(
                                      items: state.list
                                          .map((e) => e.name)
                                          .toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          locationSelected =
                                              value != null ? true : false;
                                        });
                                        onFilterLocation(location: value);
                                      },
                                      clearButtonProps: ClearButtonProps(
                                        padding: EdgeInsets.zero,
                                        iconSize: 16,
                                        visualDensity: VisualDensity.compact,
                                        alignment: Alignment.centerRight,
                                        isVisible: locationSelected,
                                        color: locationSelected
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          hintText: 'Location',
                                              hintStyle:
                                              TextStyle(color: Colors.black),
                                          border: InputBorder.none,
                                          suffixIconColor: locationSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        baseStyle: TextStyle(
                                          color: locationSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      popupProps: PopupProps.modalBottomSheet(
                                        showSearchBox: true,
                                        modalBottomSheetProps:
                                            ModalBottomSheetProps(
                                          useSafeArea: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return ChoiceChip(
                              label: Row(
                                children: [
                                  Text(
                                    'Location',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                ],
                              ),
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: kColorGrey),
                              selected: false,
                              disabledColor: Colors.white,
                            );
                          }
                        },
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            budgetSelected = true;
                            sortBudgetIsAscending = !sortBudgetIsAscending;
                          });
                          onBudgetDateSort(
                              sortType: SortType.budget,
                              isAscending: sortBudgetIsAscending);
                        },
                        child: Container(
                          width: budgetSelected ? 110 : 95,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color:
                                  budgetSelected ? kColorAmber : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text(
                                'Budget',
                                style: TextStyle(
                                  color: budgetSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                sortBudgetIsAscending
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                                color: budgetSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              if (budgetSelected) ...[
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      budgetSelected = false;
                                    });
                                    onBudgetDateClear(
                                        sortType: SortType.budget);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: budgetSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            dateSelected = true;
                            sortDateIsAscending = !sortDateIsAscending;
                          });
                          onBudgetDateSort(
                              sortType: SortType.date,
                              isAscending: sortDateIsAscending);
                        },
                        child: Container(
                          width: dateSelected ? 95 : 77,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: dateSelected ? kColorAmber : Colors.white,
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                  color: dateSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              Icon(
                                sortDateIsAscending
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined,
                                color:
                                    dateSelected ? Colors.white : Colors.black,
                              ),
                              if (dateSelected) ...[
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      dateSelected = false;
                                    });
                                    onBudgetDateClear(sortType: SortType.date);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: dateSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                )
                              ]
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(5),
                    ],
                  ),
                ),
                Expanded(
                  child: PagedListView.separated(
                    pagingController: _pagingController,
                    separatorBuilder: (context, index) => addVerticalSpace(8),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    builderDelegate: PagedChildBuilderDelegate(
                      itemBuilder: (context, EntityService item, index) =>
                          InkWell(
                        onTap: () => onTaskPressed(
                          state: state,
                          index: index,
                          isApply: false,
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: TaskCard(
                            buttonLabel: item.createdBy?.id ==
                                    user.state.taskerProfile?.user?.id
                                ? 'View Details'
                                : 'Apply Now',
                            startRate: '${item.budgetFrom ?? 0}',
                            endRate: '${item.budgetTo ?? 0}',
                            budgetType: '${item.budgetType ?? 'budgetType'}',
                            count: item.count?.toString() ?? '0',
                            imageUrl: item.createdBy?.profileImage ??
                                kServiceImageNImg,
                            location: item.location ?? 'remote',
                            endHour: Jiffy(
                              item.createdAt?.toString() ??
                                  DateTime.now().toString(),
                            ).jm,
                            endDate: Jiffy(
                              item.endDate?.toString() ??
                                  DateTime.now().toString(),
                            ).yMMMMd,
                            taskName: item.title ?? 'task title',
                            callback: () => onTaskPressed(
                              state: state,
                              index: index,
                              isApply: item.createdBy?.id !=
                                  user.state.taskerProfile?.user?.id,
                            ),
                            onTapCallback: () {
                              if (!CacheHelper.isLoggedIn) {
                                notLoggedInPopUp(context);
                              }
                              if (!CacheHelper.isLoggedIn) return;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
