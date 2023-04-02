import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class GetDevicePhoneNumberButton extends StatelessWidget {
  final GestureTapCallback onTap;
  const GetDevicePhoneNumberButton({
    super.key,
    required this.onTap,
  });

  // void getPhoneNumber() async {
  //   var telephony = Telephony.instance;
  //   final bool? result = await telephony.requestPhonePermissions;
  //   if (result != null && result) {
  //     // Permission granted, proceed to get phone number
  //     var simCards = await telephony.simOperator;
  //     print('Phone number: $simCards');
  //   } else {
  //     // Permission denied, handle it gracefully
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: kColorPrimaryAccent,
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
          width: MediaQuery.of(context).size.width * 0.1,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xffDEE2E6),
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(
            Icons.phone_android_outlined,
            color: kColorPrimaryAccent,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
