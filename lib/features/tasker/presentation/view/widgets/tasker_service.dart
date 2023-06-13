import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/task_entity_service/data/models/task_entity_service_model.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/features/tasker/presentation/bloc/tasker_bloc.dart';
import 'package:cipher/features/tasker/presentation/cubit/tasker_cubit.dart';
import 'package:cipher/widgets/service_card.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/api_constants.dart';
import '../../../../user/presentation/bloc/user/user_bloc.dart';

class TaskerService extends StatefulWidget {
  const TaskerService({super.key, this.service});

  final TaskEntityServiceModel? service;

  @override
  State<TaskerService> createState() => _TaskerServiceState();
}

class _TaskerServiceState extends State<TaskerService> {
  @override
  void initState() {
    super.initState();
    context.read<TaskerCubit>().loadSingleTaskerServices(
        context.read<TaskerCubit>().state.singleTasker.user?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskerCubit, TaskerState>(
        builder: (context, state) {
          switch (state.status) {
            case TaskerStatus.success:
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemCount: state.service.result?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      context.read<TaskEntityServiceBloc>().add(
                            TaskEntityServiceSingleLoaded(
                              id: state.service.result?[index].id ?? '',
                            ),
                          );
                      Navigator.pushNamed(
                        context,
                        TaskEntityServicePage.routeName,
                      );
                    },
                    child: ServiceCard(
                      location: state.service.result?[index].location == ""
                          ? "Remote"
                          : state.service.result?[index].location,
                      createdBy:
                          "${state.service.result?[index].createdBy?.firstName} ${state.service.result?[index].createdBy?.lastName}",
                      title: state.service.result?[index].title,
                      imagePath: state.service.result?[index].images?.length ==
                              0
                          ? kHomaaleImg
                          : state.service.result?[index].images?.first.media,
                      shareCallback: () {
                        Share.share(
                          "$kShareLinks/services/${state.service.result?[index].id}",
                          subject: state.service.result?[index].title,
                        );
                      },
                      rating: state.service.result?[index].rating.toString(),
                      isRange: state.service.result?[index].isRange,
                      rateTo: double.parse(
                              state.service.result?[index].payableTo ?? "")
                          .toInt()
                          .toString(),
                      rateFrom: double.parse(
                              state.service.result?[index].payableFrom ?? "")
                          .toInt()
                          .toString(),
                      isBookmarked: state.service.result?[index].isBookmarked,
                      isOwner: state.service.result?[index].owner?.id ==
                          context
                              .read<UserBloc>()
                              .state
                              .taskerProfile
                              ?.user
                              ?.id,
                      id: state.service.result?[index].id,
                    ),
                  ),
                ),
              );
            default:
              return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
