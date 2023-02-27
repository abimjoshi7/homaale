import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/features/services/presentation/manager/professional_service_category_bloc/professional_service_category_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularServicesPage extends StatelessWidget {
  static const routeName = '/popular-services-page';
  const PopularServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfessionalServiceCategoryBloc,
          ProfessionalServiceCategoryState>(
        builder: (context, state) {
          if (state is ProfessionalServiceCategoryLoadSuccess) {
            final data = state.model.result;
            return Column(
              children: [
                addVerticalSpace(
                  50,
                ),
                const CustomHeader(
                  label: 'Popular Services',
                ),
                const Divider(),
                SizedBox(
                  height: 35,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    children: [
                      const Icon(
                        Icons.filter_alt_outlined,
                        color: kColorSilver,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Category',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Buddhanagar',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                      ChoiceChip(
                        label: Row(
                          children: const [
                            Text(
                              'Any Price',
                            ),
                            Icon(Icons.keyboard_arrow_down_outlined)
                          ],
                        ),
                        backgroundColor: Colors.white,
                        side: const BorderSide(color: kColorGrey),
                        selected: false,
                        disabledColor: Colors.white,
                      ),
                      addHorizontalSpace(5),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ServiceCard(
                        title: data?[index].title,
                      ),
                    ),
                    itemCount: data?.length,
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
