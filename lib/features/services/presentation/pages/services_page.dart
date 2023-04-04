import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/categories/data/models/nested_category.dart';
import 'package:cipher/features/services/presentation/manager/entity_service_bloc.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:cipher/features/categories/presentation/pages/category_professional_service_section.dart';
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
      body: Column(
        children: <Widget>[
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
          Expanded(
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                if (state.theStates == TheStates.initial) {
                  return const Center(
                    child: CardLoading(height: 200),
                  );
                }
                if (state.theStates == TheStates.success) {
                  return CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormField(
                            label: 'Select Services',
                            child: SizedBox(
                              height: 200,
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () async {
                                    context.read<EntityServiceBloc>().add(
                                          EntityServiceInitiated(
                                              // state.list[index].id ?? '',
                                              ),
                                        );
                                    await Navigator.pushNamed(
                                      context,
                                      CategoryProfessionalServiceSection
                                          .routeName,
                                    );
                                  },
                                  child: CustomImageTextBox(
                                    image: Image.asset(
                                      'assets/services/Rectangle 3823.png',
                                    ),
                                    text: state.serviceList?[index].title,
                                  ),
                                ),
                                itemCount: state.serviceList?.length,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormField(
                            label: 'Related Services',
                            child: SizedBox(
                              height: 200,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index2) =>
                                    const ServiceCard(),
                                itemCount: 3,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: kPadding20,
                          child: CustomFormField(
                            label: 'Popular Tasks',
                            child: SizedBox(
                              height: 200,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10,
                                ),
                                itemBuilder: (context, index2) =>
                                    const ServiceCard(),
                                itemCount: 3,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ),
                      )
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
