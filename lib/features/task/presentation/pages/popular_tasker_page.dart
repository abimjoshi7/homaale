import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopularTaskerPage extends StatelessWidget {
  static const routeName = '/popular-tasker-page';
  const PopularTaskerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(
            50,
          ),
          const CustomHeader(
            label: 'Popular Taskers',
          ),
          const Divider(),
          SizedBox(
            height: 35,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              children: [
                const Icon(
                  Icons.filter_alt_outlined,
                  color: kColorSilver,
                ),
                addHorizontalSpace(5),
                ChoiceChip(
                  label: Row(
                    children: const [
                      Text(
                        'Category',
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: kColorGrey),
                  selected: false,
                  disabledColor: Colors.white,
                ),
                addHorizontalSpace(5),
                ChoiceChip(
                  label: Row(
                    children: const [
                      Text(
                        'Buddhanagar',
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: kColorGrey),
                  selected: false,
                  disabledColor: Colors.white,
                ),
                addHorizontalSpace(5),
                ChoiceChip(
                  label: Row(
                    children: const [
                      Text(
                        'Any Price',
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: kColorGrey),
                  selected: false,
                  disabledColor: Colors.white,
                ),
                addHorizontalSpace(5),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskerCard(
                  callback: () {
                    // print(123);
                  },
                ),
              ),
              itemCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
