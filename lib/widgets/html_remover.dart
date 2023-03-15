import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class HtmlRemover extends StatelessWidget {
  const HtmlRemover({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      Bidi.stripHtmlIfNeeded(text),
      textAlign: TextAlign.start,
    );
  }
}
