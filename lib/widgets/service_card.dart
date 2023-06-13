// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/widgets/custom_favourite_icon.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    this.id,
    this.title,
    this.imagePath,
    this.createdBy,
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
  }) : super(key: key);

  final String? title;
  final String? id;
  final String? imagePath;
  final String? createdBy;
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          20,
        ),
        child: Card(
          color: Theme.of(context).cardColor,
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
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                      AutoSizeText(
                        createdBy ?? '',
                        style: kLightBlueText14,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // * No description field on response
                      // AutoSizeText(
                      //   description ?? '',
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: 120,
                          maxWidth: double.infinity,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconText(
                              label: rating ?? '0.0',
                              iconData: Icons.star_rate_rounded,
                              color: kColorAmber,
                              size: 13,
                            ),
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
                                        Icons.share,
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
                              flex: 3,
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
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
