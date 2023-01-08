import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HelpAndLegalPage extends StatelessWidget {
  const HelpAndLegalPage({super.key});
  static const routeName = '/help-legal-page';

  @override
  Widget build(BuildContext context) {
    var val = [
      'Somebody harassed me.',
      'Fraudulent Case',
      'Payment Issue',
      'Conflict with another HOMAALE member.',
      'Other'
    ];
    return Scaffold(
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Help & Legal',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Report a problem',
                  style: kPurpleText16,
                ),
                kHeight5,
                const CustomTextFormField(
                  hintText: 'Other',
                ),
                kHeight20,
                const Text(
                  'Please Specify',
                  style: kPurpleText16,
                ),
                kHeight5,
                DropdownButtonFormField<String>(
                  // value: 'a',
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    // constraints: BoxConstraints(minHeight: theHeight),
                    hintText: 'Specify your reason here.',
                    hintStyle: const TextStyle(
                      color: Color(0xff9CA0C1),
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // prefixIcon: prefixWidget,
                  ),
                  items: val.map((String value) {
                    return DropdownMenuItem<String>(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
                // CustomTextFormField(
                //   hintText: 'Other',
                // ),
                kHeight20,
                const Text(
                  'Problem Detail',
                  style: kPurpleText16,
                ),
                kHeight5,
                const CustomTextFormField(
                  hintText: 'Please explain your problem briefly',
                  maxLines: 3,
                ),
                kHeight50,
                Center(
                  child: CustomElevatedButton(
                    callback: () {},
                    label: 'Save',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
