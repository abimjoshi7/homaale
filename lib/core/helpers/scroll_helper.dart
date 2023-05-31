import 'package:flutter/material.dart';

class ScrollHelper {
  static void nextPageTrigger(ScrollController controller, void any) {
    var next = 0.8 * controller.position.maxScrollExtent;
    if (controller.offset > next) any;
  }
}
