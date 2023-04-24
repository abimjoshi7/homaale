import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SupportTicketCard extends StatelessWidget {
  const SupportTicketCard({
    Key? key,
    required this.isTicketClosed,
  }) : super(key: key);
  final bool isTicketClosed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 170,
        width: 382,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: EdgeInsets.only(
          left: 23.5,
          right: 10.0,
          top: 10.0,
          bottom: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  'assets/support/headphones.png',
                  height: 40.0,
                  width: 40.0,
                ),
                addHorizontalSpace(8.0),
                Text(
                  'Ticket No. 1114',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                addHorizontalSpace(115.0),
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    side: MaterialStateProperty.all((isTicketClosed)
                        ? BorderSide(
                            color: Colors.grey.shade600,
                          )
                        : BorderSide.none),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                      (!isTicketClosed) ? Color(0xff38C675) : Colors.white,
                    ),
                  ),
                  child: Text(
                    isTicketClosed ? 'Closed' : 'Open',
                    style: kText13.copyWith(
                      color: (isTicketClosed)
                          ? Colors.grey.shade600
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(6.0),
            Divider(
              color: Colors.grey.shade300,
              thickness: 2.0,
            ),
            addVerticalSpace(20.0),
            Text(
              'Billing Related Issue',
              style: kHeading3,
            ),
            addVerticalSpace(4.0),
            Text(
              'Consumer support Consumer support',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'Last Update: ',
                    style: Theme.of(context).textTheme.bodySmall,
                    children: <InlineSpan>[
                      TextSpan(
                        text: '2022-11-19',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 9.0),
                  child: Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
