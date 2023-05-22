import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/search/presentation/pages/search_page.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/services/presentation/pages/services_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  static const routeName = '/categories-page';
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
                          if (element.name == routeArgs?['category']) {
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
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ColoredBox(
                            color: selectedIndex == index
                                ? Theme.of(context).cardColor
                                : Theme.of(context).cardColor,
                            child: SizedBox(
                              height: 80,
                              child: CategoriesIcons(
                                onTap: () async {
                                  setState(
                                    () {
                                      checkFromRoute = false;
                                      selectedIndex = index;
                                      list =
                                          state.nestedCategory[index].child ??
                                              [];
                                    },
                                  );
                                  if (state
                                      .nestedCategory[index].child!.isEmpty) {
                                    context.read<ServicesBloc>().add(
                                          ServicesLoadInitiated(
                                            categoryId: state
                                                    .nestedCategory[index].id ??
                                                0,
                                          ),
                                        );

                                    await Navigator.pushNamed(
                                      context,
                                      ServicesPage.routeName,
                                      arguments: state.nestedCategory[index],
                                    );
                                  }
                                },
                                data: state.nestedCategory[index].name ?? '',
                                color: randomColorGenerator(),
                                child: SizedBox(
                                  height: 18,
                                  width: 18,
                                  child: SvgPicture.string(
                                    state.nestedCategory[index].icon
                                            ?.toString() ??
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
                        ],
                      ),
                      separatorBuilder: (context, index) => kHeight20,
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

                                    await Navigator.pushNamed(
                                      context,
                                      ServicesPage.routeName,
                                      arguments: list[index],
                                    );
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
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
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
                                                    context
                                                        .read<ServicesBloc>()
                                                        .add(
                                                          ServicesLoadInitiated(
                                                            categoryId:
                                                                list[index]
                                                                        .id ??
                                                                    0,
                                                          ),
                                                        );

                                                    await Navigator.pushNamed(
                                                      context,
                                                      ServicesPage.routeName,
                                                      arguments: list[index]
                                                          .child![index3],
                                                    );
                                                  },
                                                  child: Column(
                                                    children: <Widget>[
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.blueGrey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10,
                                                          ),
                                                        ),
                                                        height: 40,
                                                      ),
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
                    Container(
                      height: MediaQuery.of(context).size.height - 98,
                      color: Theme.of(context).canvasColor,
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: displaySideCategory(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 98,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Padding(
                        padding: kPadding20,
                        child: displayNestedCategory(),
                      ),
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
