import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

mixin AddSkills {
  dynamic showAddSkills(BuildContext context) async {
    await showModalBottomSheet<Widget>(
      context: context,
      builder: (context) => Column(
        children: [
          const CustomModalSheetDrawerIcon(),
          kHeight20,
           Text(
            'Add new skills',
            style: kPurpleText19,
          ),
          kHeight20,
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Skills',
                      style: kBodyText1,
                    ),
                    kHeight10,
                    Wrap(
                      spacing: 10,
                      children: const [
                        Chip(
                          backgroundColor: Color(0xffECFCE5),
                          deleteIcon: Icon(Icons.close_rounded),
                          label: Text(
                            'Planting',
                            style: TextStyle(color: Color(0xff198155)),
                          ),
                        ),
                        Chip(
                          backgroundColor: Color(0xffECFCE5),
                          deleteIcon: Icon(Icons.close_rounded),
                          label: Text(
                            'Washing',
                            style: TextStyle(color: Color(0xff198155)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Suggested Skills',
                      style: kBodyText1,
                    ),
                    kHeight10,
                    Wrap(
                      spacing: 10,
                      children: const [
                        Chip(
                          backgroundColor: Color(0xffC9F0FF),
                          deleteIcon: Icon(Icons.close_rounded),
                          label: Text(
                            'Washing',
                            style: TextStyle(color: Color(0xff0065D0)),
                          ),
                        ),
                        Chip(
                          backgroundColor: Color(0xffC9F0FF),
                          deleteIcon: Icon(Icons.close_rounded),
                          label: Text(
                            'Laundry',
                            style: TextStyle(color: Color(0xff0065D0)),
                          ),
                        ),
                        Chip(
                          backgroundColor: Color(0xffC9F0FF),
                          deleteIcon: Icon(Icons.close_rounded),
                          label: Text(
                            'Cleaning',
                            style: TextStyle(color: Color(0xff0065D0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomElevatedButton(
            callback: () {},
            label: 'Add',
          ),
          kHeight50,
        ],
      ),
    );
  }
}
