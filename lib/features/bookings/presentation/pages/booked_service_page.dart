import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/error/error_page.dart';
import 'package:cipher/features/bookings/presentation/bloc/bookings_bloc.dart';
import 'package:cipher/features/task_entity_service/presentation/pages/sections/sections.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart' as bm;
import 'package:cipher/widgets/show_more_text_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class BookedServicePage extends StatefulWidget {
  static const routeName = '/booked-service-page';
  const BookedServicePage({super.key});

  @override
  State<BookedServicePage> createState() => _BookedServicePageState();
}

class _BookedServicePageState extends State<BookedServicePage> {
  int _imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingsBloc, BookingsState>(
        builder: (context, state) {
          if (state.states == TheStates.initial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.states == TheStates.success) {
            final booking = state.result!;
            final mediaList = <bm.Image>[...?booking.entityService?.images, ...?booking.entityService?.videos];

            return Column(
              children: [
                addVerticalSpace(
                  50,
                ),
                CustomHeader(
                  label: booking.entityService?.title,
                ),
                Divider(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
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
                                            booking.createdBy?.profileImage ?? kDefaultAvatarNImg,
                                          ),
                                        ),
                                      ),
                                    ),
                                    addHorizontalSpace(
                                      10,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          child: Text(
                                            '${booking.entityService?.title ?? ''}',
                                            style: kPurpleText16,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                          "${booking.createdBy?.user?.firstName ?? ''} "
                                          "${booking.createdBy?.user?.lastName ?? ''}",
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
                                        final box = context.findRenderObject() as RenderBox?;
                                        Share.share(
                                          "Share this Hommale with friends.",
                                          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
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
                              children: [
                                // Row(
                                //   children: [
                                //     const Icon(
                                //       Icons.star_outlined,
                                //       color: Colors.amber,
                                //     ),
                                //     Text('4.5 (300)')
                                //   ],
                                // ),
                                // kWidth20,
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                    ),
                                    Text(
                                        '${booking.entityService?.city?.name ?? ''}, ${booking.entityService?.city?.country?.name ?? ''}')
                                  ],
                                ),
                              ],
                            ),
                            addVerticalSpace(10),
                            ShowMoreTextWidget(
                                text: booking.entityService?.description ??
                                    'Root canal treatment (endodontics) is a dental procedure used to treat infection at the centre of a tooth. Root canal treatment is not painful and can save a tooth that might otherwise have to be removed completely.'),
                            addVerticalSpace(10),
                            RequirementSection(
                              requirementList: booking.entityService?.highlights,
                            ),
                            addVerticalSpace(10),
                            Text(
                              'Images',
                              style: kPurpleText16,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.21,
                              child: CarouselSlider.builder(
                                itemCount: mediaList.length,
                                itemBuilder: (context, index, realIndex) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    margin: EdgeInsets.only(right: 32),
                                    child: mediaList[index].mediaType == 'mp4'
                                        ? VideoPlayerWidget(
                                            videoURL: mediaList[index].media ??
                                                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                                          )
                                        : Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(16.0),
                                                child: Image.network(
                                                  mediaList[index].media.toString(),
                                                  errorBuilder: (context, error, stackTrace) =>
                                                      Image.network(kServiceImageNImg),
                                                  width: MediaQuery.of(context).size.width,
                                                  height: MediaQuery.of(context).size.height * 0.2,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                  );
                                },
                                options: CarouselOptions(
                                  padEnds: mediaList.length == 1,
                                  enlargeCenterPage: mediaList.length == 1,
                                  viewportFraction: 0.8,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _imageIndex = index;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    mediaList.length,
                                    (ind) => Container(
                                      height: 10,
                                      margin: const EdgeInsets.all(2),
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: _imageIndex == ind ? Colors.amber : Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addVerticalSpace(32),
                      Image.asset(
                        'assets/banners/2.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
                PriceBookFooterSection(
                  price: "Rs. ${booking.budgetTo?.round()}",
                  bgColor: (getStatus(booking.status ?? '')["color"] as Color).withOpacity(
                    0.3,
                  ),
                  buttonLabel: getStatus(booking.status ?? '')["status"] as String,
                  buttonColor: getStatus(booking.status ?? '')["color"] as Color,
                  onPressed: () {
                    final status = getStatus(booking.status ?? '')["status"];
                    print(status);
                    switch (status) {
                      case 'Waiting for Approval':
                        break;
                      default:
                    }
                  },
                ),
              ],
            );
          }
          return ErrorPage();
        },
      ),
    );
  }
}
