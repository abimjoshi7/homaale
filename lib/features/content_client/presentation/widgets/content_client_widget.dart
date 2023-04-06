// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentClientWidget extends StatelessWidget {
  final String contentClientTitle;
  final dynamic state;
  final String? date;
  const ContentClientWidget({
    Key? key,
    required this.state,
    required this.date,
    required this.contentClientTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AutoSizeText(
          contentClientTitle,
          style: kLabelPrimary.copyWith(
            color: kColorPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        addVerticalSpace(4),
        AutoSizeText(
          "Updated ${date ?? 'Not Specified'}",
          style: kSubHeading,
        ),
        addVerticalSpace(20.0),
        // HtmlRemover(
        //   text: state.contentClient!.content.toString(),
        //   textAlign: TextAlign.justify,
        // ),
        Html(
          data: state.contentClient!.content.toString(),
          style: {
            "p": Style(
              textAlign: TextAlign.justify,
            ),
          },
        ),
      ],
    );
  }
}
