import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/presentation/pages/category_professional_service_section.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  static const routeName = '/services-page';

  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nestedCategory =
        ModalRoute.of(context)?.settings.arguments as NestedCategory?;
    context.read<ServicesBloc>().add(
          ServicesLoadInitiated(
            categoryId: nestedCategory?.id ?? 0,
          ),
        );
    return Scaffold(
      appBar: CustomAppBar(
          appBarTitle: nestedCategory?.name ?? '', trailingWidget: SizedBox()),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                if (state.theStates == TheStates.initial) {
                  return const Center(
                    child: CardLoading(height: 700),
                  );
                }
                if (state.theStates == TheStates.success) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormField(
                            label: 'Select Services',
                            child: state.serviceList?.length == 0
                                ? Text(
                                    "No services available",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: 1.2,
                                  ),
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () async {
                                      context
                                          .read<TaskEntityServiceBloc>()
                                          .add(
                                            TaskEntityServiceInitiated(
                                              serviceId: state
                                                      .serviceList?[index]
                                                      .id ??
                                                  '',
                                            ),
                                          );

                                      await Navigator.pushNamed(
                                        context,
                                        CategoryProfessionalServiceSection
                                            .routeName,
                                      );
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(
                                              10,
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:  NetworkImage(
                                                state.serviceList?[index].images?.length == 0 ? kHomaaleImg :
                                                state.serviceList?[index].images?.first.media.toString() ?? kHomaaleImg,
                                              ),
                                              // AssetImage(
                                              //   "assets/services/1.png",
                                              // ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: AutoSizeText(
                                            state.serviceList?[index]
                                                    .title ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            minFontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  itemCount: state.serviceList?.length,
                                  padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                                ),
                          ),
                        ),
                      ),
                      //TODO:Implement Advertisement here
                      // SliverToBoxAdapter(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(
                      //       8.0,
                      //     ),
                      //     child: Image.asset(
                      //       'assets/banner 1makeup_ad.png',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomFormField(
                            label: 'Related Services',
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8,
                                childAspectRatio: 1.2,
                              ),

                              itemBuilder: (context, index2) => InkWell(
                                onTap: () async {
                                  context.read<TaskEntityServiceBloc>().add(
                                        TaskEntityServiceInitiated(
                                          serviceId: state
                                                  .professionalServiceModel
                                                  ?.result?[index2]
                                                  .id ??
                                              '',
                                        ),
                                      );

                                  await Navigator.pushNamed(
                                    context,
                                    CategoryProfessionalServiceSection
                                        .routeName,
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            state.professionalServiceModel
                                              ?.result?[index2].images?.length == 0 ? kHomaaleImg :
                                            state.professionalServiceModel
                                                ?.result![index2].images?.first.media ?? kHomaaleImg,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: AutoSizeText(
                                        state.professionalServiceModel
                                                ?.result?[index2].title ??
                                            "",
                                        overflow: TextOverflow.ellipsis,
                                        minFontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              itemCount: state.professionalServiceModel
                                      ?.result?.length ??
                                  0,
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ),
                      ),
                      //TODO:Implement advertisement here
                      // SliverToBoxAdapter(
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(
                      //       8.0,
                      //     ),
                      //     child: Image.asset(
                      //       'assets/banners/Sliding Banner.png',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      // SliverToBoxAdapter(
                      //   child: CustomFormField(
                      //     label: 'Popular Tasks',
                      //     child: SizedBox(
                      //       height: 200,
                      //       child: GridView.builder(
                      //         gridDelegate:
                      //             const SliverGridDelegateWithFixedCrossAxisCount(
                      //           crossAxisCount: 2,
                      //           crossAxisSpacing: 20,
                      //           mainAxisSpacing: 10,
                      //         ),
                      //         itemBuilder: (context, index2) =>
                      //             const ServiceCard(),
                      //         itemCount: 3,
                      //         padding: EdgeInsets.zero,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  );
                } else {
                  return const SizedBox.expand();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
