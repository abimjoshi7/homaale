import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
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
  List<EntityService> taskList = [];

  bool sortDateIsAscending = true;
  bool sortBudgetIsAscending = true;

  SortType sortType = SortType.date;
  String? order = '-created_at';

  //initialize page controller
  final PagingController<int, EntityService> _pagingController = PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => taskBloc.add(
        AllTaskLoadInitiated(
          page: pageKey,
          order: order,
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
    _pagingController.dispose();
  }

  void onBudgetDateSort({required SortType sortType, required bool isAscending}) {
    setState(() {
      order = sortType == SortType.date
          ? isAscending
              ? '-created_at'
              : 'created_at'
          : isAscending
              ? '-budget_to'
              : 'budget_to';
    });

    taskBloc.add(AllTaskLoadInitiated(
        page: 1, order: order, isDateSort: sortType == SortType.date, isBudgetSort: sortType == SortType.budget));
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
    // isApply
    //     ? Navigator.pushNamed(context, ApplyTaskPage.routeName)
    //     : Navigator.pushNamed(context, SingleTaskPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TaskBloc, TaskState>(
        bloc: taskBloc,
        listener: (context, state) {
          if ((state.isDateSort ?? false) || (state.isBudgetSort ?? false)) {
            _pagingController.refresh();
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
          if (state.theState == TheStates.failure) {
            _pagingController.error = 'Error';
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
                  height: 35,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    children: <Widget>[
                      // const Icon(
                      //   Icons.filter_alt_outlined,
                      //   color: kColorSilver,
                      // ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const <Widget>[
                            Text(
                              'Category',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Buddhanagar',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sortBudgetIsAscending = !sortBudgetIsAscending;
                          });
                          onBudgetDateSort(sortType: SortType.budget, isAscending: sortBudgetIsAscending);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text('Budget'),
                              Icon(sortBudgetIsAscending
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined)
                            ],
                          ),
                        ),
                      ),
                      addHorizontalSpace(5),
                      InkWell(
                        onTap: () {
                          setState(() {
                            sortDateIsAscending = !sortDateIsAscending;
                          });
                          onBudgetDateSort(sortType: SortType.date, isAscending: sortDateIsAscending);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(color: kColorGrey)),
                          child: Row(
                            children: [
                              Text('Date'),
                              Icon(sortDateIsAscending
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined)
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
                      itemBuilder: (context, EntityService item, index) => InkWell(
                        onTap: () => onTaskPressed(
                          state: state,
                          index: index,
                          isApply: false,
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.21,
                          child: TaskCard(
                            startRate: '${item.budgetFrom ?? 0}',
                            endRate: '${item.budgetTo ?? 0}',
                            budgetType: '${item.budgetType ?? 'budegetType'}',
                            count: item.count?.toString() ?? '0',
                            imageUrl: item.createdBy?.profileImage ?? kServiceImageNImg,
                            location: item.location ?? 'remote',
                            endHour: Jiffy(
                              item.createdAt?.toString() ?? DateTime.now().toString(),
                            ).jm,
                            endDate: Jiffy(
                              item.endDate?.toString() ?? DateTime.now().toString(),
                            ).yMMMMd,
                            taskName: item.title ?? 'task title',
                            callback: () => onTaskPressed(
                              state: state,
                              index: index,
                              isApply: true,
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
