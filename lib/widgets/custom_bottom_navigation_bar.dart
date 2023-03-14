import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int pageIndex = 0;
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FloatingOptionsCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint0 = Paint()
      ..color = kColorPrimary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final path0 = Path();
    path0.moveTo(size.width * 0.5012500, size.height);
    path0.cubicTo(
      size.width * 0.4387500,
      size.height * 0.9975000,
      size.width * 0.4387500,
      size.height * 0.7525000,
      size.width * 0.3762500,
      size.height * 0.7500000,
    );
    path0.cubicTo(
      size.width * 0.3137500,
      size.height * 0.7500000,
      size.width * 0.2500000,
      size.height * 0.7500000,
      size.width * 0.1875000,
      size.height * 0.7500000,
    );
    path0.cubicTo(
      size.width * 0.1162500,
      size.height * 0.7500000,
      size.width * 0.1125000,
      0,
      size.width * 0.1875000,
      0,
    );
    path0.quadraticBezierTo(
      size.width * 0.2812500,
      0,
      size.width * 0.5012500,
      0,
    );
    path0.quadraticBezierTo(
      size.width * 0.7187500,
      size.height * 0.0050000,
      size.width * 0.8125000,
      0,
    );
    path0.cubicTo(
      size.width * 0.8875000,
      0,
      size.width * 0.8875000,
      size.height * 0.7500000,
      size.width * 0.8125000,
      size.height * 0.7500000,
    );
    path0.cubicTo(
      size.width * 0.7500000,
      size.height * 0.7450000,
      size.width * 0.6887500,
      size.height * 0.7500000,
      size.width * 0.6262500,
      size.height * 0.7500000,
    );
    path0.cubicTo(
      size.width * 0.5637500,
      size.height * 0.7525000,
      size.width * 0.5637500,
      size.height * 1.0025000,
      size.width * 0.5012500,
      size.height,
    );
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BottomNavCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint0 = Paint()
      ..color = kColorPrimary
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    final path0 = Path();
    path0.moveTo(0, size.height);
    path0.quadraticBezierTo(
      size.width * 0.0006250,
      0,
      size.width * 0.0625000,
      0,
    );
    path0.quadraticBezierTo(
      size.width * 0.2968750,
      0,
      size.width * 0.3750000,
      0,
    );
    path0.cubicTo(
      size.width * 0.4375000,
      size.height * 0.0025000,
      size.width * 0.4375000,
      size.height * 0.2525000,
      size.width * 0.5000000,
      size.height * 0.2500000,
    );
    path0.cubicTo(
      size.width * 0.5625000,
      size.height * 0.2525000,
      size.width * 0.5625000,
      size.height * 0.0025000,
      size.width * 0.6250000,
      0,
    );
    path0.quadraticBezierTo(
      size.width * 0.7031250,
      0,
      size.width * 0.9375000,
      0,
    );
    path0.quadraticBezierTo(size.width * 1.0006250, 0, size.width, size.height);
    path0.cubicTo(
      size.width * 0.7500000,
      size.height,
      size.width * 0.7500000,
      size.height,
      0,
      size.height,
    );
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
