import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

mixin LoginConfig {
  dynamic showLoginConfig(BuildContext context) async {
    var isfingerPrintEnabled = true;
    const isMPINEnabled = false;
    await showModalBottomSheet<Widget>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLabelText(label: 'Login configuration'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Enable finger print'),
                      StatefulBuilder(
                        builder: (context, setState) => Switch(
                          value: isfingerPrintEnabled,
                          onChanged: (value) => setState(
                            () {
                              isfingerPrintEnabled = !isfingerPrintEnabled;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Enable MPIN'),
                      StatefulBuilder(
                        builder: (context, setState) => Switch(
                          value: isMPINEnabled,
                          onChanged: (value) => setState(
                            () {
                              value = !value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQueryHelper.theWidth(context) * 0.23,
              ),
              child: CustomElevatedButton(
                callback: () {},
                label: 'Continue',
              ),
            ),
            kHeight20,
          ],
        ),
      ),
    );
  }
}
