import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PreferencesJoinAs extends StatefulWidget {
  const PreferencesJoinAs({super.key});

  @override
  State<PreferencesJoinAs> createState() => _PreferencesJoinAsState();
}

class _PreferencesJoinAsState extends State<PreferencesJoinAs> {
  bool isIndividual = true;
  bool isOrganization = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'You want to join as',
          style: kText16,
        ),
        kHeight20,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQueryHelper.theHeight(context) * 0.05,
              width: double.infinity,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/z.png'),
                          kWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Individual'),
                              Text(
                                'You’re starting as an alone warrior',
                                style: kHelper1,
                              )
                            ],
                          )
                        ],
                      ),
                      CustomRadio(
                        isSelected: isIndividual,
                        onTap: () => setState(
                          () {
                            isIndividual = !isIndividual;
                            isOrganization = !isIndividual;
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        kHeight20,
        Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQueryHelper.theHeight(context) * 0.05,
              width: double.infinity,
              child: Column(
                children: [
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/x.png'),
                          kWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Organization'),
                              Text(
                                'We’re starting as an group of individual ',
                                style: kHelper1,
                              )
                            ],
                          )
                        ],
                      ),
                      CustomRadio(
                        isSelected: isOrganization,
                        onTap: () => setState(
                          () {
                            isIndividual = !isIndividual;
                            isOrganization = !isIndividual;
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        kHeight20,
      ],
    );
  }
}
