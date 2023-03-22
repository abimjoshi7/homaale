import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SavedSearchList extends StatelessWidget {
  const SavedSearchList({super.key});

  Widget savedEntityTile(
    BuildContext context, {
    required String title,
    required String imgSrc,
  }) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.height * 0.11,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imgSrc,
                fit: BoxFit.cover,
              ),
            ),
          ),
          addVerticalSpace(MediaQuery.of(context).size.height * 0.008),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.094,
            width: MediaQuery.of(context).size.height * 0.094,
            child: Text(
              title,
              style: kPurpleText12,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
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
            padding: const EdgeInsets.only(left: 17.0, top: 0.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'From Your Saved',
                style: kText15.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.005,
                top: MediaQuery.of(context).size.height * 0.016,
                right: 0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) {
                return addHorizontalSpace(
                    MediaQuery.of(context).size.width * 0.025);
              },
              itemBuilder: (BuildContext context, int index) {
                return savedEntityTile(
                  context,
                  title: 'Shrek & Donkey Laundry Service',
                  imgSrc:
                      'https://assets.epuzzle.info/puzzle/075/103/original.jpg',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
