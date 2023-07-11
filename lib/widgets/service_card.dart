// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_favourite_icon.dart';
import 'package:cipher/widgets/widgets.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    this.title,
    this.id,
    this.imagePath,
    this.createdBy,
    this.bookedCount,
    this.createdByProfileImg,
    this.description,
    this.rating,
    this.location,
    this.callback,
    this.bookmarkCallback,
    this.editCallback,
    this.shareCallback,
    this.rateFrom = "0",
    this.rateTo = "0",
    this.isRange = false,
    this.isBookmarked = false,
    this.isOwner = false,
    this.theHeight = 250,
  }) : super(key: key);

  final String? title;
  final String? id;
  final String? imagePath;
  final String? createdBy;
  final String? bookedCount;
  final String? createdByProfileImg;
  final String? description;
  final String? rating;
  final String? location;
  final VoidCallback? callback;
  final VoidCallback? bookmarkCallback;
  final VoidCallback? editCallback;
  final VoidCallback? shareCallback;
  final String? rateFrom;
  final String? rateTo;
  final bool? isRange;
  final bool? isBookmarked;
  final bool isOwner;
  final double theHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          20,
        ),
        child: SizedBox(
          height: theHeight,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          imagePath ?? kHomaaleImg,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          title ?? '',
                          minFontSize: 10.0,
                          maxFontSize: 13.0,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  createdByProfileImg ?? kHomaaleImg),
                              radius: 10,
                            ),
                            addHorizontalSpace(5),
                            Expanded(
                              child: AutoSizeText(
                                createdBy ?? '',
                                minFontSize: 10.0,
                                maxFontSize: 13.0,
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            addHorizontalSpace(5),
                            IconText(
                              label:
                                  rating == 'null' ? '0.0' : rating.toString(),
                              iconData: Icons.star_rate_rounded,
                              size: 13,
                              color: kColorAmber,
                            ),
                          ],
                        ),
                        // * No description field on response
                        // AutoSizeText(
                        //   description ?? '',
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        addVerticalSpace(5),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 120,
                            maxWidth: double.infinity,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: IconText(
                                  label: location ?? 'Remote',
                                  iconData: Icons.location_on_outlined,
                                  color: kColorPink,
                                  size: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 120,
                            maxWidth: double.infinity,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (bookedCount != null)
                                Flexible(
                                  child: IconText(
                                    label: '$bookedCount Booked',
                                    iconData: Icons.people,
                                    size: 13,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(
                                        child: isOwner
                                            ? IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: editCallback,
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: kColorAmber,
                                                ),
                                              )
                                            : CustomFavoriteIcon(
                                                typeID: '$id',
                                                type: ServiceType.entityservice,
                                                isBookmarked:
                                                    isBookmarked ?? false,
                                              )

                                        // IconButton(
                                        //     padding: EdgeInsets.zero,
                                        //     onPressed: bookmarkCallback,
                                        //     icon: Icon(
                                        //       isBookmarked ?? false ? Icons.bookmark : Icons.bookmark_border_rounded,
                                        //       color: kColorPink,
                                        //     ),
                                        //   ),
                                        ),
                                    addHorizontalSpace(8),
                                    Flexible(
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: shareCallback,
                                        icon: Icon(
                                          Icons.redo_sharp,
                                          color: kColorBlue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              addHorizontalSpace(
                                16,
                              ),
                              Flexible(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Visibility(
                                      visible: isRange ?? false,
                                      child: Flexible(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "Rs $rateFrom",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Text(" - "),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        "Rs $rateTo",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // addVerticalSpace(4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
