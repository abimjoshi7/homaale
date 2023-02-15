import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/sections/sections.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingDetailsPage extends StatelessWidget {
  static const routeName = '/booking-detail-page';

  const BookingDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SingleEntityServiceCubit, SingleEntityServiceState>(
        builder: (context, state) {
          if (state is SingleEntityServiceLoadSuccess) {
            return Column(
              children: [
                addVerticalSpace(50),
                CustomHeader(
                  leadingWidget: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  trailingWidget: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                  child: const Text('Booking Details'),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomFormField(
                          label: state.result.title ?? '',
                          isRequired: false,
                          child: Text('data'),
                        ),
                      ),
                      Expanded(child: BookingDetailsFormSection()),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
