import 'package:cipher/features/redeem/statement/presentation/pages/redeem_statement_selected_tap.dart';
import 'package:flutter/material.dart';
import 'all_statement_selected_tap.dart';
import 'earned_statement_selected_tap.dart';

class StatementSection extends StatefulWidget {
  const StatementSection({Key? key}) : super(key: key);

  @override
  State<StatementSection> createState() => _StatementSectionState();
}

class _StatementSectionState extends State<StatementSection> {
  int? _value = 0;
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
                      _value = index;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ),
        if (_value == 0) AllStatementSelectedTap(),
        if (_value == 1) EarnedStatementSelectedTap(),
        if (_value == 2) RedeemedStatementSelectedTap(),
      ],
    );
  }
}
