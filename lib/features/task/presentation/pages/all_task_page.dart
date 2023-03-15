import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AllTaskPage extends StatefulWidget {
  static const routeName = '/all-task-page';
  const AllTaskPage({super.key});

  @override
  State<AllTaskPage> createState() => _AllTaskPageState();
}

class _AllTaskPageState extends State<AllTaskPage> {
  late final taskBloc = locator<TaskBloc>();
  List<EntityService> taskList = [];

  //initialize page controller
  final PagingController<int, EntityService> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    //so at event add list of records
    _pagingController.addPageRequestListener(
      (pageKey) => taskBloc.add(AllTaskLoadInitiated(page: pageKey)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    taskBloc.close();
    _pagingController.dispose();
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
    isApply
        ? Navigator.pushNamed(context, ApplyTaskPage.routeName)
        : Navigator.pushNamed(context, SingleTaskPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => taskBloc,
        child: BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
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
                children: [
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
                      children: [
                        const Icon(
                          Icons.filter_alt_outlined,
                          color: kColorSilver,
                        ),
                        addHorizontalSpace(5),
                        ChoiceChip(
                          label: Row(
                            children: const [
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
                        ChoiceChip(
                          label: Row(
                            children: const [
                              Text(
                                'Any Price',
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
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: kPadding15,
                      child: PagedListView.separated(
                        pagingController: _pagingController,
                        separatorBuilder: (context, index) =>
                            addVerticalSpace(8),
                        padding: EdgeInsets.zero,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, EntityService item, index) =>
                              InkWell(
                            onTap: () => onTaskPressed(
                              state: state,
                              index: index,
                              isApply: false,
                            ),
                            child: TaskCard(
                              startRate: '${item.budgetFrom ?? 0}',
                              endRate: '${item.budgetTo ?? 0}',
                              budgetType: '${item.budgetType}',
                              count: item.count.toString(),
                              imageUrl: item.createdBy?.profileImage ??
                                  kServiceImageNImg,
                              location: item.location,
                              endHour: Jiffy(
                                item.createdAt.toString(),
                              ).jm,
                              endDate: Jiffy(
                                item.endDate?.toString() ??
                                    DateTime.now().toString(),
                              ).yMMMMd,
                              taskName: item.title,
                              callback: () => onTaskPressed(
                                state: state,
                                index: index,
                                isApply: true,
                              ),
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
      ),
    );
  }
}
