import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class HtmlRemover extends StatelessWidget {
  const HtmlRemover({
    super.key,
    required this.text,
    this.textAlign = TextAlign.start,
  });

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      Bidi.stripHtmlIfNeeded(text),
      textAlign: textAlign,
    );
  }
}
