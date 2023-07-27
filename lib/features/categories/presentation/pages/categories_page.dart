import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/categories/presentation/pages/widget/TaskOrServiceSectionModalBottomSheet.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../services/presentation/pages/trending_services_page.dart';
import '../../../task/presentation/pages/all_task_page.dart';
import '../../../task_entity_service/presentation/bloc/task_entity_service_bloc.dart';

class CategoriesPage extends StatefulWidget {
  static const routeName = '/categories-page';
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TheModalBottomSheet {
  List<NestedCategory> list = [];
  late int selectedIndex;
  bool checkFromRoute = true;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    context.read<NestedCategoriesCubit>().getNestedCategory();
    context.read<ServicesBloc>().add(ProfessionalServicesLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Categories",
        trailingWidget: SizedBox.shrink(),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<NestedCategoriesCubit, NestedCategoriesState>(
              builder: (context, state) {
                Widget displaySideCategory() {
                  if (state is NestedCategoriesLoadSuccess) {
                    if (checkFromRoute) {
                      final routeArgs = ModalRoute.of(context)
                          ?.settings
                          .arguments as Map<String, dynamic>?;
                      if (routeArgs?['id'] != -1) {
                        for (var element in state.nestedCategory) {
                          if (element.name?.toLowerCase() ==
                              routeArgs?['category'].toString().toLowerCase()) {
                            selectedIndex =
                                state.nestedCategory.indexOf(element);
                            list =
                                state.nestedCategory[selectedIndex].child ?? [];
                          }
                        }
                      } else {
                        if (state.nestedCategory.length > 0) {
                          selectedIndex = 0;
                          list = state.nestedCategory[0].child ?? [];
                        }
                      }
                    }
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.nestedCategory.length,
                      itemBuilder: (context, index) => ColoredBox(
                        color: selectedIndex == index
                            ? kColorBlue
                            // Theme.of(context).cardColor
                            : Colors.transparent,
                        child: SizedBox(
                          height: 80,
                          child: CategoriesIcons(
                            onTap: () async {
                              setState(
                                () {
                                  checkFromRoute = false;
                                  selectedIndex = index;
                                  list =
                                      state.nestedCategory[index].child ?? [];
                                },
                              );
                              if (state.nestedCategory[index].child!.isEmpty) {
                                if (TaskOrServiceSectionModalBottomSheet
                                        .selectedService.index ==
                                    0) {
                                  context.read<ServicesBloc>().add(
                                        ServicesLoadInitiated(
                                          categoryId:
                                              state.nestedCategory[index].id ??
                                                  0,
                                        ),
                                      );
                                  print(state.nestedCategory[index].id);
                                  print(context
                                      .read<ServicesBloc>()
                                      .state
                                      .serviceList
                                      ?.first
                                      .title);
                                  // Navigator.pushNamed(
                                  //     context, AllTaskPage.routeName,
                                  //     arguments: {
                                  //       'category':
                                  //           state.nestedCategory[index].name,
                                  //     });
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    TrendingServicesPage.routeName,
                                  );
                                }
                              }
                            },
                            data: state.nestedCategory[index].name ?? '',
                            color: randomColorGenerator(),
                            child: SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.string(
                                state.nestedCategory[index].icon?.toString() ??
                                    kErrorSvg,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => addVerticalSpace(
                        4,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                Widget displayNestedCategory() {
                  if (state is NestedCategoriesLoadSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: list.length,
                      separatorBuilder: (context, index) => kHeight5,
                      itemBuilder: (context, index) => Card(
                        child: BlocBuilder<ServicesBloc, ServicesState>(
                          builder: (context, serviceState) {
                            if (serviceState.theStates == TheStates.initial) {
                              return const Center(
                                child: CardLoading(
                                  height: 200,
                                ),
                              );
                            }
                            if (serviceState.theStates == TheStates.success) {
                              if (list[index].child!.isEmpty) {
                                return ListTile(
                                  onTap: () async {
                                    context.read<ServicesBloc>().add(
                                          ServicesLoadInitiated(
                                            categoryId: list[index].id ?? 0,
                                          ),
                                        );
                                    if (TaskOrServiceSectionModalBottomSheet
                                            .selectedService.index ==
                                        0) {
                                      Navigator.pushNamed(
                                        context,
                                        AllTaskPage.routeName,
                                        // arguments: {
                                        //   'category': list[index].name,
                                        // },
                                      );
                                    } else {
                                      Navigator.pushNamed(
                                        context,
                                        TrendingServicesPage.routeName,
                                      );
                                    }
                                    // await Navigator.pushNamed(
                                    //   context,
                                    //   ServicesPage.routeName,
                                    //   arguments: list[index],
                                    // );
                                  },
                                  title: Text(list[index].name ?? ''),
                                );
                              } else {
                                return ExpansionTile(
                                  title: Text(
                                    list[index].name ?? '',
                                  ),
                                  children: list[index].child!.isNotEmpty
                                      ? List.generate(
                                          1,
                                          (index2) => Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: ConstrainedBox(
                                              constraints: BoxConstraints.loose(
                                                Size(
                                                  double.maxFinite,
                                                  150,
                                                ),
                                              ),
                                              child: GridView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount:
                                                    list[index].child!.length,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 10,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 0.8,
                                                ),
                                                itemBuilder:
                                                    (context, index3) =>
                                                        InkWell(
                                                  onTap: () async {
                                                    if (TaskOrServiceSectionModalBottomSheet
                                                            .selectedService
                                                            .index ==
                                                        0) {
                                                      context
                                                          .read<
                                                              TaskEntityServiceBloc>()
                                                          .add(
                                                              TaskEntityServiceInitiated(
                                                            serviceId: context
                                                                    .read<
                                                                        ServicesBloc>()
                                                                    .state
                                                                    .serviceList?[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                          ));
                                                      Navigator.pushNamed(
                                                          context,
                                                          AllTaskPage.routeName,
                                                          arguments: {
                                                            'category': list[
                                                                    index]
                                                                .child![index3]
                                                                .name,
                                                          });
                                                    } else {
                                                      context
                                                          .read<
                                                              TaskEntityServiceBloc>()
                                                          .add(
                                                              TaskEntityServiceInitiated(
                                                            serviceId: context
                                                                    .read<
                                                                        ServicesBloc>()
                                                                    .state
                                                                    .serviceList?[
                                                                        index]
                                                                    .id ??
                                                                '',
                                                          ));
                                                      Navigator.pushNamed(
                                                        context,
                                                        TrendingServicesPage
                                                            .routeName,
                                                      );
                                                    }
                                                    // context
                                                    //     .read<ServicesBloc>()
                                                    //     .add(
                                                    //       ServicesLoadInitiated(
                                                    //         categoryId:
                                                    //             list[index]
                                                    //                     .id ??
                                                    //                 0,
                                                    //       ),
                                                    //     );
                                                    //
                                                    // await Navigator.pushNamed(
                                                    //   context,
                                                    //   ServicesPage.routeName,
                                                    //   arguments: list[index]
                                                    //       .child![index3],
                                                    // );
                                                  },
                                                  child: Column(
                                                    children: <Widget>[
                                                      // Container(
                                                      //   decoration:
                                                      //       BoxDecoration(
                                                      //     color:
                                                      //         Colors.blueGrey,
                                                      //     borderRadius:
                                                      //         BorderRadius
                                                      //             .circular(
                                                      //       10,
                                                      //     ),
                                                      //   ),
                                                      //   height: 40,
                                                      //   child: Image.network(list[index]
                                                      //       .child![
                                                      //   index3]. ??""),
                                                      // ),
                                                      Flexible(
                                                        child: Text(
                                                          list[index]
                                                                  .child![
                                                                      index3]
                                                                  .name ??
                                                              '',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : [],
                                );
                              }
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                return Row(
                  children: <Widget>[
                    Expanded(
                      child: displaySideCategory(),
                    ),
                    addHorizontalSpace(
                      4,
                    ),
                    Expanded(
                      flex: 4,
                      child: displayNestedCategory(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
