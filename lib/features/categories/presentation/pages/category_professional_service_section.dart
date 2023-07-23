import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../rating_reviews/presentation/bloc/rating_reviews_bloc.dart';
import '../../../user/presentation/bloc/user/user_bloc.dart';

class CategoryProfessionalServiceSection extends StatelessWidget {
  static const routeName = '/category-professional-service-section';

  const CategoryProfessionalServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
      builder: (context, state) {
        if (state.theStates == TheStates.success) {
          Widget showServiceCard(int index) {
            if (state.taskEntityServiceModel.result?.length != 0) {
              return ServiceCard(
                imagePath: state.taskEntityServiceModel.result?[index].images
                            ?.length ==
                        0
                    ? kHomaaleImg
                    : state.taskEntityServiceModel.result?[index].images!.first
                            .media ??
                        kHomaaleImg,
                title: state.taskEntityServiceModel.result?[index].title ?? '',
                createdBy:
                    '${state.taskEntityServiceModel.result?[index].createdBy?.firstName ?? ''} ${state.taskEntityServiceModel.result?[index].createdBy?.lastName ?? ''}',
                location:
                    '${state.taskEntityServiceModel.result?[index].city?.name ?? ''}, ${state.taskEntityServiceModel.result?[index].city?.country?.name ?? ''}',
                rating: state.taskEntityServiceModel.result?[index].rating
                            .toString() ==
                        "null"
                    ? "0.0"
                    : state.taskEntityServiceModel.result?[index].rating
                            .toString() ??
                        '0.0',
                shareCallback: () {
                  Share.share(
                    "$kShareLinks/tasks/${state.taskEntityServiceModel.result?[index].id}",
                    subject: state.taskEntityServices?[index].title,
                  );
                },
                isBookmarked: state.taskEntityServices?[index].isBookmarked,
                isOwner: state.taskEntityServices?[index].owner?.id ==
                    context.read<UserBloc>().state.taskerProfile?.user?.id,
                rateTo: double.parse(
                        state.taskEntityServices?[index].payableTo ?? "")
                    .toInt()
                    .toString(),
                rateFrom: double.parse(
                        state.taskEntityServices?[index].payableFrom ?? "")
                    .toInt()
                    .toString(),
                isRange: state.taskEntityServices?[index].isRange,
                // theHeight: 350.0,
              );
            }
            return CardLoading(height: 700);
          }

          return Scaffold(
            appBar: CustomAppBar(
                appBarTitle:
                    state.taskEntityServiceModel.result?.first.service?.title ??
                        "Sub-Service",
                trailingWidget: SizedBox()),
            body: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: CustomFormField(
                          label: '  Professional Services',
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () async {
                                context.read<TaskEntityServiceBloc>().add(
                                      TaskEntityServiceSingleLoaded(
                                        id: state.taskEntityServiceModel
                                                .result?[index].id ??
                                            '',
                                      ),
                                    );
                                Navigator.pushNamed(
                                  context,
                                  TaskEntityServicePage.routeName,
                                );
                              },
                              child: showServiceCard(index),
                            ),
                            itemCount:
                                state.taskEntityServiceModel.result?.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        ),
                      ),
                      // SliverToBoxAdapter(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Image.asset(
                      //       'assets/beautyBanner 1.png',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      // SliverToBoxAdapter(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Image.asset(
                      //       'assets/banners/Sliding Banner.png',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CardLoading(
          height: 700,
        );
      },
    );
  }
}
