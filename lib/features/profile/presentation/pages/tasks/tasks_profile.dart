import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/services/data/models/self_created_task_service.dart'
    as self;
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TasksProfile extends StatefulWidget {
  const TasksProfile({super.key});

  @override
  State<TasksProfile> createState() => _TasksProfileState();
}

class _TasksProfileState extends State<TasksProfile> {
  final _controller = ScrollController();
  final _scrollBloc = locator<ScrollBloc>();
  @override
  void initState() {
    super.initState();
    _scrollBloc.add(
      FetchItemsEvent(
        kMyTaskEntityServices,
        {
          "is_requested": true,
        },
        true,
      ),
    );
    _controller.addListener(
      () {
        ScrollHelper.nextPageTrigger(
          _controller,
          _scrollBloc.add(
            FetchItemsEvent(
              kMyTaskEntityServices,
              {
                "is_requested": true,
              },
              false,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollBloc, ScrollState>(
      bloc: _scrollBloc,
      builder: (context, state) {
        if (state.theState == TheStates.success) {
          final data = state.result
              .map(
                (e) => self.Result.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList();
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.hasReachedMax ? data.length : data.length + 1,
              itemBuilder: (context, index) {
                if (index >= data.length) {
                  _scrollBloc.add(
                    FetchItemsEvent(
                      kMyTaskEntityServices,
                      {
                        "is_requested": true,
                      },
                      false,
                    ),
                  );
                  return BottomLoader();
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TaskCard(
                    isRange: data[index].isRange ?? false,
                    id: data[index].id,
                    buttonLabel: 'View Details',
                    startRate: '${data[index].budgetFrom ?? 0}',
                    endRate: '${data[index].budgetTo ?? 0}',
                    budgetType: '${data[index].budgetType}',
                    count: data[index].viewsCount.toString(),
                    imageUrl: data[index].createdBy?.profileImage ??
                        kServiceImageNImg,
                    location: data[index].location == ''
                        ? 'Remote'
                        : data[index].location,
                    endHour: Jiffy(
                      data[index].createdAt.toString(),
                    ).jm,
                    endDate: Jiffy(
                      data[index].endDate.toString(),
                    ).yMMMMd,
                    taskName: data[index].title,
                    isOwner: true,
                    editCallback: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.75,
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              left: 8,
                              right: 8,
                              top: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                EditTaskEntityServiceForm(
                                  id: data[index].id ?? "",
                                  isRequested: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    callback: () {
                      context.read<TaskBloc>().add(
                          SingleEntityTaskLoadInitiated(
                              id: data[index].id ?? ''));
                      Navigator.pushNamed(context, SingleTaskPage.routeName);
                    },
                    onTapCallback: () {},
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
