import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/categories/presentation/cubit/nested_categories_cubit.dart';
import 'package:cipher/features/services/data/models/services_list.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: SizedBox(
        child: Column(
          children: [
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
            BlocConsumer<NestedCategoriesCubit, NestedCategoriesState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                Widget displaySideCategory() {
                  if (state is NestedCategoriesLoadSuccess) {
                    return ListView.separated(
                      itemCount: state.nestedCategory.length,
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ColoredBox(
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            child: CategoriesIcons(
                              onTap: () {
                                setState(
                                  () {
                                    selectedIndex = index;
                                    list =
                                        state.nestedCategory[index].child ?? [];
                                    print(list);
                                  },
                                );
                                // if (list.isEmpty) {
                                //   Navigator.pushNamed(
                                //     context,
                                //     ServiceProviderPage.routeName,
                                //   );
                                // }
                                // print(
                                //   state.nestedCategory[index].toJson(),
                                // );
                                // print(selectedIndex.isEven);
                              },
                              data: state.nestedCategory[index].name ?? '',
                            ),
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) => kHeight20,
                      // children: [
                      //   Text('data'),
                      // ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                Widget displayNestedCategory() {
                  if (state is NestedCategoriesLoadSuccess) {
                    return ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) => kHeight5,
                      itemBuilder: (context, index) => Card(
                        child: BlocBuilder<ServicesBloc, ServicesState>(
                          builder: (context, serviceState) {
                            List<ServiceList> servicesList = [];
                            if (serviceState is ServicesLoadSuccess) {
                              servicesList = serviceState.list;
                            }
                            Widget displayChild() {
                              if (serviceState is ServicesLoadSuccess) {
                                return Text(
                                  serviceState.list.first.title ?? '',
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }

                            return ExpansionTile(
                              title: Text(
                                list[index].name ?? '',
                              ),
                              onExpansionChanged: (value) {
                                context.read<ServicesBloc>().add(
                                      ServicesLoadInitiated(
                                        list[index].id ?? 0,
                                      ),
                                    );
                                // if (serviceState is ServicesLoadSuccess) {
                                //   for (var x in serviceState.list) {
                                //     print(x.title);
                                //   }
                                // }
                              },
                              children: List.generate(
                                servicesList.length,
                                (index) => SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: GridView(
                                    children: [Icon(Icons.add)],
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                            childAspectRatio: 0.2),
                                  ),
                                ),
                                // (index) => Column(
                                //   children: [
                                //     Container(
                                //       color: Colors.red,
                                //       height: 60,
                                //       width: 80,
                                //     ),
                                //     kHeight5,
                                //     Text('data'),
                                //   ],
                                // ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }

                return Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 98,
                      color: const Color(0xffF7FAFF),
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
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height - 98,
            //     color: Colors.red,
            //     width: MediaQuery.of(context).size.width * 0.25,
            //     child: ListView(
            //       children: [
            //         Text('data'),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
