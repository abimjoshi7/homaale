// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:flutter/material.dart';

class TabFilterSection extends StatelessWidget {
  const TabFilterSection({
    super.key,
    this.stringCallback,
  });

  final void Function(String?)? stringCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // ChoiceChip(
            //   label: Text(
            //     "Booked By Me",
            //   ),
            //   selected: selectedIndex == 0,
            //   onSelected: (value) async {
            //     setState(
            //       () {
            //         selectedIndex = 0;
            //       },
            //     );
            //     if (selectedIndex == 1) {
            //       context.read<TaskBloc>().add(
            //             AllTaskLoadInitiated(),
            //           );
            //     }
            //   },
            //   backgroundColor: Colors.white,
            //   selectedColor: kColorBlue,
            //   side: BorderSide(
            //     color: selectedIndex == 0 ? kColorBlue : kColorGrey,
            //   ),
            // ),
            // ChoiceChip(
            //   label: Text(
            //     "Booked By Others",
            //   ),
            //   selected: selectedIndex == 0,
            //   onSelected: (value) async {
            //     setState(
            //       () {
            //         selectedIndex = 0;
            //       },
            //     );
            //     if (selectedIndex == 1) {
            //       context.read<TaskBloc>().add(
            //             AllTaskLoadInitiated(),
            //           );
            //     }
            //   },
            //   backgroundColor: Colors.white,
            //   selectedColor: kColorBlue,
            //   side: BorderSide(
            //     color: selectedIndex == 0 ? kColorBlue : kColorGrey,
            //   ),
            // ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.width * 0.18,
              child: CustomDropDownField(
                borderRadius: 20,
                onChanged: stringCallback,
                list: kBookingDropDownStrings,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.filter_alt_rounded,
                color: kColorSilver,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
