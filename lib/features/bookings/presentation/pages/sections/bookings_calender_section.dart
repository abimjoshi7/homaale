import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BookingsCalenderSection extends StatefulWidget {
  const BookingsCalenderSection({
    super.key,
  });

  @override
  State<BookingsCalenderSection> createState() =>
      _BookingsCalenderSectionState();
}

class _BookingsCalenderSectionState extends State<BookingsCalenderSection> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dec-2022'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month_rounded,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected[index] = !isSelected[index];
                  });
                },
                child: Container(
                  width: 45,
                  decoration: BoxDecoration(
                    color: isSelected[index] == true
                        ? kColorPrimary
                        : const Color(0xffF1F3F5),
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        weekNames[index],
                        style: kBodyText1,
                      ),
                      kHeight5,
                      Text(
                        '0${index + 1}',
                        style: kBodyText1,
                      ),
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => addHorizontalSpace(20),
              itemCount: isSelected.length,
            ),
          )
        ],
      ),
    );
  }
}
