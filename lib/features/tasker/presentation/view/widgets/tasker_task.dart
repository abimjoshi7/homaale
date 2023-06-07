import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/apply_task_page.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerTask extends StatefulWidget {
  const TaskerTask({super.key});

  @override
  State<TaskerTask> createState() => _TaskerTaskState();
}

class _TaskerTaskState extends State<TaskerTask> {
  @override
  void initState() {
    super.initState();
    context.read<TaskerCubit>().loadSingleTaskerTask(context.read<TaskerCubit>().state.singleTasker.user?.id ?? '');
  }

  void onTaskPressed({
    required String id,
    required int index,
    required bool isApply,
  }) {
    if (CacheHelper.isLoggedIn == false) {
      notLoggedInPopUp(context);
    }
    if (!CacheHelper.isLoggedIn) return;
    context.read<TaskBloc>().add(SingleEntityTaskLoadInitiated(id: id));
    isApply
        ? Navigator.pushNamed(context, ApplyTaskPage.routeName)
        : Navigator.pushNamed(context, SingleTaskPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<TaskerCubit, TaskerState>(
        builder: (context, state) {
          switch (state.status) {
            case TaskerStatus.success:
              return ListView.separated(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => addVerticalSpace(16),
                itemCount: state.task.result?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => onTaskPressed(
                      id: state.task.result![index].id!,
                      index: index,
                      isApply: false,
                    ),
                    child: TaskCard(
                      isRange: state.task.result![index].isRange ?? false,
                      id: state.task.result![index].id,
                      isBookmarked: state.task.result![index].isBookmarked,
                      isOwner: state.task.result![index].createdBy?.id ==
                          context.read<UserBloc>().state.taskerProfile?.user?.id,
                      buttonLabel: 'Apply Now',
                      startRate: '${state.task.result![index].budgetFrom ?? 0}',
                      endRate: '${state.task.result![index].budgetTo ?? 0}',
                      budgetType: '${state.task.result![index].budgetType}',
                      count: state.task.result![index].count.toString(),
                      imageUrl: state.task.result![index].createdBy?.profileImage ?? kServiceImageNImg,
                      location:
                          state.task.result![index].location == '' ? 'Remote' : state.task.result![index].location,
                      endHour: Jiffy(
                        state.task.result![index].createdAt.toString(),
                      ).jm,
                      endDate: Jiffy(
                        state.task.result![index].endDate.toString(),
                      ).yMMMMd,
                      taskName: state.task.result![index].title,
                      callback: () => onTaskPressed(
                        id: state.task.result![index].id!,
                        index: index,
                        isApply: true,
                      ),
                    ),
                  );
                },
              );

            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
