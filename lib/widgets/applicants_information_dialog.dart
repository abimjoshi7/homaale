import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

showApplicantDetailsDialog({
  required BuildContext context,
  required String profileImage,
  bool? isProfileVerified = false,
  String? label,
  String? designation,
  String? distance,
  String? successRate,
  String? happyClients,
  String? rating,
  String? title,
  String? budget,
  String? description,
  required VoidCallback onApprovePressed,
  required VoidCallback onRejectPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            profileImage,
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpace(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label ?? 'Harry Smith',
                          style: kPurpleText16,
                        ),
                        kWidth5,
                        isProfileVerified ?? false
                            ? Icon(
                                Icons.verified,
                                color: Color(0xff3EAEFF),
                              )
                            : SizedBox(),
                      ],
                    ),
                    Text(
                      designation ?? 'Homaale User',
                      style: kText13,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: kColorSilver,
                  ),
                ),
              ],
            ),
            addVerticalSpace(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(
                  iconData: Icons.navigation_outlined,
                  iconColor: kColorSilver,
                  label: distance ?? '0',
                ),
                IconText(
                  iconData: Icons.military_tech_rounded,
                  iconColor: kColorSilver,
                  label: successRate ?? '0',
                ),
                IconText(
                  iconData: Icons.emoji_emotions_outlined,
                  iconColor: kColorSilver,
                  label: happyClients ?? '0',
                ),
                IconText(
                  iconData: Icons.star,
                  iconColor: kColorAmber,
                  label: rating ?? '0',
                )
              ],
            ),
            addVerticalSpace(16),
            Divider(),
            addVerticalSpace(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Title: ',
                        style: kBoldText,
                      ),
                      Text(title ?? 'No title'),
                    ],
                  ),
                  addVerticalSpace(16),
                  Row(
                    children: [
                      Text(
                        'Budget: ',
                        style: kBoldText,
                      ),
                      Text(budget ?? 'No budget'),
                    ],
                  ),
                  addVerticalSpace(16),
                  Text(
                    'Reasons to apply: ',
                    style: kBoldText,
                  ),
                  addVerticalSpace(8),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: SingleChildScrollView(
                      child: Text(
                        description ?? 'No description',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  theWidth: MediaQuery.of(context).size.width * 0.3,
                  borderColor: kColorAmber,
                  mainColor: Colors.white,
                  label: 'Reject',
                  textColor: kColorAmber,
                  callback: onRejectPressed,
                ),
                CustomElevatedButton(
                  theWidth: MediaQuery.of(context).size.width * 0.3,
                  mainColor: kColorAmber,
                  label: 'Approve',
                  textColor: Colors.white,
                  callback: onApprovePressed,
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

class IconText extends StatelessWidget {
  const IconText({super.key, required this.iconData, required this.label, this.iconColor});

  final IconData iconData;
  final String label;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor ?? Colors.blue,
        ),
        addHorizontalSpace(8),
        Text(label),
      ],
    );
  }
}
