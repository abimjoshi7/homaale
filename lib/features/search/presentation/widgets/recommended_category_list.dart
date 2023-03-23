import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class RecommendedCategoryList extends StatelessWidget {
  const RecommendedCategoryList({
    super.key,
  });

  Widget recommendedCategoryTile(BuildContext context,
      {required Color tileColor,
      required IconData icon,
      required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.050,
            width: MediaQuery.of(context).size.height * 0.050,
            decoration: BoxDecoration(
                color: tileColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: [
                  BoxShadow(
                    color: tileColor.withOpacity(0.5),
                    blurRadius: 10.0, // soften the shadow
                    spreadRadius: 3.0, //extend the shadow
                    offset: Offset(
                      1.0, // Move to right 5  horizontally
                      2.0, // Move to bottom 5 Vertically
                    ),
                  ),
                ]),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          addVerticalSpace(MediaQuery.of(context).size.height * 0.008),
          Text(
            title,
            style: kPurpleText13,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.030,
              bottom: MediaQuery.of(context).size.height * 0.016,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recommended',
                style: kText15.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.03375,
                vertical: MediaQuery.of(context).size.height * 0.015,
              ),
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return addHorizontalSpace(
                    MediaQuery.of(context).size.height * 0.051);
              },
              itemBuilder: (BuildContext context, int index) {
                return recommendedCategoryTile(
                  context,
                  tileColor: Colors.red,
                  icon: Icons.sports_gymnastics_rounded,
                  title: 'Fitness',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
