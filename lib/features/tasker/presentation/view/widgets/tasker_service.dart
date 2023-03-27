import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/service_card.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerService extends StatefulWidget {
  const TaskerService({super.key, this.service});

  final EntityServiceModel? service;

  @override
  State<TaskerService> createState() => _TaskerServiceState();
}

class _TaskerServiceState extends State<TaskerService> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.service != null
          ? GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceSingleLoaded(
                            id: widget.service!.result?[index].id ?? '',
                          ),
                        );
                    Navigator.pushNamed(
                      context,
                      TaskEntityServicePage.routeName,
                    );
                  },
                  child: ServiceCard(
                    // ignore: prefer_is_empty
                    imagePath: widget.service!.result?[index].images?.length ==
                            0
                        ? kServiceImageNImg
                        : widget.service!.result?[index].images?.first.media,
                    title: widget.service!.result?[index].title ?? 'Title',
                    location:
                        widget.service!.result?[index].city?.name ?? 'City',
                    rating: widget.service!.result?[index].rating?.first.rating
                            .toString() ??
                        '0',
                  ),
                ),
              ),
              itemCount: widget.service?.result?.length ?? 0,
            )
          : const SizedBox(),
    );
  }
}
