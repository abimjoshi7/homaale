import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/task_entity_service_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CategoryProfessionalServiceSection extends StatelessWidget {
  static const routeName = '/category-professional-service-section';

  const CategoryProfessionalServiceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaskEntityServiceBloc, TaskEntityServiceState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.theStates == TheStates.initial) {
            return const Center(
              child: CardLoading(
                height: 200,
              ),
            );
          }
          if (state.theStates == TheStates.success) {
            if (state.taskEntityServiceModel?.result == null ||
                    state.taskEntityServiceModel?.result?.length == 0
                // state.professionalServiceModel?.result == null ||
                // state.professionalServiceModel?.result?.length == 0
                ) {
              return Scaffold(
                body: Center(
                  child: Text("No services to load"),
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
                    );
                  },
                  label: Text(
                    "Home",
                  ),
                ),
              );
            } else {
              int itemCount() {
                if (state.taskEntityServiceModel != null ||
                    state.taskEntityServiceModel?.result?.length != 0) {
                  return state.taskEntityServiceModel?.result?.length ?? 0;
                } else {
                  return 0;
                  //!!!changes to be reviewed
                  // return state.professionalServiceModel?.result?.length ?? 0;
                }
              }

              Widget displayAppBarTitle() {
                if (state.taskEntityServiceModel != null ||
                    state.taskEntityServiceModel?.result?.length != 0) {
                  return Text(state.taskEntityServiceModel?.result?.first
                          .service?.title ??
                      "Sub-Service");
                } else {
                  return Text("Sub-Service");
                  //!!!changes to be reviewed
                  // return Text(
                  //     state.professionalServiceModel?.result?.first.title ??
                  //         "Sub-Service");
                }
              }

              Widget showServiceCard(int index) {
                if (state.taskEntityServiceModel != null ||
                    state.taskEntityServiceModel?.result?.length != 0) {
                  return ServiceCard(
                    imagePath: state.taskEntityServiceModel?.result?[index]
                                .images?.length ==
                            0
                        ? kServiceImageNImg
                        : state.taskEntityServiceModel?.result?[index].images!
                                .first.media ??
                            kServiceImageNImg,
                    title: state.taskEntityServiceModel?.result?[index].title ??
                        '',
                    description:
                        '${state.taskEntityServiceModel?.result?[index].createdBy?.firstName ?? ''} ${state.taskEntityServiceModel?.result?[index].createdBy?.lastName ?? ''}',
                    location:
                        '${state.taskEntityServiceModel?.result?[index].city?.name ?? ''}, ${state.taskEntityServiceModel?.result?[index].city?.country?.name ?? ''}',
                    rating: state.taskEntityServiceModel?.result?[index].rating
                            ?.first.rating
                            .toString() ??
                        '5',
                  );
                } else {
                  //!!!changes to be reviewed
                  return ServiceCard(
                      // imagePath: state.professionalServiceModel?.result?[index]
                      //             .images?.length ==
                      //         0
                      //     ? kServiceImageNImg
                      //     : state.professionalServiceModel?.result?[index].images!
                      //             .first.media ??
                      //         kServiceImageNImg,
                      // title:
                      //     state.professionalServiceModel?.result?[index].title ??
                      //         '',
                      // description:
                      // '${state.professionalServiceModel?.result?[index].createdBy?. ?? ''} ${state.service?.result?[index].createdBy?.lastName ?? ''}',
                      // location:
                      //     '${state.professionalServiceModel?.result?[index].city?.name ?? ''}, ${state.service?.result?[index].city?.country?.name ?? ''}',
                      // rating: state.professionalServiceModel?.result?[index].?.first.rating
                      //         .toString() ??
                      //     '5',
                      );
                }
              }

              return Column(
                children: [
                  kHeight50,
                  CustomHeader(
                    leadingWidget: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    trailingWidget: IconButton(
                      onPressed: () async {
                        Navigator.pushNamed(
                          context,
                          SearchPage.routeName,
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                    child: displayAppBarTitle(),
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomFormField(
                              label: 'Professional Services',
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.37,
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
                                                      ?.result?[index].id ??
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
                                  itemCount: itemCount(),
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
                        // SliverToBoxAdapter(
                        //   child: CustomFormField(
                        //     label: 'Popular Services',
                        //     child: SizedBox(
                        //       height: MediaQuery.of(context).size.height * 0.3,
                        //       child: ListView.separated(
                        //         padding: EdgeInsets.zero,
                        //         scrollDirection: Axis.horizontal,
                        //         itemBuilder: (context, index) =>
                        //             CustomImageTextBox(
                        //           image: Image.asset('assets/services/111.png'),
                        //           text: 'Machine Repair',
                        //         ),
                        //         itemCount: 5,
                        //         separatorBuilder: (context, index) => kWidth10,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SliverToBoxAdapter(
                        //   child: CustomFormField(
                        //     label: 'Verified Services',
                        //     child: SizedBox(
                        //       height: 250,
                        //       child: GridView.builder(
                        //         gridDelegate:
                        //             const SliverGridDelegateWithFixedCrossAxisCount(
                        //           crossAxisCount: 2,
                        //           crossAxisSpacing: 10,
                        //         ),
                        //         itemBuilder: (context, index) => ServiceCard(
                        //           title:
                        //               state.service?.result?[index].title ?? '',
                        //           description: state.service?.result?[index]
                        //                   .service?.title ??
                        //               '',
                        //           location:
                        //               state.service?.result?[index].location ??
                        //                   '',
                        //           rating: state.service?.result?[index].rating
                        //                   ?.first.rating
                        //                   .toString() ??
                        //               '5',
                        //         ),
                        //         itemCount: state.service?.result?.length ?? 0,
                        //         padding: EdgeInsets.zero,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/banners/Sliding Banner.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // SliverToBoxAdapter(
                        //   child: CustomFormField(
                        //     label: 'Tasks you may like',
                        //     child: SizedBox(
                        //       height: 400,
                        //       child: ListView.separated(
                        //         itemBuilder: (context, index) => TaskCard(
                        //           callback: () {},
                        //         ),
                        //         separatorBuilder: (context, index) => kHeight10,
                        //         itemCount: 5,
                        //         padding: EdgeInsets.zero,
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              );
            }
          } else {
            return const Center(
              child: Text(
                'Services cannot be loaded at the moment. Please try again later.',
              ),
            );
          }
        },
      ),
    );
  }
}
