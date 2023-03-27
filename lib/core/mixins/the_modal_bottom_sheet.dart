import 'package:cipher/widgets/custom_modal_sheet_drawer_icon.dart';
import 'package:flutter/material.dart';

mixin TheModalBottomSheet {
  showCustomBottomSheet({
    required BuildContext context,
    required Widget widget,
  }) async {
    await showModalBottomSheet(
      constraints: BoxConstraints.loose(
        Size(
          double.infinity,
          MediaQuery.of(context).size.height * 0.8,
        ),
      ),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomModalSheetDrawerIcon(),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
