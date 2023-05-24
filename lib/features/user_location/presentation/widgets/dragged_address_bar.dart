import 'package:flutter/material.dart';

class DraggedAddressBar extends StatelessWidget {
  final String draggedAddress;
  const DraggedAddressBar({super.key, required this.draggedAddress});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60.0,
        color: Colors.blue,
        child: Text(
          draggedAddress,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
