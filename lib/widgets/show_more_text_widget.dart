import 'package:flutter/material.dart';

class ShowMoreTextWidget extends StatefulWidget {
  const ShowMoreTextWidget({super.key, required this.text});
  final String text;

  @override
  State<ShowMoreTextWidget> createState() => _ShowMoreTextWidgetState();
}

class _ShowMoreTextWidgetState extends State<ShowMoreTextWidget> {
  bool showAll = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          maxLines: showAll ? widget.text.length : 3,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showAll = !showAll;
            });
          },
          child: Text(
            showAll ? 'See less' : 'See more',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
