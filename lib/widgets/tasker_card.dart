import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerCard extends StatelessWidget {
  const TaskerCard({
    super.key,
    required this.callback,
    this.label,
    this.designation,
    this.happyClients,
    this.rewardPercentage,
    this.distance,
    this.ratings,
    this.rate,
    this.networkImageUrl,
    this.callbackLabel,
    this.buttonWidth,
    required this.onFavouriteTapped,
    this.id,
    this.isFollowed,
  });

  final String? label;
  final String? id;
  final String? designation;
  final String? happyClients;
  final String? rewardPercentage;
  final String? distance;
  final String? ratings;
  final String? rate;
  final String? callbackLabel;
  final String? networkImageUrl;
  final double? buttonWidth;
  final VoidCallback callback;
  final VoidCallback onFavouriteTapped;
  final bool? isFollowed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            addVerticalSpace(5),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    networkImageUrl ?? kHomaaleImg,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: AutoSizeText(
                              label ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          kWidth5,
                          const Icon(
                            Icons.verified,
                            color: Color(0xff3EAEFF),
                          ),
                        ],
                      ),
                      Text(
                        designation ?? 'Homaale User',
                        textAlign: TextAlign.center,
                        style: kLightBlueText14,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        WidgetText(
                          label: happyClients ?? '0',
                          widget: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Color(0xffF98900),
                            // size: 16,
                          ),
                        ),
                        WidgetText(
                          label: rewardPercentage ?? '0',
                          widget: const Icon(
                            Icons.military_tech_rounded,
                            color: Color(0xff0693E3),
                            // size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconText(
                          label: ratings ?? '',
                          iconData: Icons.star_rate_rounded,
                          size: 15,
                          color: kColorAmber,
                        ),
                        WidgetText(
                          label: distance ?? '0',
                          widget: const Icon(
                            Icons.airline_stops_sharp,
                            color: Color(0xffF98900),
                            // size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconText(
                        label: ratings ?? '',
                        iconData: Icons.star_rate_rounded,
                        size: 15,
                        color: kColorAmber,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(),
                        SizedBox(
                          height: 30,
                          width: buttonWidth ?? 80,
                          child: CustomElevatedButton(
                            borderColor: kColorPrimary,
                            mainColor: isFollowed ?? false
                                ? Colors.white
                                : kColorPrimary,
                            textColor: isFollowed ?? false
                                ? kColorPrimary
                                : Colors.white,
                            callback: () {
                              if (!CacheHelper.isLoggedIn) {
                                notLoggedInPopUp(context);
                              }
                              if (!CacheHelper.isLoggedIn) return;
                              callback();
                            },
                            label: callbackLabel ?? 'Hire Me',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
