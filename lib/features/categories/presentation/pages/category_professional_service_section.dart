import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
                    ? kServiceImageNImg
                    : state.taskEntityServiceModel.result?[index].images!.first
                            .media ??
                        kServiceImageNImg,
                title: state.taskEntityServiceModel.result?[index].title ?? '',
                description:
                    '${state.taskEntityServiceModel.result?[index].createdBy?.firstName ?? ''} ${state.taskEntityServiceModel.result?[index].createdBy?.lastName ?? ''}',
                location:
                    '${state.taskEntityServiceModel.result?[index].city?.name ?? ''}, ${state.taskEntityServiceModel.result?[index].city?.country?.name ?? ''}',
                rating: state.taskEntityServiceModel.result?[index].rating
                        ?.first.rating
                        .toString() ??
                    '5',
              );
            }
            return ServiceCard();
          }

          return Scaffold(
            appBar: CustomAppBar(
              appBarTitle:
                  state.taskEntityServiceModel.result?.first.service?.title ??
                      "Sub-Service",
            ),
            body: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormField(
                            label: 'Professional Services',
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.5,
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
                                  },
                                  child: showServiceCard(index),
                                ),
                                itemCount:
                                    state.taskEntityServiceModel.result?.length,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/beautyBanner 1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/banners/Sliding Banner.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CardLoading(
          height: 200,
        );
      },
    );
  }
}
