import 'package:cipher/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class StatementSection extends StatefulWidget {
  const StatementSection({Key? key}) : super(key: key);

  @override
  State<StatementSection> createState() => _StatementSectionState();
}

class _StatementSectionState extends State<StatementSection> {
  int? _value = 1;
  List item = ['All', 'Earned', 'Redeemed'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              item.length,
              (int index) {
                return ChoiceChip(
                  selectedColor: Colors.blue,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey),
                  label: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${item[index]}',
                          style: TextStyle(
                              color: _value == index
                                  ? Colors.white
                                  : Colors.black54),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 20,
                            color: _value == index ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300)),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Reward points used for"),
                            Container(
                              margin: EdgeInsets.all(3),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(5),
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Purple Love',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      addVerticalSpace(10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Point : 50 Pts'),
                            Text('created date'),
                          ],
                        ),
                      ),
                      addVerticalSpace(10),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: 4),
        )
      ],
    );
  }
}
