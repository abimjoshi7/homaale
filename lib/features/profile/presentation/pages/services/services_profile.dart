import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServicesProfile extends StatefulWidget {
  const ServicesProfile({super.key});

  @override
  State<ServicesProfile> createState() => _ServicesProfileState();
}

class _ServicesProfileState extends State<ServicesProfile> {
  @override
  void initState() {
    super.initState();
    context
        .read<TaskEntityServiceBloc>()
        .add(MyTESLoadInitiated(isTask: false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          final data = state.selfCreatedTaskService?.result;
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
                  context.read<TaskEntityServiceBloc>().add(
                      TaskEntityServiceSingleLoaded(id: data?[index].id ?? ''));
                  Navigator.pushNamed(context, TaskEntityServicePage.routeName);
                },
                child: ServiceCard(
                  callback: () {
                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceSingleLoaded(
                            id: data?[index].id ?? "",
                          ),
                        );

                    context.read<RatingReviewsBloc>().add(SetToInitial(
                          id: data?[index].id ?? "",
                        ));

                    Navigator.pushNamed(
                      context,
                      TaskEntityServicePage.routeName,
                    );
                  },
                  title: data?[index].title,
                  imagePath: data?[index].images?.length == 0
                      ? kServiceImageNImg
                      : data?[index].images?.first.media.toString(),
                  createdBy:
                      "${data?[index].createdBy?.firstName} ${data?[index].createdBy?.lastName}",
                  description: data?[index].description,
                  location: data?[index].location == ''
                      ? "Remote"
                      : data?[index].location,
                  rateTo: double.parse(data?[index].payableTo ?? "")
                      .toInt()
                      .toString(),
                  rateFrom: double.parse(data?[index].payableFrom ?? "")
                      .toInt()
                      .toString(),
                  isRange: data?[index].isRange,
                  isBookmarked: false,
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
                                id: data?[index].id ?? "",
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  shareCallback: () {
                    Share.share(
                      "$kShareLinks/service/${data?[index].id}",
                      subject: data?[index].title,
                    );
                  },
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
