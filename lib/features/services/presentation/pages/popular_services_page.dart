import 'package:cipher/core/constants/colors.dart';
import 'package:cipher/core/constants/dimensions.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopularServicesPage extends StatelessWidget {
  static const routeName = '/popular-services-page';
  const PopularServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(
            50,
          ),
          CustomHeader(
            label: 'Popular Services',
          ),
          Divider(),
          SizedBox(
            height: 35,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  color: kColorSilver,
                ),
                addHorizontalSpace(5),
                ChoiceChip(
                  label: Row(
                    children: [
                      Text(
                        'Category',
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: kColorGrey),
                  selected: false,
                  disabledColor: Colors.white,
                ),
                addHorizontalSpace(5),
                ChoiceChip(
                  label: Row(
                    children: [
                      Text(
                        'Buddhanagar',
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: kColorGrey),
                  selected: false,
                  disabledColor: Colors.white,
                ),
                addHorizontalSpace(5),
                ChoiceChip(
                  label: Row(
                    children: [
                      Text(
                        'Any Price',
                      ),
                      Icon(Icons.keyboard_arrow_down_outlined)
                    ],
                  ),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: kColorGrey),
                  selected: false,
                  disabledColor: Colors.white,
                ),
                addHorizontalSpace(5),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskCard(),
              ),
              itemCount: 8,
            ),
          ),
        ],
      ),
    );
  }
}
