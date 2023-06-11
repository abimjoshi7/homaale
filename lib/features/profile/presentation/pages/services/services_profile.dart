import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/helpers/scroll_helper.dart';
import 'package:cipher/features/bloc/scroll_bloc.dart';
import 'package:cipher/features/rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import 'package:cipher/features/services/data/models/self_created_task_service.dart'
    as self;
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/edit_task_entity_service_page.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/locator.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServicesProfile extends StatefulWidget {
  const ServicesProfile({super.key});

  @override
  State<ServicesProfile> createState() => _ServicesProfileState();
}

class _ServicesProfileState extends State<ServicesProfile> {
  final _controller = ScrollController();
  final _scrollBloc = locator<ScrollBloc>();

  @override
  void initState() {
    super.initState();
    _scrollBloc.add(
      FetchItemsEvent(
        kMyTaskEntityServices,
        {
          "is_requested": false,
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
                "is_requested": false,
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
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.hasReachedMax ? data.length : data.length + 1,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                if (index >= data.length) {
                  _scrollBloc.add(
                    FetchItemsEvent(
                      kMyTaskEntityServices,
                      {
                        "is_requested": false,
                      },
                      false,
                    ),
                  );
                  return BottomLoader();
                }
                return GestureDetector(
                  onTap: () {
                    context.read<TaskEntityServiceBloc>().add(
                          TaskEntityServiceSingleLoaded(
                            id: data[index].id ?? '',
                          ),
                        );
                    Navigator.pushNamed(
                        context, TaskEntityServicePage.routeName);
                  },
                  child: ServiceCard(
                    callback: () {
                      context.read<TaskEntityServiceBloc>().add(
                            TaskEntityServiceSingleLoaded(
                              id: data[index].id ?? "",
                            ),
                          );

                      context.read<RatingReviewsBloc>().add(SetToInitial(
                            id: data[index].id ?? "",
                          ));

                      Navigator.pushNamed(
                        context,
                        TaskEntityServicePage.routeName,
                      );
                    },
                    title: data[index].title,
                    imagePath: data[index].images?.length == 0
                        ? kServiceImageNImg
                        : data[index].images?.first.media.toString(),
                    createdBy:
                        "${data[index].createdBy?.firstName} ${data[index].createdBy?.lastName}",
                    description: data[index].description,
                    location: data[index].location == ''
                        ? "Remote"
                        : data[index].location,
                    rateTo: double.parse(data[index].payableTo ?? "")
                        .toInt()
                        .toString(),
                    rateFrom: double.parse(data[index].payableFrom ?? "")
                        .toInt()
                        .toString(),
                    isRange: data[index].isRange,
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
                                  id: data[index].id ?? "",
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    shareCallback: () {
                      Share.share(
                        "$kShareLinks/service/${data[index].id}",
                        subject: data[index].title,
                      );
                    },
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
