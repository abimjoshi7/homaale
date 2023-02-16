import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/presentation/pages/booking_details_page.dart';
import 'package:cipher/features/bookings/presentation/widgets/widget.dart';
import 'package:cipher/features/services/presentation/manager/single_entity_service_cubit.dart';
import 'package:cipher/features/services/presentation/pages/sections/packages_offers_section.dart';
import 'package:cipher/features/services/presentation/widgets/additional_info_section.dart';
import 'package:cipher/features/services/presentation/widgets/rating_review_section.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceProviderPage extends StatelessWidget {
  static const String routeName = '/service_provider_page';
  const ServiceProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SingleEntityServiceCubit, SingleEntityServiceState>(
        builder: (context, state) {
          if (state is SingleEntityServiceLoadSuccess) {
            return Column(
              children: [
                kHeight50,
                CustomHeader(
                  leadingWidget: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  trailingWidget: IconButton(
                    onPressed: () {
                      print(
                        state.serviceModel.images?.first['media'],
                      );
                    },
                    icon: const Icon(Icons.search),
                  ),
                  child: Text(state.serviceModel.title ?? ''),
                ),
                const Divider(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Image.network(
                          state.serviceModel.images!.isEmpty
                              ? kServiceImageNImg
                              : state.serviceModel.images?.first['media']
                                      .toString() ??
                                  kServiceImageNImg,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: kPadding20,
                        child: Column(
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
                                            state.serviceModel.createdBy
                                                    ?.profileImage ??
                                                kDefaultAvatarNImg,
                                          ),
                                        ),
                                      ),
                                    ),
                                    kWidth10,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.serviceModel.title ?? '',
                                          style: kPurpleText16,
                                        ),
                                        Text(
                                          "${state.serviceModel.createdBy?.firstName ?? ''} ${state.serviceModel.createdBy?.lastName ?? ''}",
                                          style: kLightBlueText14,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                    ),
                                    kWidth10,
                                    const Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            kHeight10,
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
                                      state.serviceModel.rating?.first.rating
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
                                      "${state.serviceModel.city?.name ?? ''}, ${state.serviceModel.city?.country?.name ?? ''}",
                                    ),
                                  ],
                                )
                              ],
                            ),
                            kHeight20,
                            Text(
                              state.serviceModel.description ??
                                  'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.',
                              textAlign: TextAlign.start,
                            ),
                            kHeight20,
                            const Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'Requirements',
                                style: kPurpleText16,
                              ),
                            ),
                            kHeight10,
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                kWidth10,
                                const Text(
                                    'Booking available for RCT in Kathmandu')
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                kWidth10,
                                const Text(
                                    'Booking available for RCT in Kathmandu')
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                kWidth10,
                                const Text(
                                    'Booking available for RCT in Kathmandu')
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                kWidth10,
                                const Text(
                                    'Booking available for RCT in Kathmandu')
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: Colors.orange,
                                ),
                                kWidth10,
                                const Text(
                                    'Booking available for RCT in Kathmandu')
                              ],
                            ),
                            kHeight20,
                            Visibility(
                                visible: false, child: PackagesOffersSection()),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 15,
                                  ),
                                  kWidth10,
                                  Text('Additional Information'),
                                ],
                              ),
                              children: [
                                AdditionalInfoSection(),
                              ],
                            ),
                            ExpansionTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.star_border_outlined,
                                    size: 15,
                                  ),
                                  kWidth10,
                                  Text('Ratings & Reviews'),
                                ],
                              ),
                              children: [
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
                                        CustomModalSheetDrawerIcon(),
                                        kHeight10,
                                        Text(
                                          'Rating & Review',
                                          style: kText17,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              CustomFormField(
                                                label: 'Name',
                                                child: CustomTextFormField(),
                                                isRequired: true,
                                              ),
                                              CustomFormField(
                                                label: 'Email',
                                                child: CustomTextFormField(),
                                                isRequired: true,
                                              ),
                                              CustomFormField(
                                                label: 'Task Description',
                                                child: CustomTextFormField(),
                                                isRequired: true,
                                              ),
                                              CustomFormField(
                                                label: 'Ratings',
                                                child: CustomTextFormField(),
                                                isRequired: true,
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
                        padding: kPadding20,
                        child: CustomFormText(
                          name: 'Similar Services',
                          child: SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ServiceCard(),
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
                                  Text('Total Price'),
                                  Text(
                                    "Rs. ${state.serviceModel.budgetTo}",
                                    style: kText20,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 100,
                                child: CustomElevatedButton(
                                  callback: () {
                                    Navigator.pushNamed(
                                      context,
                                      BookingDetailsPage.routeName,
                                    );
                                  },
                                  label: 'Book Now',
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
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
