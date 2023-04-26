
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const CustomOutlinedButton({
    super.key,
    this.width = 178.0,
    this.height = 41.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 178.0,
      height: 41.0,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          elevation: MaterialStateProperty.all(0),
        ),
        child: child,
      ),
    );
  }
}
