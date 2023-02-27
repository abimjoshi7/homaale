import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/bookings/presentation/widgets/edit_my_order.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/service_provider_page.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingsMyOrder extends StatelessWidget {
  const BookingsMyOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingsBloc, BookingsState>(
      builder: (context, state) {
        if (state is ServiceBookingLoadSuccess) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => Padding(
                padding: kPadding10,
                child: BookingsServiceCard(
                  deleteTap: () {
                    context.read<BookingsBloc>().add(
                          ServiceBookingDeleteInitiated(
                            id: state.myBookingList.result![index].id!.toInt(),
                          ),
                        );
                  },
                  editTap: () async {
                    Future.delayed(
                      Duration.zero,
                      () => showModalBottomSheet(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.85,
                          minWidth: double.infinity,
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Column(
                          children: [
                            const CustomModalSheetDrawerIcon(),
                            Expanded(
                              child: EditMyOrdersForm(
                                selectedIndex: index,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  callback: () async {
                    await context
                        .read<SingleEntityServiceCubit>()
                        .getSingleEntity(
                          state.myBookingList.result?[index].entityService
                                  ?.id ??
                              '',
                        )
                        .then(
                          (value) => Navigator.pushNamed(
                            context,
                            ServiceProviderPage.routeName,
                          ),
                        );
                  },
                  color: Colors.blue,
                  serviceName:
                      state.myBookingList.result?[index].entityService?.title ??
                          '',
                  providerName:
                      '${state.myBookingList.result?[index].entityService?.createdBy?.firstName} ${state.myBookingList.result?[index].entityService?.createdBy?.lastName}',
                  mainContentWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconText(
                        color: kColorBlue,
                        iconData: Icons.calendar_today_rounded,
                        label: '${DateFormat.yMMMd().format(
                          state.myBookingList.result?[index].createdAt ??
                              DateTime.now(),
                        )} ${DateFormat.jm().format(
                          state.myBookingList.result?[index].createdAt ??
                              DateTime.now(),
                        )}',
                      ),
                      IconText(
                        color: kColorGreen,
                        iconData: Icons.access_time_outlined,
                        label: '${DateFormat.yMMMd().format(
                          state.myBookingList.result?[index].startDate ??
                              DateTime.now(),
                        )} - ${DateFormat.yMMMd().format(
                          state.myBookingList.result?[index].endDate ??
                              DateTime.now(),
                        )}',
                      ),
                      IconText(
                        color: kColorAmber,
                        iconData: Icons.attach_money_outlined,
                        label:
                            'Rs. ${state.myBookingList.result?[index].budgetTo ?? ''}',
                      ),
                      IconText(
                        color: Colors.red,
                        iconData: Icons.location_on_outlined,
                        label:
                            '${state.myBookingList.result?[index].entityService?.location}',
                      ),
                    ],
                  ),
                  // status: 'In Progress',
                  bottomLeftWidget: const Text(
                    'View Detail',
                    style: kText15,
                  ),
                  bottomRightWidget: SizedBox(
                    width: 120,
                    child: CustomElevatedButton(
                      callback: () {},
                      label: state.myBookingList.result?[index].status
                              ?.toCapitalized() ??
                          'Unknown',
                      mainColor: Colors.orangeAccent,
                      borderColor: Colors.orangeAccent,
                    ),
                  ),
                ),
              ),
              itemCount: state.myBookingList.result?.length ?? 1,
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
