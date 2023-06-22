import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

showApplicantDetailsDialog({
  required BuildContext context,
  required String profileImage,
  bool? isProfileVerified = false,
  String? label,
  bool isNegotiable = false,
  String? designation,
  String? distance,
  String? successRate,
  String? happyClients,
  String? rating,
  String? title,
  String? budget,
  String? description,
  String? status,
  bool isAccepted = false,
  required VoidCallback onNegotiatePressed,
  // required VoidCallback onAcceptedCallback,
  required VoidCallback onApprovePressed,
  required VoidCallback onRejectPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.88,
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
                // IconText(
                //   iconData: Icons.navigation_outlined,
                //   color: kColorSilver,
                //   label: distance ?? '0',
                // ),
                IconText(
                  iconData: Icons.military_tech_rounded,
                  color: kColorSilver,
                  label: successRate ?? '0',
                ),
                IconText(
                  iconData: Icons.emoji_emotions_outlined,
                  color: kColorSilver,
                  label: happyClients ?? '0',
                ),
                IconText(
                  iconData: Icons.star,
                  color: kColorAmber,
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
                mainAxisSize: MainAxisSize.min,
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
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: SingleChildScrollView(
                      child: Text(
                        description ?? 'No description',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (status?.toLowerCase() == 'pending') ...[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomElevatedButton(
                      theWidth: MediaQuery.of(context).size.width,
                      borderColor:
                          isNegotiable ? kColorPrimary : Colors.grey.shade500,
                      mainColor: isNegotiable ? kColorPrimary : Colors.grey,
                      label: 'Negotiate',
                      textColor: Colors.white,
                      callback: isNegotiable ? onNegotiatePressed : () {},
                    ),
                    addVerticalSpace(13.0),
                    CustomElevatedButton(
                      theWidth: MediaQuery.of(context).size.width,
                      mainColor: kColorPrimary,
                      label: 'Approve',
                      textColor: Colors.white,
                      callback: onApprovePressed,
                    ),
                    addVerticalSpace(13.0),
                    CustomElevatedButton(
                      theWidth: MediaQuery.of(context).size.width,
                      borderColor: kColorPrimary,
                      mainColor: Colors.white,
                      label: 'Reject',
                      textColor: kColorPrimary,
                      callback: onRejectPressed,
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     CustomElevatedButton(
              //       theWidth: MediaQuery.of(context).size.width * 0.3,
              //       borderColor: kColorAmber,
              //       mainColor: Colors.white,
              //       label: 'Reject',
              //       textColor: kColorAmber,
              //       callback: onRejectPressed,
              //     ),
              //     CustomElevatedButton(
              //       theWidth: MediaQuery.of(context).size.width * 0.3,
              //       mainColor: kColorAmber,
              //       label: 'Approve',
              //       textColor: Colors.white,
              //       callback: onApprovePressed,
              //     ),
              //   ],
              // )
            ] else if (status?.toLowerCase() == 'rejected')
              Center(
                child: CustomElevatedButton(
                  theWidth: MediaQuery.of(context).size.width * 0.3,
                  borderColor: Colors.red,
                  mainColor: Colors.red,
                  label: 'Rejected',
                  textColor: Colors.white,
                  callback: () {},
                ),
              )
            else
              Center(
                child: CustomElevatedButton(
                  theWidth: MediaQuery.of(context).size.width * 0.3,
                  borderColor: kColorGreen,
                  mainColor: kColorGreen,
                  label: 'Approved',
                  textColor: Colors.white,
                  callback: () {},
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
