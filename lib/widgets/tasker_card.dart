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
    this.shareLinked,
    this.badgeImage,
    this.isOwner = false,
     this.isProfileVerified,
  });

  final String? label;
  final String? id;
  final String? designation;
  final String? happyClients;
  final String? rewardPercentage;
  final String? distance;
  final String? ratings;
  final String? rate;
  final String? shareLinked;
  final String? callbackLabel;
  final String? networkImageUrl;
  final String? badgeImage;
  final double? buttonWidth;
  final VoidCallback callback;
  final VoidCallback onFavouriteTapped;
  final bool? isFollowed;
  final bool isOwner;
  final bool? isProfileVerified;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            addVerticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
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
                      ),
                      if (badgeImage != null)
                        Positioned(
                          bottom: -15,
                          left: 40,
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.transparent,
                            child: Center(
                              child: Image.network(badgeImage ?? ""),
                            ),
                          ),
                        ),
                    ]),
                // addHorizontalSpace(10),
                if (shareLinked != null)
                  InkWell(
                      onTap: () {
                        final box = context.findRenderObject() as RenderBox?;
                        Share.share(
                          shareLinked!,
                          sharePositionOrigin:
                              box!.localToGlobal(Offset.zero) & box.size,
                        );
                      },
                      child: Icon(Icons.redo_sharp, color: kColorBlue)),
              ],
            ),
            addVerticalSpace(10),
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
                if(isProfileVerified == true)
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      WidgetText(
                        label: happyClients ?? '0',
                        widget: const Icon(
                          Icons.emoji_emotions_outlined,
                          color: Color(0xffF98900),
                          // size: 16,
                        ),
                      ),
                      addHorizontalSpace(10),
                      IconText(
                        label: ratings ?? '',
                        iconData: Icons.star_rate_rounded,
                        size: 25,
                        color: kColorAmber,
                      ),
                      addHorizontalSpace(10),
                      WidgetText(
                        label: '${rewardPercentage} % ',
                        widget:
                            Image.asset("assets/reward.png", color: kColorBlue),
                      ),
                    ],
                  ),

                  // WidgetText(
                  //   label: distance ?? '0',
                  //   widget: const Icon(
                  //     Icons.airline_stops_sharp,
                  //     color: Color(0xffF98900),
                  //     // size: 16,
                  //   ),
                  // ),
                ],
              ),
            ),
            kHeight5,
            Visibility(
              visible: !isOwner,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _buildButton(context),
              ),
            ),
            addVerticalSpace(5),
          ],
        ),
      ),
    );
  }

  SizedBox _buildButton(BuildContext context) {
    return SizedBox(
      height: 35,
      width: buttonWidth ?? 80,
      child: CustomElevatedButton(
        borderColor: kColorPrimary,
        mainColor: isFollowed == true && CacheHelper.isLoggedIn
            ? Colors.white
            : kColorPrimary,
        textColor: isFollowed == true && CacheHelper.isLoggedIn
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
    );
  }
}
