import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class RedeemPointsCard extends StatelessWidget {
  const RedeemPointsCard({
    Key? key,
    this.redeemCount,
    this.imagePath,
    this.description,
    this.rating,
    this.location,
    this.callback,
  }) : super(key: key);

  final String? redeemCount;
  final String? imagePath;
  final String? description;
  final String? rating;
  final String? location;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: [
          Container(
            height: 100,
            width: 160,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                  imagePath ?? kServiceImageNImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/reward.png'),
                  AutoSizeText(
                    redeemCount ?? '23',
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AutoSizeText(
                    'Reward Point',
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              AutoSizeText(
                description ?? 'childAspectRatio',
                style: kLightBlueText14,
                overflow: TextOverflow.ellipsis,
              ),
              addVerticalSpace(5),
              SizedBox(
                height: 30,
                width: 110,
                child: CustomElevatedButton(
                  callback: () {},
                  label: 'Redeem Now',
                  textStyle: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
              addVerticalSpace(5),
            ],
          ),
        ],
      ),
    );
  }
}
