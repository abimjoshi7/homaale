import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/services/widgets/services_text_card.dart';
import 'package:cipher/features/task/presentation/bloc/task_bloc.dart';
import 'package:cipher/features/task/presentation/pages/single_task_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TasksProfile extends StatefulWidget {
  const TasksProfile({super.key});

  @override
  State<TasksProfile> createState() => _TasksProfileState();
}

class _TasksProfileState extends State<TasksProfile> {
  @override
  void initState() {
    super.initState();
    context.read<TaskBloc>().add(const MyServiceTaskLoadInitiated(isTask: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.theState == TheStates.success) {
          final data = state.selfCreatedTaskServiceModel?.result;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<TaskBloc>().add(SingleEntityTaskLoadInitiated(id: data?[index].id ?? ''));
                  Navigator.pushNamed(context, SingleTaskPage.routeName);
                },
                child: ServicesTextCard(
                  price: data?[index].budgetTo?.toString() ?? 'N/A',
                  location: data?[index].location ?? 'Shantinagar',
                  createdDate: DateFormat.yMMMEd().format(
                    data?[index].createdAt ?? DateTime.now(),
                  ),
                  address: data?[index].location ?? 'Buddhanagar, KTM',
                  title: data?[index].title ?? 'Garden Redesign',
                  viewCount: data?[index].viewsCount?.toString() ?? '0',
                  description: data?[index].description ?? '... ',
                  imagePath: data?[index].images?.length == 0
                      ? kServiceImageNImg
                      : data![index].images?.first['media'].toString(),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
