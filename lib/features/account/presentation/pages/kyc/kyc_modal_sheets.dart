import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

mixin KycModalSheets {
  static Future<void> showKycFillAs(BuildContext context) async {
    await showModalBottomSheet<Widget>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: CustomModalSheetDrawerIcon()),
            kHeight20,
            const Text(
              'Fill KYC as',
              style: kHeading2,
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Individual',
                  style: kPurpleText16,
                ),
                Radio(
                  value: 2,
                  groupValue: 2,
                  onChanged: (value) {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Organization',
                  style: kPurpleText16,
                ),
                Radio(
                  value: 2,
                  groupValue: 2,
                  onChanged: (value) {},
                )
              ],
            ),
            kHeight20,
            Center(
              child: SizedBox(
                width: 180,
                child: CustomElevatedButton(
                  callback: () async {
                    await showGeneralInformationMS(context);
                  },
                  label: 'Continue',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Future<void> showGeneralInformationMS(BuildContext context) async {
    await showModalBottomSheet<Widget>(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomModalSheetDrawerIcon(),
            kHeight10,
            const Text(
              'General Information',
              style: kHeading2,
            ),
            kHeight20,
            Row(
              children: const [
                Text(
                  'Full Name',
                  style: kPurpleText16,
                ),
                kWidth10,
                Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xffFE5050),
                  ),
                ),
              ],
            ),
            kHeight5,
            const CustomTextFormField(
              hintText: 'Harry Smith',
            ),
            kHeight20,
            Row(
              children: const [
                Text(
                  'Email',
                  style: kPurpleText16,
                ),
                kWidth10,
                Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xffFE5050),
                  ),
                ),
              ],
            ),
            kHeight5,
            const CustomTextFormField(
              hintText: 'harrysmith@gmail.com',
            ),
            kHeight20,
            Row(
              children: const [
                Text(
                  'Country',
                  style: kPurpleText16,
                ),
                kWidth10,
                Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xffFE5050),
                  ),
                ),
              ],
            ),
            kHeight5,
            const CustomTextFormField(
              hintText: 'Nepal',
            ),
            kHeight20,
            Row(
              children: const [
                Text(
                  'Address',
                  style: kPurpleText16,
                ),
                kWidth10,
                Text(
                  '*',
                  style: TextStyle(
                    color: Color(0xffFE5050),
                  ),
                ),
              ],
            ),
            kHeight5,
            const CustomTextFormField(
              hintText: 'New Baneshwor',
            ),
            kHeight20,
            CustomElevatedButton(
              callback: () {
                showModalBottomSheet<Widget>(
                  constraints: const BoxConstraints(minHeight: 600),
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const CustomModalSheetDrawerIcon(),
                        const Text(
                          'Bank Details',
                          style: kHeading2,
                        ),
                        kHeight20,
                        Row(
                          children: const [
                            Text(
                              'Bank Name',
                              style: kPurpleText16,
                            ),
                            kWidth10,
                            Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xffFE5050),
                              ),
                            ),
                          ],
                        ),
                        kHeight5,
                        const CustomTextFormField(
                          hintText: 'Nabil Bank Pvt. Ltd',
                        ),
                        kHeight20,
                        Row(
                          children: const [
                            Text(
                              'Bank Address',
                              style: kPurpleText16,
                            ),
                            kWidth10,
                            Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xffFE5050),
                              ),
                            ),
                          ],
                        ),
                        kHeight5,
                        const CustomTextFormField(
                          hintText: 'New Baneshwor, Kathmandu',
                        ),
                        kHeight20,
                        Row(
                          children: const [
                            Text(
                              'Bank Account Name',
                              style: kPurpleText16,
                            ),
                            kWidth10,
                            Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xffFE5050),
                              ),
                            ),
                          ],
                        ),
                        kHeight5,
                        const CustomTextFormField(
                          hintText: 'Harry Smith',
                        ),
                        kHeight20,
                        Row(
                          children: const [
                            Text(
                              'Bank Account Number',
                              style: kPurpleText16,
                            ),
                            kWidth10,
                            Text(
                              '*',
                              style: TextStyle(
                                color: Color(0xffFE5050),
                              ),
                            ),
                          ],
                        ),
                        kHeight5,
                        const CustomTextFormField(
                          hintText: '178459632023',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomCheckBox(
                                  onTap: () {},
                                ),
                                kWidth10,
                                const Text('Save as Primary Bank'),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                '+Add More Bank',
                                style: kLightBlueText10,
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          callback: () {
                            showModalBottomSheet<Widget>(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                // height:
                                // MediaQuery.of(context).size.height * 0.75,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Center(
                                        child: CustomModalSheetDrawerIcon(),
                                      ),
                                      const Center(
                                        child: Text(
                                          'Identity Information',
                                          style: kHeading2,
                                        ),
                                      ),
                                      kHeight20,
                                      Row(
                                        children: const [
                                          Text(
                                            'Identity Type',
                                            style: kPurpleText16,
                                          ),
                                          kWidth10,
                                          Text(
                                            '*',
                                            style: TextStyle(
                                              color: Color(0xffFE5050),
                                            ),
                                          ),
                                        ],
                                      ),
                                      kHeight5,
                                      const CustomTextFormField(
                                        hintText: 'Driving License',
                                      ),
                                      kHeight20,
                                      Row(
                                        children: const [
                                          Text(
                                            'Identity Number',
                                            style: kPurpleText16,
                                          ),
                                          kWidth10,
                                          Text(
                                            '*',
                                            style: TextStyle(
                                              color: Color(0xffFE5050),
                                            ),
                                          ),
                                        ],
                                      ),
                                      kHeight5,
                                      const CustomTextFormField(
                                        hintText: '3212312-12312-123123',
                                      ),
                                      kHeight20,
                                      Row(
                                        children: const [
                                          Text(
                                            'Issued from',
                                            style: kPurpleText16,
                                          ),
                                          kWidth10,
                                          Text(
                                            '*',
                                            style: TextStyle(
                                              color: Color(0xffFE5050),
                                            ),
                                          ),
                                        ],
                                      ),
                                      kHeight5,
                                      const CustomTextFormField(
                                        hintText: 'Kathmandu',
                                      ),
                                      kHeight20,
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Issued Date',
                                                      style: kPurpleText16,
                                                    ),
                                                    kWidth10,
                                                    Text(
                                                      '*',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFE5050),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                kHeight5,
                                                const CustomTextFormField(
                                                  hintText: '03/06/1999',
                                                ),
                                              ],
                                            ),
                                          ),
                                          kWidth20,
                                          Flexible(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Expiry Date',
                                                      style: kPurpleText16,
                                                    ),
                                                    kWidth10,
                                                    Text(
                                                      '*',
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xffFE5050),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                kHeight5,
                                                const CustomTextFormField(
                                                  hintText: '03/08/2002',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      kHeight20,
                                      Row(
                                        children: const [
                                          Text(
                                            'Documents',
                                            style: kPurpleText16,
                                          ),
                                          kWidth10,
                                          Text(
                                            '*',
                                            style: TextStyle(
                                              color: Color(0xffFE5050),
                                            ),
                                          ),
                                        ],
                                      ),
                                      kHeight5,
                                      Row(
                                        children: const [
                                          Text(
                                            'Maximum file size 20 MB',
                                            style: kHelper1,
                                          ),
                                          kWidth10,
                                          Icon(
                                            Icons.info_outline,
                                            color: Color(0xffFF9700),
                                          )
                                        ],
                                      ),
                                      kHeight5,
                                      const CustomTextFormField(
                                        hintText: 'Driving License',
                                      ),
                                      kHeight20,
                                      Center(
                                        child: CustomElevatedButton(
                                          callback: () {},
                                          label: 'Next',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          label: 'Next',
                        ),
                      ],
                    ),
                  ),
                );
              },
              label: 'Next',
            )
          ],
        ),
      ),
    );
  }
}
