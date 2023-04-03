import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RatingReviewSection extends StatelessWidget {
  const RatingReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                // vertical: 8,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const <Widget>[
                            Text(
                              'Reviews ',
                              style: kPurpleText16,
                            ),
                            Text('(30)')
                          ],
                        ),
                      ),
                      Flexible(
                        child: CustomDropDownField(
                          list: const [
                            'Most Relevant',
                            'Most Popular',
                          ],
                          hintText: 'Specify',
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                  const ListTile(
                    leading: CircleAvatar(),
                    title: Text('Elena'),
                    trailing: Text(
                      '3 days ago',
                      style: kHelper13,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: TextButton(
        //     onPressed: () async {
        //       if (!CacheHelper.isLoggedIn) {
        //         notLoggedInPopUp(context);
        //       }
        //       if (!CacheHelper.isLoggedIn) return;
        //       await showModalBottomSheet(
        //         context: context,
        //         builder: (context) => Column(
        //           mainAxisSize: MainAxisSize.min,
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: [
        //             const CustomModalSheetDrawerIcon(),
        //             kHeight10,
        //             const Text(
        //               'Rating & Review',
        //               style: kText17,
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(10),
        //               child: Column(
        //                 children: const [
        //                   CustomFormField(
        //                     label: 'Name',
        //                     isRequired: true,
        //                     child: CustomTextFormField(),
        //                   ),
        //                   CustomFormField(
        //                     label: 'Email',
        //                     isRequired: true,
        //                     child: CustomTextFormField(),
        //                   ),
        //                   CustomFormField(
        //                     label: 'Task Description',
        //                     isRequired: true,
        //                     child: CustomTextFormField(),
        //                   ),
        //                   CustomFormField(
        //                     label: 'Ratings',
        //                     isRequired: true,
        //                     child: CustomTextFormField(),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             CustomElevatedButton(
        //               callback: () {},
        //               label: 'Submit Now',
        //             ),
        //             kHeight20,
        //           ],
        //         ),
        //       );
        //     },
        //     child: const Text('Write a Review'),
        //   ),
        // ),
      ],
    );
  }
}
