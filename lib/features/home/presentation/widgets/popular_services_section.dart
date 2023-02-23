import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/services/presentation/manager/professional_service_bloc/professional_service_bloc.dart';
import 'package:cipher/features/services/presentation/pages/popular_services_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularServicesSection extends StatelessWidget {
  const PopularServicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfessionalServiceBloc, ProfessionalServiceState>(
      builder: (context, state) {
        if (state is ProfessionalServiceLoadSuccess) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SectionHeading(
                  labelName: 'Popular services',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PopularServicesPage.routeName,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.model.result?.length ?? 0,
                    separatorBuilder: (context, index) => addHorizontalSpace(
                      10,
                    ),
                    itemBuilder: (context, index) => ServiceCard(
                      title: state.model.result?[index].title,
                      imagePath:
                          'https://sahyadrihospital.com/wp-content/uploads/2021/09/root-canal-treatment-side-effects.jpg',
                      description: state.model.result?[index].description,
                      rating: state.model.result?[index].viewsCount.toString(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
