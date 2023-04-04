import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
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

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    context.read<NestedCategoriesCubit>().getNestedCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            trailingWidget: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            child: const Text('Categories'),
          ),
          const CustomHorizontalDivider(),
          Expanded(
            child: BlocBuilder<NestedCategoriesCubit, NestedCategoriesState>(
              builder: (context, state) {
                Widget displaySideCategory() {
                  if (state is NestedCategoriesLoadSuccess) {
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: state.nestedCategory.length,
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ColoredBox(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            child: CategoriesIcons(
                              onTap: () async {
                                setState(
                                  () {
                                    selectedIndex = index;
                                    list =
                                        state.nestedCategory[index].child ?? [];
                                  },
                                );
                                if (state
                                    .nestedCategory[index].child!.isEmpty) {
                                  context.read<ServicesBloc>().add(
                                        ServicesLoadInitiated(
                                          categoryId:
                                              state.nestedCategory[index].id ??
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
                                  color: Colors.white,
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
                                child: CircularProgressIndicator(),
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
                                                        height: 90,
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
                      color: kColorLightSkyBlue,
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
