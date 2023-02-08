import 'dart:ui' as ui;

import 'package:flutter/material.dart';
// child: CustomPaint(
//   size: Size(WIDTH,(WIDTH*0.3125).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//   painter: RPSCustomPainter(),
// ),

// class RPSCustomPainter extends CustomPainter{

//   @override
//   void paint(Canvas canvas, Size size) {

//   Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;

//     Path path0 = Path();
//     path0.moveTo(size.width*0.0037500,size.height*0.9960000);
//     path0.lineTo(size.width*0.0037500,size.height*0.9200000);
//     path0.lineTo(size.width*0.0025000,size.height*0.7040000);
//     path0.lineTo(0,size.height*0.6080000);
//     path0.lineTo(size.width*0.0012500,size.height*0.5360000);
//     path0.lineTo(size.width*0.0125000,size.height*0.4800000);
//     path0.lineTo(size.width*0.0287500,size.height*0.4800000);
//     path0.lineTo(size.width*0.0550000,size.height*0.4800000);
//     path0.lineTo(size.width*0.0562500,size.height*0.4800000);
//     path0.lineTo(size.width*0.3875000,size.height*0.4800000);
//     path0.lineTo(size.width*0.4300000,size.height*0.4800000);
//     path0.lineTo(size.width*0.4362500,size.height*0.4800000);
//     path0.lineTo(size.width*0.4362500,size.height*0.5160000);
//     path0.lineTo(size.width*0.4412500,size.height*0.5320000);
//     path0.lineTo(size.width*0.4475000,size.height*0.5400000);
//     path0.lineTo(size.width*0.4550000,size.height*0.5600000);
//     path0.lineTo(size.width*0.4662500,size.height*0.5800000);
//     path0.lineTo(size.width*0.4762500,size.height*0.5880000);
//     path0.lineTo(size.width*0.4837500,size.height*0.5880000);
//     path0.lineTo(size.width*0.4950000,size.height*0.5880000);
//     path0.lineTo(size.width*0.5000000,size.height*0.5880000);
//     path0.lineTo(size.width*0.5062500,size.height*0.5880000);
//     path0.lineTo(size.width*0.5112500,size.height*0.5760000);
//     path0.lineTo(size.width*0.5162500,size.height*0.5640000);
//     path0.lineTo(size.width*0.5275000,size.height*0.5640000);
//     path0.lineTo(size.width*0.5362500,size.height*0.5440000);
//     path0.lineTo(size.width*0.5462500,size.height*0.5200000);
//     path0.lineTo(size.width*0.5500000,size.height*0.5000000);
//     path0.lineTo(size.width*0.5587500,size.height*0.4680000);
//     path0.lineTo(size.width*0.6237500,size.height*0.4720000);
//     path0.lineTo(size.width*0.6900000,size.height*0.4760000);
//     path0.lineTo(size.width*0.7500000,size.height*0.4760000);
//     path0.lineTo(size.width*0.8050000,size.height*0.4760000);
//     path0.lineTo(size.width*0.8687500,size.height*0.4760000);
//     path0.lineTo(size.width*0.9087500,size.height*0.4720000);
//     path0.lineTo(size.width*0.9412500,size.height*0.4720000);
//     path0.lineTo(size.width*0.9675000,size.height*0.4720000);
//     path0.lineTo(size.width*0.9825000,size.height*0.4720000);
//     path0.lineTo(size.width*0.9912500,size.height*0.5080000);
//     path0.lineTo(size.width*0.9962500,size.height*0.5960000);
//     path0.lineTo(size.width*0.9962500,size.height*0.6480000);
//     path0.lineTo(size.width*0.9987500,size.height*0.7240000);
//     path0.lineTo(size.width,size.height*0.9880000);
//     path0.lineTo(size.width*0.5025000,size.height);
//     path0.lineTo(size.width*0.0037500,size.height*0.9960000);
//     path0.close();

//     canvas.drawPath(path0, paint0);

//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }

// }

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 74, 6, 176)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0025000, size.height * 1.0080000);
    path0.lineTo(size.width * 0.0037500, size.height * 0.5840000);
    path0.lineTo(size.width * 0.0012500, size.height * 0.5560000);
    path0.lineTo(size.width * 0.0100000, size.height * 0.4640000);
    path0.lineTo(size.width * 0.0262500, size.height * 0.4320000);
    path0.lineTo(size.width * 0.0650000, size.height * 0.4200000);
    path0.lineTo(size.width * 0.4362500, size.height * 0.4160000);
    path0.lineTo(size.width * 0.4525000, size.height * 0.5320000);
    path0.lineTo(size.width * 0.4775000, size.height * 0.6160000);
    path0.lineTo(size.width * 0.5012500, size.height * 0.6400000);
    path0.lineTo(size.width * 0.5275000, size.height * 0.6120000);
    path0.lineTo(size.width * 0.5487500, size.height * 0.5320000);
    path0.lineTo(size.width * 0.5612500, size.height * 0.4160000);
    path0.lineTo(size.width * 0.9412500, size.height * 0.4200000);
    path0.lineTo(size.width * 0.9637500, size.height * 0.4360000);
    path0.lineTo(size.width * 0.9775000, size.height * 0.4680000);
    path0.lineTo(size.width * 0.9912500, size.height * 0.5160000);
    path0.lineTo(size.width * 0.9987500, size.height * 0.5880000);
    path0.lineTo(size.width * 1.0025000, size.height * 1.0080000);
    path0.lineTo(size.width * 0.0025000, size.height * 1.0080000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 74, 6, 176)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;

//     Path path0 = Path();
//     path0.moveTo(0, size.height);
//     path0.lineTo(size.width * 0.0012500, size.height * 0.4480000);
//     path0.lineTo(0, size.height * 0.3400000);
//     path0.lineTo(size.width * 0.0087500, size.height * 0.2480000);
//     path0.lineTo(size.width * 0.0250000, size.height * 0.2160000);
//     path0.lineTo(size.width * 0.0637500, size.height * 0.2040000);
//     path0.lineTo(size.width * 0.4350000, size.height * 0.2000000);
//     path0.lineTo(size.width * 0.4512500, size.height * 0.3160000);
//     path0.lineTo(size.width * 0.4762500, size.height * 0.4000000);
//     path0.lineTo(size.width * 0.5000000, size.height * 0.4240000);
//     path0.lineTo(size.width * 0.5262500, size.height * 0.3960000);
//     path0.lineTo(size.width * 0.5475000, size.height * 0.3160000);
//     path0.lineTo(size.width * 0.5600000, size.height * 0.2000000);
//     path0.lineTo(size.width * 0.9400000, size.height * 0.2040000);
//     path0.lineTo(size.width * 0.9625000, size.height * 0.2200000);
//     path0.lineTo(size.width * 0.9762500, size.height * 0.2520000);
//     path0.lineTo(size.width * 0.9900000, size.height * 0.3000000);
//     path0.lineTo(size.width * 0.9975000, size.height * 0.3720000);
//     path0.lineTo(size.width, size.height);
//     path0.lineTo(0, size.height);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
