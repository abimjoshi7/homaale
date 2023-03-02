import 'package:cipher/core/constants/strings.dart';
import 'package:cipher/features/profile/presentation/pages/services/widgets/services_text_card.dart';
import 'package:cipher/features/services/presentation/manager/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
              padding: EdgeInsets.zero,
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
                createdDate: DateFormat.yMMMEd().format(
                  data?[index].createdAt ?? DateTime.now(),
                ),
                address: data?[index].location ?? 'Buddhanagar, KTM',
                title: data?[index].title ?? 'Garden Redesign',
                viewCount: data?[index].viewsCount.toString(),
                description: data?[index].description ?? '... ',
                imagePath: data![index].images!.isEmpty
                    ? kServiceImageNImg
                    : data[index].images?.first.media,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
