import 'package:cipher/features/profile/presentation/pages/services/widgets/services_text_card.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesProfile extends StatelessWidget {
  const ServicesProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        if (state is MyCreatedServicesLoadSuccess) {
          final data = state.list.result;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => ServicesTextCard(
                price: data?[index].budgetTo.toString() ?? 'Rs 2000',
                location: data?[index].location ?? 'Shantinagar',
                reviewNumber: '4.5(200)',
                address: 'Buddhanagar, KTM',
                title: data?[index].title ?? 'Garden Redesign',
                imagePath: 'assets/Casual life 3D - 43.png',
                description:
                    'Almost no computer knowledge, socan provide the fitness for... ',
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
