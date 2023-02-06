import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesPage extends StatelessWidget {
  static const routeName = '/services-page';

  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nestedCategory =
        ModalRoute.of(context)?.settings.arguments as NestedCategory?;
    context.read<ServicesBloc>().add(
          ServicesLoadInitiated(nestedCategory?.id ?? 0),
        );
    return Scaffold(
      body: Column(
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
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
            child: Text(nestedCategory?.name ?? ''),
          ),
          BlocBuilder<ServicesBloc, ServicesState>(
            builder: (context, state) {
              if (state is ServicesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ServicesLoadSuccess) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Padding(
                    padding: kPadding20,
                    child: ListView(
                      children: [
                        CustomFormText(
                          name: 'Select Services',
                          child: SizedBox(
                            height: 300,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  kHeight5,
                                  Flexible(
                                    child: Text(
                                      state.list[index].title ?? '',
                                    ),
                                  ),
                                ],
                              ),
                              itemCount: state.list.length,
                            ),
                          ),
                        ),
                        kHeight20,
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Placeholder(
                            fallbackHeight: 200,
                          ),
                        ),
                        kHeight20,
                        CustomFormText(
                          name: 'Related Services',
                          child: SizedBox(
                            height: 250,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index2) =>
                                  Expanded(child: ServiceCard()),
                              itemCount: state.list.length,
                            ),
                          ),
                        ),
                        kHeight20,
                        CustomFormText(
                          name: 'Popular Tasks',
                          child: SizedBox(
                            height: 250,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index2) =>
                                  Expanded(child: ServiceCard()),
                              itemCount: state.list.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox.expand();
              }
            },
          ),
        ],
      ),
    );
  }
}
