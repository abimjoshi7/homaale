// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/features/event/presentation/bloc/event_bloc.dart';
import 'package:cipher/features/services/presentation/pages/service_booking.dart';
import 'package:cipher/features/task_entity_service/presentation/bloc/task_entity_service_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/booking_details_page.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/sections/packages_offers_section.dart';
import 'package:cipher/features/services/presentation/widgets/additional_info_section.dart';
import 'package:cipher/features/services/presentation/widgets/rating_review_section.dart';
import 'package:cipher/widgets/widgets.dart';

class TaskEntityServicePage extends StatelessWidget {
  static const String routeName = '/task_entity_service_page';
  const TaskEntityServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TaskEntityServiceBloc, TaskEntityServiceState>(
        builder: (context, state) {
          if (state.theStates == TheStates.success) {
            final documentDescription = Bidi.stripHtmlIfNeeded(
              state.taskEntityService?.description ??
                  'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.',
            );
            return Column(
              children: [
                addVerticalSpace(50),
                CustomHeader(
                  child: Text(state.taskEntityService?.title ?? ''),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Image.network(
                          state.taskEntityService!.images!.isEmpty
                              ? kServiceImageNImg
                              : state.taskEntityService?.images?.first.media
                                      .toString() ??
                                  kServiceImageNImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: kPadding10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            state.taskEntityService?.createdBy
                                                    ?.profileImage ??
                                                kDefaultAvatarNImg,
                                          ),
                                        ),
                                      ),
                                    ),
                                    addHorizontalSpace(
                                      10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Text(
                                            state.taskEntityService?.title ??
                                                '',
                                            style: kPurpleText16,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${state.taskEntityService?.createdBy?.firstName ?? ''}"
                                          " ${state.taskEntityService?.createdBy?.lastName ?? ''}",
                                          style: kLightBlueText14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                    ),
                                    kWidth10,
                                    GestureDetector(
                                      onTap: () {
                                        final box = context.findRenderObject()
                                            as RenderBox?;
                                        Share.share(
                                          "Share this Hommale with friends.",
                                          sharePositionOrigin:
                                              box!.localToGlobal(Offset.zero) &
                                                  box.size,
                                        );
                                      },
                                      child: const Icon(
                                        Icons.share,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_outlined,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      state.taskEntityService?.rating?.first
                                              .rating
                                              .toString() ??
                                          '4.5',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                      size: 18,
                                    ),
                                    kWidth5,
                                    Text(
                                      "${state.taskEntityService?.city?.name ?? ''}, ${state.taskEntityService?.city?.country?.name ?? ''}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                            HtmlRemover(
                                text: state.taskEntityService?.description ??
                                    'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.'),

                            kHeight20,
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Requirements',
                                style: kPurpleText16,
                              ),
                            ),
                            Column(
                              children: List.generate(
                                2,
                                (index) => Row(
                                  children: const [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    kWidth10,
                                    Text(
                                      'Booking available for RCT in Kathmandu',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Visibility(
                              visible: false,
                              child: PackagesOffersSection(),
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              title: Row(
                                children: const [
                                  Icon(
                                    Icons.info_outline,
                                    size: 15,
                                  ),
                                  kWidth10,
                                  Text('Additional Information'),
                                ],
                              ),
                              children: const [
                                AdditionalInfoSection(),
                              ],
                            ),
                            ExpansionTile(
                              tilePadding: EdgeInsets.zero,
                              title: Row(
                                children: const [
                                  Icon(
                                    Icons.star_border_outlined,
                                    size: 15,
                                  ),
                                  kWidth10,
                                  Text('Ratings & Reviews'),
                                ],
                              ),
                              children: const [
                                RatingReviewSection(),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const CustomModalSheetDrawerIcon(),
                                        kHeight10,
                                        const Text(
                                          'Rating & Review',
                                          style: kText17,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: const [
                                              CustomFormField(
                                                label: 'Name',
                                                isRequired: true,
                                                child: CustomTextFormField(),
                                              ),
                                              CustomFormField(
                                                label: 'Email',
                                                isRequired: true,
                                                child: CustomTextFormField(),
                                              ),
                                              CustomFormField(
                                                label: 'Task Description',
                                                isRequired: true,
                                                child: CustomTextFormField(),
                                              ),
                                              CustomFormField(
                                                label: 'Ratings',
                                                isRequired: true,
                                                child: CustomTextFormField(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomElevatedButton(
                                          callback: () {},
                                          label: 'Submit Now',
                                        ),
                                        kHeight20,
                                      ],
                                    ),
                                  );
                                },
                                child: const Text('Write a Review'),
                              ),
                            ),
                            // const Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Text(
                            //     'Similar Services',
                            //     style: kPurpleText16,
                            //   ),
                            // ),
                            // kHeight10,
                            // Placeholder(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: kPadding10,
                        child: CustomFormField(
                          label: 'Similar Services',
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.22,
                            width: double.infinity,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) =>
                                  const ServiceCard(),
                              separatorBuilder: (context, index) => kWidth10,
                              itemCount: 5,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xffBCD4FA),
                        ),
                        child: Padding(
                          padding: kPadding20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Total Price'),
                                  Text(
                                    "Rs. ${state.taskEntityService?.budgetTo}",
                                    style: kText20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                                child: BlocListener<EventBloc, EventState>(
                                  listener: (context, state) {
                                    if (state.theStates == TheStates.success) {
                                      Navigator.pushNamed(
                                        context,
                                        // BookingDetailsPage.routeName,
                                        ServiceBookingPage.routeName,
                                      );
                                    }
                                  },
                                  child: CustomElevatedButton(
                                    callback: () {
                                      context.read<EventBloc>().add(
                                            EventRetrieveInitiated(
                                              id: state.taskEntityService?.event
                                                      ?.id ??
                                                  'Null Case',
                                            ),
                                          );
                                    },
                                    label: 'Book Now',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // Row(
                //   children: [ListTile()],
                // )
              ],
            );
          } else {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
