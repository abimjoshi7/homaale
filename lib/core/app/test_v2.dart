import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// //Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*0.2028985507246377).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2380952);
    path_0.cubicTo(0, size.height * 0.1065988, size.width * 0.02162874, 0,
        size.width * 0.04830918, 0);
    path_0.lineTo(size.width * 0.9516908, 0);
    path_0.cubicTo(size.width * 0.9783720, 0, size.width,
        size.height * 0.1065989, size.width, size.height * 0.2380952);
    path_0.lineTo(size.width, size.height * 0.6428571);
    path_0.cubicTo(size.width, size.height * 0.8401012, size.width * 0.9675580,
        size.height, size.width * 0.9275362, size.height);
    path_0.lineTo(size.width * 0.07246377, size.height);
    path_0.cubicTo(size.width * 0.03244324, size.height, 0,
        size.height * 0.8401012, 0, size.height * 0.6428571);
    path_0.lineTo(0, size.height * 0.2380952);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff211D4F).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.1355676, size.height * 0.3188238);
    path_1.cubicTo(
        size.width * 0.1367000,
        size.height * 0.3244048,
        size.width * 0.1367754,
        size.height * 0.3307286,
        size.width * 0.1357942,
        size.height * 0.3377976);
    path_1.cubicTo(
        size.width * 0.1346618,
        size.height * 0.3433786,
        size.width * 0.1334164,
        size.height * 0.3437500,
        size.width * 0.1320577,
        size.height * 0.3389143);
    path_1.lineTo(size.width * 0.1292271, size.height * 0.3277524);
    path_1.lineTo(size.width * 0.1292271, size.height * 0.4315476);
    path_1.cubicTo(
        size.width * 0.1291517,
        size.height * 0.4441964,
        size.width * 0.1282836,
        size.height * 0.4547988,
        size.width * 0.1266229,
        size.height * 0.4633560);
    path_1.cubicTo(
        size.width * 0.1248867,
        size.height * 0.4715405,
        size.width * 0.1227355,
        size.height * 0.4758190,
        size.width * 0.1201691,
        size.height * 0.4761905);
    path_1.lineTo(size.width * 0.08756039, size.height * 0.4761905);
    path_1.cubicTo(
        size.width * 0.08499396,
        size.height * 0.4758190,
        size.width * 0.08284275,
        size.height * 0.4715405,
        size.width * 0.08110652,
        size.height * 0.4633560);
    path_1.cubicTo(
        size.width * 0.07944589,
        size.height * 0.4547988,
        size.width * 0.07857778,
        size.height * 0.4441964,
        size.width * 0.07850242,
        size.height * 0.4315476);
    path_1.lineTo(size.width * 0.07850242, size.height * 0.3277524);
    path_1.lineTo(size.width * 0.07578502, size.height * 0.3389143);
    path_1.cubicTo(
        size.width * 0.07435072,
        size.height * 0.3437500,
        size.width * 0.07306763,
        size.height * 0.3433786,
        size.width * 0.07193527,
        size.height * 0.3377976);
    path_1.cubicTo(
        size.width * 0.07095411,
        size.height * 0.3307286,
        size.width * 0.07102947,
        size.height * 0.3244048,
        size.width * 0.07216184,
        size.height * 0.3188238);
    path_1.lineTo(size.width * 0.1021664, size.height * 0.1938238);
    path_1.cubicTo(
        size.width * 0.1032986,
        size.height * 0.1893595,
        size.width * 0.1044686,
        size.height * 0.1893595,
        size.width * 0.1056763,
        size.height * 0.1938238);
    path_1.lineTo(size.width * 0.1355676, size.height * 0.3188238);
    path_1.close();
    path_1.moveTo(size.width * 0.08756039, size.height * 0.4494048);
    path_1.lineTo(size.width * 0.09299517, size.height * 0.4494048);
    path_1.lineTo(size.width * 0.09299517, size.height * 0.3645833);
    path_1.cubicTo(
        size.width * 0.09299517,
        size.height * 0.3582595,
        size.width * 0.09344807,
        size.height * 0.3530500,
        size.width * 0.09435386,
        size.height * 0.3489583);
    path_1.cubicTo(
        size.width * 0.09518406,
        size.height * 0.3444940,
        size.width * 0.09624106,
        size.height * 0.3422619,
        size.width * 0.09752415,
        size.height * 0.3422619);
    path_1.lineTo(size.width * 0.1102053, size.height * 0.3422619);
    path_1.cubicTo(
        size.width * 0.1114884,
        size.height * 0.3422619,
        size.width * 0.1125454,
        size.height * 0.3444940,
        size.width * 0.1133756,
        size.height * 0.3489583);
    path_1.cubicTo(
        size.width * 0.1142814,
        size.height * 0.3530500,
        size.width * 0.1147343,
        size.height * 0.3582595,
        size.width * 0.1147343,
        size.height * 0.3645833);
    path_1.lineTo(size.width * 0.1147343, size.height * 0.4494048);
    path_1.lineTo(size.width * 0.1201691, size.height * 0.4494048);
    path_1.cubicTo(
        size.width * 0.1212258,
        size.height * 0.4494048,
        size.width * 0.1220940,
        size.height * 0.4477310,
        size.width * 0.1227732,
        size.height * 0.4443821);
    path_1.cubicTo(
        size.width * 0.1234527,
        size.height * 0.4410345,
        size.width * 0.1237923,
        size.height * 0.4367560,
        size.width * 0.1237923,
        size.height * 0.4315476);
    path_1.lineTo(size.width * 0.1237923, size.height * 0.3048738);
    path_1.lineTo(size.width * 0.1038647, size.height * 0.2211679);
    path_1.lineTo(size.width * 0.08393720, size.height * 0.3048738);
    path_1.lineTo(size.width * 0.08393720, size.height * 0.4315476);
    path_1.cubicTo(
        size.width * 0.08393720,
        size.height * 0.4367560,
        size.width * 0.08427681,
        size.height * 0.4410345,
        size.width * 0.08495628,
        size.height * 0.4443821);
    path_1.cubicTo(
        size.width * 0.08563551,
        size.height * 0.4477310,
        size.width * 0.08650362,
        size.height * 0.4494048,
        size.width * 0.08756039,
        size.height * 0.4494048);
    path_1.close();
    path_1.moveTo(size.width * 0.09842995, size.height * 0.4494048);
    path_1.lineTo(size.width * 0.1092995, size.height * 0.4494048);
    path_1.lineTo(size.width * 0.1092995, size.height * 0.3690476);
    path_1.lineTo(size.width * 0.09842995, size.height * 0.3690476);
    path_1.lineTo(size.width * 0.09842995, size.height * 0.4494048);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.08286208, size.height * 0.5958333);
    path_2.lineTo(size.width * 0.08286208, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.08010845, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.08010845, size.height * 0.6423810);
    path_2.lineTo(size.width * 0.07220990, size.height * 0.6423810);
    path_2.lineTo(size.width * 0.07220990, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.06945628, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.06945628, size.height * 0.5958333);
    path_2.lineTo(size.width * 0.07220990, size.height * 0.5958333);
    path_2.lineTo(size.width * 0.07220990, size.height * 0.6313095);
    path_2.lineTo(size.width * 0.08010845, size.height * 0.6313095);
    path_2.lineTo(size.width * 0.08010845, size.height * 0.5958333);
    path_2.lineTo(size.width * 0.08286208, size.height * 0.5958333);
    path_2.close();
    path_2.moveTo(size.width * 0.09226014, size.height * 0.6796429);
    path_2.cubicTo(
        size.width * 0.09100411,
        size.height * 0.6796429,
        size.width * 0.08986884,
        size.height * 0.6782536,
        size.width * 0.08885435,
        size.height * 0.6754762);
    path_2.cubicTo(
        size.width * 0.08783986,
        size.height * 0.6726190,
        size.width * 0.08704275,
        size.height * 0.6686512,
        size.width * 0.08646304,
        size.height * 0.6635714);
    path_2.cubicTo(
        size.width * 0.08588333,
        size.height * 0.6584131,
        size.width * 0.08559348,
        size.height * 0.6524607,
        size.width * 0.08559348,
        size.height * 0.6457143);
    path_2.cubicTo(
        size.width * 0.08559348,
        size.height * 0.6390476,
        size.width * 0.08589130,
        size.height * 0.6331345,
        size.width * 0.08648720,
        size.height * 0.6279762);
    path_2.cubicTo(
        size.width * 0.08708285,
        size.height * 0.6228179,
        size.width * 0.08789614,
        size.height * 0.6188488,
        size.width * 0.08892681,
        size.height * 0.6160714);
    path_2.cubicTo(
        size.width * 0.08995725,
        size.height * 0.6132940,
        size.width * 0.09110870,
        size.height * 0.6119048,
        size.width * 0.09238092,
        size.height * 0.6119048);
    path_2.cubicTo(
        size.width * 0.09365290,
        size.height * 0.6119048,
        size.width * 0.09480435,
        size.height * 0.6132940,
        size.width * 0.09583502,
        size.height * 0.6160714);
    path_2.cubicTo(
        size.width * 0.09686546,
        size.height * 0.6188488,
        size.width * 0.09767874,
        size.height * 0.6228179,
        size.width * 0.09827464,
        size.height * 0.6279762);
    path_2.cubicTo(
        size.width * 0.09887029,
        size.height * 0.6331345,
        size.width * 0.09916836,
        size.height * 0.6390476,
        size.width * 0.09916836,
        size.height * 0.6457143);
    path_2.cubicTo(
        size.width * 0.09916836,
        size.height * 0.6523810,
        size.width * 0.09886232,
        size.height * 0.6582940,
        size.width * 0.09825048,
        size.height * 0.6634524);
    path_2.cubicTo(
        size.width * 0.09763841,
        size.height * 0.6686107,
        size.width * 0.09680121,
        size.height * 0.6726190,
        size.width * 0.09573841,
        size.height * 0.6754762);
    path_2.cubicTo(
        size.width * 0.09469155,
        size.height * 0.6782536,
        size.width * 0.09353213,
        size.height * 0.6796429,
        size.width * 0.09226014,
        size.height * 0.6796429);
    path_2.close();
    path_2.moveTo(size.width * 0.09226014, size.height * 0.6678571);
    path_2.cubicTo(
        size.width * 0.09296860,
        size.height * 0.6678571,
        size.width * 0.09362874,
        size.height * 0.6670238,
        size.width * 0.09424082,
        size.height * 0.6653571);
    path_2.cubicTo(
        size.width * 0.09486884,
        size.height * 0.6636905,
        size.width * 0.09537609,
        size.height * 0.6611905,
        size.width * 0.09576256,
        size.height * 0.6578571);
    path_2.cubicTo(
        size.width * 0.09614903,
        size.height * 0.6545238,
        size.width * 0.09634227,
        size.height * 0.6504762,
        size.width * 0.09634227,
        size.height * 0.6457143);
    path_2.cubicTo(
        size.width * 0.09634227,
        size.height * 0.6409524,
        size.width * 0.09615700,
        size.height * 0.6369440,
        size.width * 0.09578671,
        size.height * 0.6336905);
    path_2.cubicTo(
        size.width * 0.09541618,
        size.height * 0.6303571,
        size.width * 0.09492512,
        size.height * 0.6278571,
        size.width * 0.09431329,
        size.height * 0.6261905);
    path_2.cubicTo(
        size.width * 0.09370121,
        size.height * 0.6245238,
        size.width * 0.09304106,
        size.height * 0.6236905,
        size.width * 0.09233261,
        size.height * 0.6236905);
    path_2.cubicTo(
        size.width * 0.09162391,
        size.height * 0.6236905,
        size.width * 0.09096377,
        size.height * 0.6245238,
        size.width * 0.09035193,
        size.height * 0.6261905);
    path_2.cubicTo(
        size.width * 0.08975604,
        size.height * 0.6278571,
        size.width * 0.08928092,
        size.height * 0.6303571,
        size.width * 0.08892681,
        size.height * 0.6336905);
    path_2.cubicTo(
        size.width * 0.08857246,
        size.height * 0.6369440,
        size.width * 0.08839541,
        size.height * 0.6409524,
        size.width * 0.08839541,
        size.height * 0.6457143);
    path_2.cubicTo(
        size.width * 0.08839541,
        size.height * 0.6527774,
        size.width * 0.08875773,
        size.height * 0.6582536,
        size.width * 0.08948237,
        size.height * 0.6621429);
    path_2.cubicTo(
        size.width * 0.09022295,
        size.height * 0.6659524,
        size.width * 0.09114903,
        size.height * 0.6678571,
        size.width * 0.09226014,
        size.height * 0.6678571);
    path_2.close();
    path_2.moveTo(size.width * 0.1180014, size.height * 0.6119048);
    path_2.cubicTo(
        size.width * 0.1190483,
        size.height * 0.6119048,
        size.width * 0.1199821,
        size.height * 0.6129762,
        size.width * 0.1208034,
        size.height * 0.6151190);
    path_2.cubicTo(
        size.width * 0.1216408,
        size.height * 0.6172619,
        size.width * 0.1222930,
        size.height * 0.6204369,
        size.width * 0.1227599,
        size.height * 0.6246429);
    path_2.cubicTo(
        size.width * 0.1232430,
        size.height * 0.6288488,
        size.width * 0.1234845,
        size.height * 0.6339286,
        size.width * 0.1234845,
        size.height * 0.6398810);
    path_2.lineTo(size.width * 0.1234845, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.1207551, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.1207551, size.height * 0.6419048);
    path_2.cubicTo(
        size.width * 0.1207551,
        size.height * 0.6360321,
        size.width * 0.1204572,
        size.height * 0.6315476,
        size.width * 0.1198614,
        size.height * 0.6284524);
    path_2.cubicTo(
        size.width * 0.1192657,
        size.height * 0.6252774,
        size.width * 0.1184524,
        size.height * 0.6236905,
        size.width * 0.1174217,
        size.height * 0.6236905);
    path_2.cubicTo(
        size.width * 0.1163913,
        size.height * 0.6236905,
        size.width * 0.1155700,
        size.height * 0.6252774,
        size.width * 0.1149580,
        size.height * 0.6284524);
    path_2.cubicTo(
        size.width * 0.1143623,
        size.height * 0.6315476,
        size.width * 0.1140643,
        size.height * 0.6360321,
        size.width * 0.1140643,
        size.height * 0.6419048);
    path_2.lineTo(size.width * 0.1140643, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.1113348, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.1113348, size.height * 0.6419048);
    path_2.cubicTo(
        size.width * 0.1113348,
        size.height * 0.6360321,
        size.width * 0.1110370,
        size.height * 0.6315476,
        size.width * 0.1104411,
        size.height * 0.6284524);
    path_2.cubicTo(
        size.width * 0.1098454,
        size.height * 0.6252774,
        size.width * 0.1090321,
        size.height * 0.6236905,
        size.width * 0.1080014,
        size.height * 0.6236905);
    path_2.cubicTo(
        size.width * 0.1069710,
        size.height * 0.6236905,
        size.width * 0.1061498,
        size.height * 0.6252774,
        size.width * 0.1055377,
        size.height * 0.6284524);
    path_2.cubicTo(
        size.width * 0.1049420,
        size.height * 0.6315476,
        size.width * 0.1046440,
        size.height * 0.6360321,
        size.width * 0.1046440,
        size.height * 0.6419048);
    path_2.lineTo(size.width * 0.1046440, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.1018903, size.height * 0.6785714);
    path_2.lineTo(size.width * 0.1018903, size.height * 0.6129762);
    path_2.lineTo(size.width * 0.1046440, size.height * 0.6129762);
    path_2.lineTo(size.width * 0.1046440, size.height * 0.6204762);
    path_2.cubicTo(
        size.width * 0.1050949,
        size.height * 0.6177774,
        size.width * 0.1056667,
        size.height * 0.6156750,
        size.width * 0.1063589,
        size.height * 0.6141667);
    path_2.cubicTo(
        size.width * 0.1070514,
        size.height * 0.6126583,
        size.width * 0.1077923,
        size.height * 0.6119048,
        size.width * 0.1085812,
        size.height * 0.6119048);
    path_2.cubicTo(
        size.width * 0.1096440,
        size.height * 0.6119048,
        size.width * 0.1105942,
        size.height * 0.6130155,
        size.width * 0.1114314,
        size.height * 0.6152381);
    path_2.cubicTo(
        size.width * 0.1122688,
        size.height * 0.6174607,
        size.width * 0.1129130,
        size.height * 0.6206750,
        size.width * 0.1133638,
        size.height * 0.6248810);
    path_2.cubicTo(
        size.width * 0.1137664,
        size.height * 0.6209131,
        size.width * 0.1143944,
        size.height * 0.6177774,
        size.width * 0.1152478,
        size.height * 0.6154762);
    path_2.cubicTo(
        size.width * 0.1161014,
        size.height * 0.6130952,
        size.width * 0.1170193,
        size.height * 0.6119048,
        size.width * 0.1180014,
        size.height * 0.6119048);
    path_2.close();
    path_2.moveTo(size.width * 0.1391865, size.height * 0.6441667);
    path_2.cubicTo(
        size.width * 0.1391865,
        size.height * 0.6466274,
        size.width * 0.1391543,
        size.height * 0.6488488,
        size.width * 0.1390899,
        size.height * 0.6508333);
    path_2.lineTo(size.width * 0.1289208, size.height * 0.6508333);
    path_2.cubicTo(
        size.width * 0.1290014,
        size.height * 0.6560714,
        size.width * 0.1293959,
        size.height * 0.6602774,
        size.width * 0.1301043,
        size.height * 0.6634524);
    path_2.cubicTo(
        size.width * 0.1308130,
        size.height * 0.6666274,
        size.width * 0.1316826,
        size.height * 0.6682143,
        size.width * 0.1327130,
        size.height * 0.6682143);
    path_2.cubicTo(
        size.width * 0.1341947,
        size.height * 0.6682143,
        size.width * 0.1352413,
        size.height * 0.6651583,
        size.width * 0.1358531,
        size.height * 0.6590476);
    path_2.lineTo(size.width * 0.1388242, size.height * 0.6590476);
    path_2.cubicTo(
        size.width * 0.1384217,
        size.height * 0.6650798,
        size.width * 0.1376889,
        size.height * 0.6700393,
        size.width * 0.1366261,
        size.height * 0.6739286);
    path_2.cubicTo(
        size.width * 0.1355795,
        size.height * 0.6777381,
        size.width * 0.1342751,
        size.height * 0.6796429,
        size.width * 0.1327130,
        size.height * 0.6796429);
    path_2.cubicTo(
        size.width * 0.1314411,
        size.height * 0.6796429,
        size.width * 0.1302976,
        size.height * 0.6782536,
        size.width * 0.1292831,
        size.height * 0.6754762);
    path_2.cubicTo(
        size.width * 0.1282848,
        size.height * 0.6726190,
        size.width * 0.1274957,
        size.height * 0.6686512,
        size.width * 0.1269159,
        size.height * 0.6635714);
    path_2.cubicTo(
        size.width * 0.1263524,
        size.height * 0.6584131,
        size.width * 0.1260705,
        size.height * 0.6524607,
        size.width * 0.1260705,
        size.height * 0.6457143);
    path_2.cubicTo(
        size.width * 0.1260705,
        size.height * 0.6389679,
        size.width * 0.1263444,
        size.height * 0.6330560,
        size.width * 0.1268918,
        size.height * 0.6279762);
    path_2.cubicTo(
        size.width * 0.1274556,
        size.height * 0.6228179,
        size.width * 0.1282365,
        size.height * 0.6188488,
        size.width * 0.1292348,
        size.height * 0.6160714);
    path_2.cubicTo(
        size.width * 0.1302493,
        size.height * 0.6132940,
        size.width * 0.1314087,
        size.height * 0.6119048,
        size.width * 0.1327130,
        size.height * 0.6119048);
    path_2.cubicTo(
        size.width * 0.1339691,
        size.height * 0.6119048,
        size.width * 0.1350884,
        size.height * 0.6132536,
        size.width * 0.1360705,
        size.height * 0.6159524);
    path_2.cubicTo(
        size.width * 0.1370529,
        size.height * 0.6186512,
        size.width * 0.1378179,
        size.height * 0.6224607,
        size.width * 0.1383652,
        size.height * 0.6273810);
    path_2.cubicTo(
        size.width * 0.1389128,
        size.height * 0.6322226,
        size.width * 0.1391865,
        size.height * 0.6378179,
        size.width * 0.1391865,
        size.height * 0.6441667);
    path_2.close();
    path_2.moveTo(size.width * 0.1363121, size.height * 0.6398810);
    path_2.cubicTo(
        size.width * 0.1362961,
        size.height * 0.6348810,
        size.width * 0.1359338,
        size.height * 0.6308726,
        size.width * 0.1352251,
        size.height * 0.6278571);
    path_2.cubicTo(
        size.width * 0.1345167,
        size.height * 0.6248417,
        size.width * 0.1336391,
        size.height * 0.6233333,
        size.width * 0.1325923,
        size.height * 0.6233333);
    path_2.cubicTo(
        size.width * 0.1316423,
        size.height * 0.6233333,
        size.width * 0.1308290,
        size.height * 0.6248417,
        size.width * 0.1301527,
        size.height * 0.6278571);
    path_2.cubicTo(
        size.width * 0.1294763,
        size.height * 0.6307940,
        size.width * 0.1290739,
        size.height * 0.6348012,
        size.width * 0.1289449,
        size.height * 0.6398810);
    path_2.lineTo(size.width * 0.1363121, size.height * 0.6398810);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.3300121, size.height * 0.4533107);
    path_3.lineTo(size.width * 0.3148406, size.height * 0.3785345);
    path_3.cubicTo(
        size.width * 0.3181618,
        size.height * 0.3580726,
        size.width * 0.3198599,
        size.height * 0.3340774,
        size.width * 0.3199348,
        size.height * 0.3065476);
    path_3.cubicTo(
        size.width * 0.3197850,
        size.height * 0.2738095,
        size.width * 0.3174831,
        size.height * 0.2464655,
        size.width * 0.3130290,
        size.height * 0.2245167);
    path_3.cubicTo(
        size.width * 0.3085749,
        size.height * 0.2025667,
        size.width * 0.3030266,
        size.height * 0.1912202,
        size.width * 0.2963841,
        size.height * 0.1904762);
    path_3.cubicTo(
        size.width * 0.2897415,
        size.height * 0.1912202,
        size.width * 0.2841932,
        size.height * 0.2025667,
        size.width * 0.2797391,
        size.height * 0.2245167);
    path_3.cubicTo(
        size.width * 0.2753623,
        size.height * 0.2464655,
        size.width * 0.2730966,
        size.height * 0.2738095,
        size.width * 0.2729469,
        size.height * 0.3065476);
    path_3.cubicTo(
        size.width * 0.2730966,
        size.height * 0.3392857,
        size.width * 0.2754010,
        size.height * 0.3666298,
        size.width * 0.2798527,
        size.height * 0.3885786);
    path_3.cubicTo(
        size.width * 0.2842319,
        size.height * 0.4105286,
        size.width * 0.2897415,
        size.height * 0.4218750,
        size.width * 0.2963841,
        size.height * 0.4226190);
    path_3.cubicTo(
        size.width * 0.3020459,
        size.height * 0.4222476,
        size.width * 0.3069130,
        size.height * 0.4138762,
        size.width * 0.3109903,
        size.height * 0.3975071);
    path_3.lineTo(size.width * 0.3261618, size.height * 0.4722845);
    path_3.cubicTo(
        size.width * 0.3268406,
        size.height * 0.4748881,
        size.width * 0.3275217,
        size.height * 0.4761905,
        size.width * 0.3282005,
        size.height * 0.4761905);
    path_3.cubicTo(
        size.width * 0.3289565,
        size.height * 0.4761905,
        size.width * 0.3295966,
        size.height * 0.4748881,
        size.width * 0.3301256,
        size.height * 0.4722845);
    path_3.cubicTo(
        size.width * 0.3311812,
        size.height * 0.4659595,
        size.width * 0.3311449,
        size.height * 0.4596357,
        size.width * 0.3300121,
        size.height * 0.4533107);
    path_3.close();
    path_3.moveTo(size.width * 0.2783816, size.height * 0.3065476);
    path_3.cubicTo(
        size.width * 0.2785314,
        size.height * 0.2812500,
        size.width * 0.2803068,
        size.height * 0.2602310,
        size.width * 0.2837029,
        size.height * 0.2434893);
    path_3.cubicTo(
        size.width * 0.2870990,
        size.height * 0.2267488,
        size.width * 0.2913647,
        size.height * 0.2180060,
        size.width * 0.2964976,
        size.height * 0.2172619);
    path_3.cubicTo(
        size.width * 0.3016304,
        size.height * 0.2180060,
        size.width * 0.3058961,
        size.height * 0.2267488,
        size.width * 0.3092923,
        size.height * 0.2434893);
    path_3.cubicTo(
        size.width * 0.3126884,
        size.height * 0.2602310,
        size.width * 0.3144638,
        size.height * 0.2812500,
        size.width * 0.3146135,
        size.height * 0.3065476);
    path_3.cubicTo(
        size.width * 0.3144638,
        size.height * 0.3318452,
        size.width * 0.3126884,
        size.height * 0.3528643,
        size.width * 0.3092923,
        size.height * 0.3696060);
    path_3.cubicTo(
        size.width * 0.3058961,
        size.height * 0.3863464,
        size.width * 0.3016304,
        size.height * 0.3950893,
        size.width * 0.2964976,
        size.height * 0.3958333);
    path_3.cubicTo(
        size.width * 0.2913647,
        size.height * 0.3950893,
        size.width * 0.2870990,
        size.height * 0.3863464,
        size.width * 0.2837029,
        size.height * 0.3696060);
    path_3.cubicTo(
        size.width * 0.2803068,
        size.height * 0.3528643,
        size.width * 0.2785314,
        size.height * 0.3318452,
        size.width * 0.2783816,
        size.height * 0.3065476);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.2666280, size.height * 0.6794048);
    path_4.cubicTo(
        size.width * 0.2655000,
        size.height * 0.6794048,
        size.width * 0.2644855,
        size.height * 0.6784524,
        size.width * 0.2635845,
        size.height * 0.6765476);
    path_4.cubicTo(
        size.width * 0.2626812,
        size.height * 0.6745631,
        size.width * 0.2619734,
        size.height * 0.6717857,
        size.width * 0.2614589,
        size.height * 0.6682143);
    path_4.cubicTo(
        size.width * 0.2609420,
        size.height * 0.6646429,
        size.width * 0.2606860,
        size.height * 0.6604762,
        size.width * 0.2606860,
        size.height * 0.6557143);
    path_4.lineTo(size.width * 0.2636329, size.height * 0.6557143);
    path_4.cubicTo(
        size.width * 0.2636957,
        size.height * 0.6592857,
        size.width * 0.2639783,
        size.height * 0.6622226,
        size.width * 0.2644783,
        size.height * 0.6645238);
    path_4.cubicTo(
        size.width * 0.2649928,
        size.height * 0.6668250,
        size.width * 0.2657101,
        size.height * 0.6679762,
        size.width * 0.2666280,
        size.height * 0.6679762);
    path_4.cubicTo(
        size.width * 0.2675773,
        size.height * 0.6679762,
        size.width * 0.2683188,
        size.height * 0.6668655,
        size.width * 0.2688502,
        size.height * 0.6646429);
    path_4.cubicTo(
        size.width * 0.2693816,
        size.height * 0.6623417,
        size.width * 0.2696473,
        size.height * 0.6594048,
        size.width * 0.2696473,
        size.height * 0.6558333);
    path_4.cubicTo(
        size.width * 0.2696473,
        size.height * 0.6530560,
        size.width * 0.2694783,
        size.height * 0.6507940,
        size.width * 0.2691401,
        size.height * 0.6490476);
    path_4.cubicTo(
        size.width * 0.2688164,
        size.height * 0.6473012,
        size.width * 0.2684058,
        size.height * 0.6459524,
        size.width * 0.2679082,
        size.height * 0.6450000);
    path_4.cubicTo(
        size.width * 0.2674251,
        size.height * 0.6440476,
        size.width * 0.2667488,
        size.height * 0.6430155,
        size.width * 0.2658792,
        size.height * 0.6419048);
    path_4.cubicTo(
        size.width * 0.2647826,
        size.height * 0.6404762,
        size.width * 0.2638889,
        size.height * 0.6390476,
        size.width * 0.2631981,
        size.height * 0.6376190);
    path_4.cubicTo(
        size.width * 0.2625217,
        size.height * 0.6361107,
        size.width * 0.2619420,
        size.height * 0.6338095,
        size.width * 0.2614589,
        size.height * 0.6307143);
    path_4.cubicTo(
        size.width * 0.2609758,
        size.height * 0.6276190,
        size.width * 0.2607343,
        size.height * 0.6234917,
        size.width * 0.2607343,
        size.height * 0.6183333);
    path_4.cubicTo(
        size.width * 0.2607343,
        size.height * 0.6135714,
        size.width * 0.2609758,
        size.height * 0.6094048,
        size.width * 0.2614589,
        size.height * 0.6058333);
    path_4.cubicTo(
        size.width * 0.2619420,
        size.height * 0.6022619,
        size.width * 0.2626184,
        size.height * 0.5995238,
        size.width * 0.2634879,
        size.height * 0.5976190);
    path_4.cubicTo(
        size.width * 0.2643575,
        size.height * 0.5957143,
        size.width * 0.2653623,
        size.height * 0.5947619,
        size.width * 0.2665072,
        size.height * 0.5947619);
    path_4.cubicTo(
        size.width * 0.2681329,
        size.height * 0.5947619,
        size.width * 0.2694614,
        size.height * 0.5967857,
        size.width * 0.2704928,
        size.height * 0.6008333);
    path_4.cubicTo(
        size.width * 0.2715386,
        size.height * 0.6048012,
        size.width * 0.2721184,
        size.height * 0.6102774,
        size.width * 0.2722319,
        size.height * 0.6172619);
    path_4.lineTo(size.width * 0.2691884, size.height * 0.6172619);
    path_4.cubicTo(
        size.width * 0.2691401,
        size.height * 0.6142464,
        size.width * 0.2688502,
        size.height * 0.6116667,
        size.width * 0.2683188,
        size.height * 0.6095238);
    path_4.cubicTo(
        size.width * 0.2677874,
        size.height * 0.6073810,
        size.width * 0.2670870,
        size.height * 0.6063095,
        size.width * 0.2662174,
        size.height * 0.6063095);
    path_4.cubicTo(
        size.width * 0.2654275,
        size.height * 0.6063095,
        size.width * 0.2647826,
        size.height * 0.6073012,
        size.width * 0.2642850,
        size.height * 0.6092857);
    path_4.cubicTo(
        size.width * 0.2637850,
        size.height * 0.6112702,
        size.width * 0.2635362,
        size.height * 0.6141274,
        size.width * 0.2635362,
        size.height * 0.6178571);
    path_4.cubicTo(
        size.width * 0.2635362,
        size.height * 0.6203964,
        size.width * 0.2636884,
        size.height * 0.6225000,
        size.width * 0.2639952,
        size.height * 0.6241667);
    path_4.cubicTo(
        size.width * 0.2643164,
        size.height * 0.6257536,
        size.width * 0.2647198,
        size.height * 0.6270238,
        size.width * 0.2652029,
        size.height * 0.6279762);
    path_4.cubicTo(
        size.width * 0.2656860,
        size.height * 0.6289286,
        size.width * 0.2663454,
        size.height * 0.6299607,
        size.width * 0.2671836,
        size.height * 0.6310714);
    path_4.cubicTo(
        size.width * 0.2682947,
        size.height * 0.6325798,
        size.width * 0.2691957,
        size.height * 0.6340869,
        size.width * 0.2698889,
        size.height * 0.6355952);
    path_4.cubicTo(
        size.width * 0.2705966,
        size.height * 0.6371036,
        size.width * 0.2711932,
        size.height * 0.6394440,
        size.width * 0.2716763,
        size.height * 0.6426190);
    path_4.cubicTo(
        size.width * 0.2721739,
        size.height * 0.6457143,
        size.width * 0.2724251,
        size.height * 0.6498810,
        size.width * 0.2724251,
        size.height * 0.6551190);
    path_4.cubicTo(
        size.width * 0.2724251,
        size.height * 0.6593250,
        size.width * 0.2721908,
        size.height * 0.6632940,
        size.width * 0.2717246,
        size.height * 0.6670238);
    path_4.cubicTo(
        size.width * 0.2712729,
        size.height * 0.6707536,
        size.width * 0.2706039,
        size.height * 0.6737702,
        size.width * 0.2697198,
        size.height * 0.6760714);
    path_4.cubicTo(
        size.width * 0.2688502,
        size.height * 0.6782940,
        size.width * 0.2678188,
        size.height * 0.6794048,
        size.width * 0.2666280,
        size.height * 0.6794048);
    path_4.close();
    path_4.moveTo(size.width * 0.2878720, size.height * 0.6441667);
    path_4.cubicTo(
        size.width * 0.2878720,
        size.height * 0.6466274,
        size.width * 0.2878406,
        size.height * 0.6488488,
        size.width * 0.2877754,
        size.height * 0.6508333);
    path_4.lineTo(size.width * 0.2776063, size.height * 0.6508333);
    path_4.cubicTo(
        size.width * 0.2776860,
        size.height * 0.6560714,
        size.width * 0.2780821,
        size.height * 0.6602774,
        size.width * 0.2787899,
        size.height * 0.6634524);
    path_4.cubicTo(
        size.width * 0.2794976,
        size.height * 0.6666274,
        size.width * 0.2803671,
        size.height * 0.6682143,
        size.width * 0.2813986,
        size.height * 0.6682143);
    path_4.cubicTo(
        size.width * 0.2828792,
        size.height * 0.6682143,
        size.width * 0.2839275,
        size.height * 0.6651583,
        size.width * 0.2845386,
        size.height * 0.6590476);
    path_4.lineTo(size.width * 0.2875097, size.height * 0.6590476);
    path_4.cubicTo(
        size.width * 0.2871063,
        size.height * 0.6650798,
        size.width * 0.2863744,
        size.height * 0.6700393,
        size.width * 0.2853116,
        size.height * 0.6739286);
    path_4.cubicTo(
        size.width * 0.2842657,
        size.height * 0.6777381,
        size.width * 0.2829614,
        size.height * 0.6796429,
        size.width * 0.2813986,
        size.height * 0.6796429);
    path_4.cubicTo(
        size.width * 0.2801256,
        size.height * 0.6796429,
        size.width * 0.2789831,
        size.height * 0.6782536,
        size.width * 0.2779686,
        size.height * 0.6754762);
    path_4.cubicTo(
        size.width * 0.2769710,
        size.height * 0.6726190,
        size.width * 0.2761812,
        size.height * 0.6686512,
        size.width * 0.2756014,
        size.height * 0.6635714);
    path_4.cubicTo(
        size.width * 0.2750386,
        size.height * 0.6584131,
        size.width * 0.2747560,
        size.height * 0.6524607,
        size.width * 0.2747560,
        size.height * 0.6457143);
    path_4.cubicTo(
        size.width * 0.2747560,
        size.height * 0.6389679,
        size.width * 0.2750290,
        size.height * 0.6330560,
        size.width * 0.2755773,
        size.height * 0.6279762);
    path_4.cubicTo(
        size.width * 0.2761401,
        size.height * 0.6228179,
        size.width * 0.2769227,
        size.height * 0.6188488,
        size.width * 0.2779203,
        size.height * 0.6160714);
    path_4.cubicTo(
        size.width * 0.2789348,
        size.height * 0.6132940,
        size.width * 0.2800942,
        size.height * 0.6119048,
        size.width * 0.2813986,
        size.height * 0.6119048);
    path_4.cubicTo(
        size.width * 0.2826546,
        size.height * 0.6119048,
        size.width * 0.2837729,
        size.height * 0.6132536,
        size.width * 0.2847560,
        size.height * 0.6159524);
    path_4.cubicTo(
        size.width * 0.2857391,
        size.height * 0.6186512,
        size.width * 0.2865024,
        size.height * 0.6224607,
        size.width * 0.2870507,
        size.height * 0.6273810);
    path_4.cubicTo(
        size.width * 0.2875990,
        size.height * 0.6322226,
        size.width * 0.2878720,
        size.height * 0.6378179,
        size.width * 0.2878720,
        size.height * 0.6441667);
    path_4.close();
    path_4.moveTo(size.width * 0.2849976, size.height * 0.6398810);
    path_4.cubicTo(
        size.width * 0.2849807,
        size.height * 0.6348810,
        size.width * 0.2846184,
        size.height * 0.6308726,
        size.width * 0.2839106,
        size.height * 0.6278571);
    path_4.cubicTo(
        size.width * 0.2832029,
        size.height * 0.6248417,
        size.width * 0.2823237,
        size.height * 0.6233333,
        size.width * 0.2812778,
        size.height * 0.6233333);
    path_4.cubicTo(
        size.width * 0.2803285,
        size.height * 0.6233333,
        size.width * 0.2795145,
        size.height * 0.6248417,
        size.width * 0.2788382,
        size.height * 0.6278571);
    path_4.cubicTo(
        size.width * 0.2781618,
        size.height * 0.6307940,
        size.width * 0.2777585,
        size.height * 0.6348012,
        size.width * 0.2776304,
        size.height * 0.6398810);
    path_4.lineTo(size.width * 0.2849976, size.height * 0.6398810);
    path_4.close();
    path_4.moveTo(size.width * 0.2896643, size.height * 0.6454762);
    path_4.cubicTo(
        size.width * 0.2896643,
        size.height * 0.6388893,
        size.width * 0.2899372,
        size.height * 0.6330560,
        size.width * 0.2904855,
        size.height * 0.6279762);
    path_4.cubicTo(
        size.width * 0.2910483,
        size.height * 0.6228964,
        size.width * 0.2918043,
        size.height * 0.6189679,
        size.width * 0.2927560,
        size.height * 0.6161905);
    path_4.cubicTo(
        size.width * 0.2937222,
        size.height * 0.6133333,
        size.width * 0.2947850,
        size.height * 0.6119048,
        size.width * 0.2959444,
        size.height * 0.6119048);
    path_4.cubicTo(
        size.width * 0.2969903,
        size.height * 0.6119048,
        size.width * 0.2979010,
        size.height * 0.6129369,
        size.width * 0.2986739,
        size.height * 0.6150000);
    path_4.cubicTo(
        size.width * 0.2994614,
        size.height * 0.6169845,
        size.width * 0.3000894,
        size.height * 0.6194845,
        size.width * 0.3005580,
        size.height * 0.6225000);
    path_4.lineTo(size.width * 0.3005580, size.height * 0.6129762);
    path_4.lineTo(size.width * 0.3033357, size.height * 0.6129762);
    path_4.lineTo(size.width * 0.3033357, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3005580, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3005580, size.height * 0.6688095);
    path_4.cubicTo(
        size.width * 0.3000894,
        size.height * 0.6719048,
        size.width * 0.2994541,
        size.height * 0.6744845,
        size.width * 0.2986498,
        size.height * 0.6765476);
    path_4.cubicTo(
        size.width * 0.2978430,
        size.height * 0.6786107,
        size.width * 0.2969251,
        size.height * 0.6796429,
        size.width * 0.2958961,
        size.height * 0.6796429);
    path_4.cubicTo(
        size.width * 0.2947512,
        size.height * 0.6796429,
        size.width * 0.2937053,
        size.height * 0.6782143,
        size.width * 0.2927560,
        size.height * 0.6753571);
    path_4.cubicTo(
        size.width * 0.2918043,
        size.height * 0.6724202,
        size.width * 0.2910483,
        size.height * 0.6683726,
        size.width * 0.2904855,
        size.height * 0.6632143);
    path_4.cubicTo(
        size.width * 0.2899372,
        size.height * 0.6579762,
        size.width * 0.2896643,
        size.height * 0.6520631,
        size.width * 0.2896643,
        size.height * 0.6454762);
    path_4.close();
    path_4.moveTo(size.width * 0.3005580, size.height * 0.6457143);
    path_4.cubicTo(
        size.width * 0.3005580,
        size.height * 0.6411905,
        size.width * 0.3003647,
        size.height * 0.6372619,
        size.width * 0.2999783,
        size.height * 0.6339286);
    path_4.cubicTo(
        size.width * 0.2996063,
        size.height * 0.6305952,
        size.width * 0.2991159,
        size.height * 0.6280560,
        size.width * 0.2985048,
        size.height * 0.6263095);
    path_4.cubicTo(
        size.width * 0.2978913,
        size.height * 0.6245631,
        size.width * 0.2972319,
        size.height * 0.6236905,
        size.width * 0.2965242,
        size.height * 0.6236905);
    path_4.cubicTo(
        size.width * 0.2958140,
        size.height * 0.6236905,
        size.width * 0.2951546,
        size.height * 0.6245631,
        size.width * 0.2945435,
        size.height * 0.6263095);
    path_4.cubicTo(
        size.width * 0.2939300,
        size.height * 0.6279762,
        size.width * 0.2934324,
        size.height * 0.6304762,
        size.width * 0.2930459,
        size.height * 0.6338095);
    path_4.cubicTo(
        size.width * 0.2926739,
        size.height * 0.6370631,
        size.width * 0.2924903,
        size.height * 0.6409524,
        size.width * 0.2924903,
        size.height * 0.6454762);
    path_4.cubicTo(
        size.width * 0.2924903,
        size.height * 0.6500000,
        size.width * 0.2926739,
        size.height * 0.6539679,
        size.width * 0.2930459,
        size.height * 0.6573810);
    path_4.cubicTo(
        size.width * 0.2934324,
        size.height * 0.6607940,
        size.width * 0.2939300,
        size.height * 0.6634131,
        size.width * 0.2945435,
        size.height * 0.6652381);
    path_4.cubicTo(
        size.width * 0.2951715,
        size.height * 0.6669845,
        size.width * 0.2958309,
        size.height * 0.6678571,
        size.width * 0.2965242,
        size.height * 0.6678571);
    path_4.cubicTo(
        size.width * 0.2972319,
        size.height * 0.6678571,
        size.width * 0.2978913,
        size.height * 0.6669845,
        size.width * 0.2985048,
        size.height * 0.6652381);
    path_4.cubicTo(
        size.width * 0.2991159,
        size.height * 0.6634917,
        size.width * 0.2996063,
        size.height * 0.6609524,
        size.width * 0.2999783,
        size.height * 0.6576190);
    path_4.cubicTo(
        size.width * 0.3003647,
        size.height * 0.6542060,
        size.width * 0.3005580,
        size.height * 0.6502381,
        size.width * 0.3005580,
        size.height * 0.6457143);
    path_4.close();
    path_4.moveTo(size.width * 0.3097053, size.height * 0.6225000);
    path_4.cubicTo(
        size.width * 0.3101087,
        size.height * 0.6191667,
        size.width * 0.3106401,
        size.height * 0.6165869,
        size.width * 0.3112995,
        size.height * 0.6147619);
    path_4.cubicTo(
        size.width * 0.3119758,
        size.height * 0.6128571,
        size.width * 0.3127729,
        size.height * 0.6119048,
        size.width * 0.3136908,
        size.height * 0.6119048);
    path_4.lineTo(size.width * 0.3136908, size.height * 0.6259524);
    path_4.lineTo(size.width * 0.3129903, size.height * 0.6259524);
    path_4.cubicTo(
        size.width * 0.3119106,
        size.height * 0.6259524,
        size.width * 0.3110894,
        size.height * 0.6273012,
        size.width * 0.3105266,
        size.height * 0.6300000);
    path_4.cubicTo(
        size.width * 0.3099783,
        size.height * 0.6326988,
        size.width * 0.3097053,
        size.height * 0.6373810,
        size.width * 0.3097053,
        size.height * 0.6440476);
    path_4.lineTo(size.width * 0.3097053, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3069517, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3069517, size.height * 0.6129762);
    path_4.lineTo(size.width * 0.3097053, size.height * 0.6129762);
    path_4.lineTo(size.width * 0.3097053, size.height * 0.6225000);
    path_4.close();
    path_4.moveTo(size.width * 0.3153043, size.height * 0.6457143);
    path_4.cubicTo(
        size.width * 0.3153043,
        size.height * 0.6389679,
        size.width * 0.3155773,
        size.height * 0.6330560,
        size.width * 0.3161256,
        size.height * 0.6279762);
    path_4.cubicTo(
        size.width * 0.3166884,
        size.height * 0.6228179,
        size.width * 0.3174614,
        size.height * 0.6188488,
        size.width * 0.3184444,
        size.height * 0.6160714);
    path_4.cubicTo(
        size.width * 0.3194275,
        size.height * 0.6132940,
        size.width * 0.3205531,
        size.height * 0.6119048,
        size.width * 0.3218261,
        size.height * 0.6119048);
    path_4.cubicTo(
        size.width * 0.3234372,
        size.height * 0.6119048,
        size.width * 0.3247657,
        size.height * 0.6138095,
        size.width * 0.3258116,
        size.height * 0.6176190);
    path_4.cubicTo(
        size.width * 0.3268744,
        size.height * 0.6213488,
        size.width * 0.3275918,
        size.height * 0.6267060,
        size.width * 0.3279614,
        size.height * 0.6336905);
    path_4.lineTo(size.width * 0.3249903, size.height * 0.6336905);
    path_4.cubicTo(
        size.width * 0.3247488,
        size.height * 0.6304369,
        size.width * 0.3243623,
        size.height * 0.6278964,
        size.width * 0.3238309,
        size.height * 0.6260714);
    path_4.cubicTo(
        size.width * 0.3232995,
        size.height * 0.6242464,
        size.width * 0.3226304,
        size.height * 0.6233333,
        size.width * 0.3218261,
        size.height * 0.6233333);
    path_4.cubicTo(
        size.width * 0.3206981,
        size.height * 0.6233333,
        size.width * 0.3197971,
        size.height * 0.6253179,
        size.width * 0.3191208,
        size.height * 0.6292857);
    path_4.cubicTo(
        size.width * 0.3184614,
        size.height * 0.6331750,
        size.width * 0.3181304,
        size.height * 0.6386512,
        size.width * 0.3181304,
        size.height * 0.6457143);
    path_4.cubicTo(
        size.width * 0.3181304,
        size.height * 0.6527774,
        size.width * 0.3184614,
        size.height * 0.6582940,
        size.width * 0.3191208,
        size.height * 0.6622619);
    path_4.cubicTo(
        size.width * 0.3197971,
        size.height * 0.6662298,
        size.width * 0.3206981,
        size.height * 0.6682143,
        size.width * 0.3218261,
        size.height * 0.6682143);
    path_4.cubicTo(
        size.width * 0.3234203,
        size.height * 0.6682143,
        size.width * 0.3244758,
        size.height * 0.6647619,
        size.width * 0.3249903,
        size.height * 0.6578571);
    path_4.lineTo(size.width * 0.3279614, size.height * 0.6578571);
    path_4.cubicTo(
        size.width * 0.3275749,
        size.height * 0.6645238,
        size.width * 0.3268502,
        size.height * 0.6698417,
        size.width * 0.3257874,
        size.height * 0.6738095);
    path_4.cubicTo(
        size.width * 0.3247246,
        size.height * 0.6776988,
        size.width * 0.3234034,
        size.height * 0.6796429,
        size.width * 0.3218261,
        size.height * 0.6796429);
    path_4.cubicTo(
        size.width * 0.3205531,
        size.height * 0.6796429,
        size.width * 0.3194275,
        size.height * 0.6782536,
        size.width * 0.3184444,
        size.height * 0.6754762);
    path_4.cubicTo(
        size.width * 0.3174614,
        size.height * 0.6726190,
        size.width * 0.3166884,
        size.height * 0.6686512,
        size.width * 0.3161256,
        size.height * 0.6635714);
    path_4.cubicTo(
        size.width * 0.3155773,
        size.height * 0.6584131,
        size.width * 0.3153043,
        size.height * 0.6524607,
        size.width * 0.3153043,
        size.height * 0.6457143);
    path_4.close();
    path_4.moveTo(size.width * 0.3375894, size.height * 0.6119048);
    path_4.cubicTo(
        size.width * 0.3386039,
        size.height * 0.6119048,
        size.width * 0.3395048,
        size.height * 0.6129762,
        size.width * 0.3402947,
        size.height * 0.6151190);
    path_4.cubicTo(
        size.width * 0.3410990,
        size.height * 0.6172619,
        size.width * 0.3417271,
        size.height * 0.6204369,
        size.width * 0.3421787,
        size.height * 0.6246429);
    path_4.cubicTo(
        size.width * 0.3426449,
        size.height * 0.6288488,
        size.width * 0.3428792,
        size.height * 0.6339286,
        size.width * 0.3428792,
        size.height * 0.6398810);
    path_4.lineTo(size.width * 0.3428792, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3401498, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3401498, size.height * 0.6419048);
    path_4.cubicTo(
        size.width * 0.3401498,
        size.height * 0.6360321,
        size.width * 0.3398527,
        size.height * 0.6315476,
        size.width * 0.3392560,
        size.height * 0.6284524);
    path_4.cubicTo(
        size.width * 0.3386594,
        size.height * 0.6252774,
        size.width * 0.3378478,
        size.height * 0.6236905,
        size.width * 0.3368164,
        size.height * 0.6236905);
    path_4.cubicTo(
        size.width * 0.3357850,
        size.height * 0.6236905,
        size.width * 0.3349638,
        size.height * 0.6252774,
        size.width * 0.3343527,
        size.height * 0.6284524);
    path_4.cubicTo(
        size.width * 0.3337560,
        size.height * 0.6315476,
        size.width * 0.3334589,
        size.height * 0.6360321,
        size.width * 0.3334589,
        size.height * 0.6419048);
    path_4.lineTo(size.width * 0.3334589, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3307053, size.height * 0.6785714);
    path_4.lineTo(size.width * 0.3307053, size.height * 0.5904762);
    path_4.lineTo(size.width * 0.3334589, size.height * 0.5904762);
    path_4.lineTo(size.width * 0.3334589, size.height * 0.6205952);
    path_4.cubicTo(
        size.width * 0.3339251,
        size.height * 0.6178179,
        size.width * 0.3345145,
        size.height * 0.6156750,
        size.width * 0.3352222,
        size.height * 0.6141667);
    path_4.cubicTo(
        size.width * 0.3359469,
        size.height * 0.6126583,
        size.width * 0.3367367,
        size.height * 0.6119048,
        size.width * 0.3375894,
        size.height * 0.6119048);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.5108696, size.height * 0.3199405);
    path_5.lineTo(size.width * 0.5027174, size.height * 0.3199405);
    path_5.lineTo(size.width * 0.5027174, size.height * 0.2797619);
    path_5.cubicTo(
        size.width * 0.5025652,
        size.height * 0.2715774,
        size.width * 0.5016981,
        size.height * 0.2671131,
        size.width * 0.5001135,
        size.height * 0.2663690);
    path_5.cubicTo(
        size.width * 0.4993575,
        size.height * 0.2663690,
        size.width * 0.4987174,
        size.height * 0.2676714,
        size.width * 0.4981884,
        size.height * 0.2702750);
    path_5.cubicTo(
        size.width * 0.4975845,
        size.height * 0.2728798,
        size.width * 0.4972826,
        size.height * 0.2760417,
        size.width * 0.4972826,
        size.height * 0.2797619);
    path_5.lineTo(size.width * 0.4972826, size.height * 0.3199405);
    path_5.lineTo(size.width * 0.4891304, size.height * 0.3199405);
    path_5.cubicTo(
        size.width * 0.4874686,
        size.height * 0.3206845,
        size.width * 0.4865652,
        size.height * 0.3251488,
        size.width * 0.4864130,
        size.height * 0.3333333);
    path_5.cubicTo(
        size.width * 0.4865652,
        size.height * 0.3415179,
        size.width * 0.4874686,
        size.height * 0.3459821,
        size.width * 0.4891304,
        size.height * 0.3467262);
    path_5.lineTo(size.width * 0.4972826, size.height * 0.3467262);
    path_5.lineTo(size.width * 0.4972826, size.height * 0.3869048);
    path_5.cubicTo(
        size.width * 0.4974348,
        size.height * 0.3950893,
        size.width * 0.4983382,
        size.height * 0.3995536,
        size.width * 0.5000000,
        size.height * 0.4002976);
    path_5.cubicTo(
        size.width * 0.5016618,
        size.height * 0.3995536,
        size.width * 0.5025652,
        size.height * 0.3950893,
        size.width * 0.5027174,
        size.height * 0.3869048);
    path_5.lineTo(size.width * 0.5027174, size.height * 0.3467262);
    path_5.lineTo(size.width * 0.5108696, size.height * 0.3467262);
    path_5.cubicTo(
        size.width * 0.5125314,
        size.height * 0.3459821,
        size.width * 0.5134348,
        size.height * 0.3415179,
        size.width * 0.5135870,
        size.height * 0.3333333);
    path_5.cubicTo(
        size.width * 0.5134348,
        size.height * 0.3251488,
        size.width * 0.5125314,
        size.height * 0.3206845,
        size.width * 0.5108696,
        size.height * 0.3199405);
    path_5.close();
    path_5.moveTo(size.width * 0.5000000, size.height * 0.1904762);
    path_5.cubicTo(
        size.width * 0.4945652,
        size.height * 0.1908476,
        size.width * 0.4896957,
        size.height * 0.1973583,
        size.width * 0.4853937,
        size.height * 0.2100071);
    path_5.cubicTo(
        size.width * 0.4810169,
        size.height * 0.2226560,
        size.width * 0.4775435,
        size.height * 0.2397690,
        size.width * 0.4749783,
        size.height * 0.2613464);
    path_5.cubicTo(
        size.width * 0.4724106,
        size.height * 0.2825524,
        size.width * 0.4710894,
        size.height * 0.3065476,
        size.width * 0.4710145,
        size.height * 0.3333333);
    path_5.cubicTo(
        size.width * 0.4710894,
        size.height * 0.3601190,
        size.width * 0.4724106,
        size.height * 0.3841143,
        size.width * 0.4749783,
        size.height * 0.4053202);
    path_5.cubicTo(
        size.width * 0.4775435,
        size.height * 0.4268976,
        size.width * 0.4810169,
        size.height * 0.4440107,
        size.width * 0.4853937,
        size.height * 0.4566595);
    path_5.cubicTo(
        size.width * 0.4896957,
        size.height * 0.4693083,
        size.width * 0.4945652,
        size.height * 0.4758190,
        size.width * 0.5000000,
        size.height * 0.4761905);
    path_5.cubicTo(
        size.width * 0.5054348,
        size.height * 0.4758190,
        size.width * 0.5103043,
        size.height * 0.4693083,
        size.width * 0.5146063,
        size.height * 0.4566595);
    path_5.cubicTo(
        size.width * 0.5189831,
        size.height * 0.4440107,
        size.width * 0.5224565,
        size.height * 0.4268976,
        size.width * 0.5250217,
        size.height * 0.4053202);
    path_5.cubicTo(
        size.width * 0.5275894,
        size.height * 0.3841143,
        size.width * 0.5289106,
        size.height * 0.3601190,
        size.width * 0.5289855,
        size.height * 0.3333333);
    path_5.cubicTo(
        size.width * 0.5289106,
        size.height * 0.3065476,
        size.width * 0.5275894,
        size.height * 0.2825524,
        size.width * 0.5250217,
        size.height * 0.2613464);
    path_5.cubicTo(
        size.width * 0.5224565,
        size.height * 0.2397690,
        size.width * 0.5189831,
        size.height * 0.2226560,
        size.width * 0.5146063,
        size.height * 0.2100071);
    path_5.cubicTo(
        size.width * 0.5103043,
        size.height * 0.1973583,
        size.width * 0.5054348,
        size.height * 0.1908476,
        size.width * 0.5000000,
        size.height * 0.1904762);
    path_5.close();
    path_5.moveTo(size.width * 0.5000000, size.height * 0.4494048);
    path_5.cubicTo(
        size.width * 0.4933575,
        size.height * 0.4486607,
        size.width * 0.4878092,
        size.height * 0.4373143,
        size.width * 0.4833551,
        size.height * 0.4153643);
    path_5.cubicTo(
        size.width * 0.4789034,
        size.height * 0.3934155,
        size.width * 0.4765990,
        size.height * 0.3660714,
        size.width * 0.4764493,
        size.height * 0.3333333);
    path_5.cubicTo(
        size.width * 0.4765990,
        size.height * 0.3005952,
        size.width * 0.4789034,
        size.height * 0.2732512,
        size.width * 0.4833551,
        size.height * 0.2513024);
    path_5.cubicTo(
        size.width * 0.4878092,
        size.height * 0.2293524,
        size.width * 0.4933575,
        size.height * 0.2180060,
        size.width * 0.5000000,
        size.height * 0.2172619);
    path_5.cubicTo(
        size.width * 0.5066425,
        size.height * 0.2180060,
        size.width * 0.5121908,
        size.height * 0.2293524,
        size.width * 0.5166449,
        size.height * 0.2513024);
    path_5.cubicTo(
        size.width * 0.5210966,
        size.height * 0.2732512,
        size.width * 0.5234010,
        size.height * 0.3005952,
        size.width * 0.5235507,
        size.height * 0.3333333);
    path_5.cubicTo(
        size.width * 0.5234010,
        size.height * 0.3660714,
        size.width * 0.5210966,
        size.height * 0.3934155,
        size.width * 0.5166449,
        size.height * 0.4153643);
    path_5.cubicTo(
        size.width * 0.5121908,
        size.height * 0.4373143,
        size.width * 0.5066425,
        size.height * 0.4486607,
        size.width * 0.5000000,
        size.height * 0.4494048);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(size.width * 0.4871401, size.height * 0.6616667);
    path_6.lineTo(size.width * 0.4801111, size.height * 0.6616667);
    path_6.lineTo(size.width * 0.4789034, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.4760290, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.4820435, size.height * 0.5957143);
    path_6.lineTo(size.width * 0.4852319, size.height * 0.5957143);
    path_6.lineTo(size.width * 0.4912464, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.4883478, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.4871401, size.height * 0.6616667);
    path_6.close();
    path_6.moveTo(size.width * 0.4863671, size.height * 0.6505952);
    path_6.lineTo(size.width * 0.4836377, size.height * 0.6121429);
    path_6.lineTo(size.width * 0.4808841, size.height * 0.6505952);
    path_6.lineTo(size.width * 0.4863671, size.height * 0.6505952);
    path_6.close();
    path_6.moveTo(size.width * 0.4929444, size.height * 0.6454762);
    path_6.cubicTo(
        size.width * 0.4929444,
        size.height * 0.6388893,
        size.width * 0.4932174,
        size.height * 0.6330560,
        size.width * 0.4937657,
        size.height * 0.6279762);
    path_6.cubicTo(
        size.width * 0.4943285,
        size.height * 0.6228964,
        size.width * 0.4950870,
        size.height * 0.6189679,
        size.width * 0.4960362,
        size.height * 0.6161905);
    path_6.cubicTo(
        size.width * 0.4970024,
        size.height * 0.6133333,
        size.width * 0.4980725,
        size.height * 0.6119048,
        size.width * 0.4992488,
        size.height * 0.6119048);
    path_6.cubicTo(
        size.width * 0.5001184,
        size.height * 0.6119048,
        size.width * 0.5009710,
        size.height * 0.6128571,
        size.width * 0.5018092,
        size.height * 0.6147619);
    path_6.cubicTo(
        size.width * 0.5026618,
        size.height * 0.6165869,
        size.width * 0.5033382,
        size.height * 0.6190476,
        size.width * 0.5038382,
        size.height * 0.6221429);
    path_6.lineTo(size.width * 0.5038382, size.height * 0.5904762);
    path_6.lineTo(size.width * 0.5066159, size.height * 0.5904762);
    path_6.lineTo(size.width * 0.5066159, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.5038382, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.5038382, size.height * 0.6686905);
    path_6.cubicTo(
        size.width * 0.5033865,
        size.height * 0.6718655,
        size.width * 0.5027585,
        size.height * 0.6744845,
        size.width * 0.5019541,
        size.height * 0.6765476);
    path_6.cubicTo(
        size.width * 0.5011643,
        size.height * 0.6786107,
        size.width * 0.5002560,
        size.height * 0.6796429,
        size.width * 0.4992246,
        size.height * 0.6796429);
    path_6.cubicTo(
        size.width * 0.4980652,
        size.height * 0.6796429,
        size.width * 0.4970024,
        size.height * 0.6782143,
        size.width * 0.4960362,
        size.height * 0.6753571);
    path_6.cubicTo(
        size.width * 0.4950870,
        size.height * 0.6724202,
        size.width * 0.4943285,
        size.height * 0.6683726,
        size.width * 0.4937657,
        size.height * 0.6632143);
    path_6.cubicTo(
        size.width * 0.4932174,
        size.height * 0.6579762,
        size.width * 0.4929444,
        size.height * 0.6520631,
        size.width * 0.4929444,
        size.height * 0.6454762);
    path_6.close();
    path_6.moveTo(size.width * 0.5038382, size.height * 0.6457143);
    path_6.cubicTo(
        size.width * 0.5038382,
        size.height * 0.6411905,
        size.width * 0.5036449,
        size.height * 0.6372619,
        size.width * 0.5032585,
        size.height * 0.6339286);
    path_6.cubicTo(
        size.width * 0.5028889,
        size.height * 0.6305952,
        size.width * 0.5023961,
        size.height * 0.6280560,
        size.width * 0.5017850,
        size.height * 0.6263095);
    path_6.cubicTo(
        size.width * 0.5011739,
        size.height * 0.6245631,
        size.width * 0.5005121,
        size.height * 0.6236905,
        size.width * 0.4998043,
        size.height * 0.6236905);
    path_6.cubicTo(
        size.width * 0.4990966,
        size.height * 0.6236905,
        size.width * 0.4984348,
        size.height * 0.6245631,
        size.width * 0.4978237,
        size.height * 0.6263095);
    path_6.cubicTo(
        size.width * 0.4972126,
        size.height * 0.6279762,
        size.width * 0.4967126,
        size.height * 0.6304762,
        size.width * 0.4963261,
        size.height * 0.6338095);
    path_6.cubicTo(
        size.width * 0.4959565,
        size.height * 0.6370631,
        size.width * 0.4957705,
        size.height * 0.6409524,
        size.width * 0.4957705,
        size.height * 0.6454762);
    path_6.cubicTo(
        size.width * 0.4957705,
        size.height * 0.6500000,
        size.width * 0.4959565,
        size.height * 0.6539679,
        size.width * 0.4963261,
        size.height * 0.6573810);
    path_6.cubicTo(
        size.width * 0.4967126,
        size.height * 0.6607940,
        size.width * 0.4972126,
        size.height * 0.6634131,
        size.width * 0.4978237,
        size.height * 0.6652381);
    path_6.cubicTo(
        size.width * 0.4984517,
        size.height * 0.6669845,
        size.width * 0.4991111,
        size.height * 0.6678571,
        size.width * 0.4998043,
        size.height * 0.6678571);
    path_6.cubicTo(
        size.width * 0.5005121,
        size.height * 0.6678571,
        size.width * 0.5011739,
        size.height * 0.6669845,
        size.width * 0.5017850,
        size.height * 0.6652381);
    path_6.cubicTo(
        size.width * 0.5023961,
        size.height * 0.6634917,
        size.width * 0.5028889,
        size.height * 0.6609524,
        size.width * 0.5032585,
        size.height * 0.6576190);
    path_6.cubicTo(
        size.width * 0.5036449,
        size.height * 0.6542060,
        size.width * 0.5038382,
        size.height * 0.6502381,
        size.width * 0.5038382,
        size.height * 0.6457143);
    path_6.close();
    path_6.moveTo(size.width * 0.5093140, size.height * 0.6454762);
    path_6.cubicTo(
        size.width * 0.5093140,
        size.height * 0.6388893,
        size.width * 0.5095894,
        size.height * 0.6330560,
        size.width * 0.5101353,
        size.height * 0.6279762);
    path_6.cubicTo(
        size.width * 0.5107005,
        size.height * 0.6228964,
        size.width * 0.5114565,
        size.height * 0.6189679,
        size.width * 0.5124058,
        size.height * 0.6161905);
    path_6.cubicTo(
        size.width * 0.5133720,
        size.height * 0.6133333,
        size.width * 0.5144444,
        size.height * 0.6119048,
        size.width * 0.5156184,
        size.height * 0.6119048);
    path_6.cubicTo(
        size.width * 0.5164879,
        size.height * 0.6119048,
        size.width * 0.5173430,
        size.height * 0.6128571,
        size.width * 0.5181787,
        size.height * 0.6147619);
    path_6.cubicTo(
        size.width * 0.5190338,
        size.height * 0.6165869,
        size.width * 0.5197101,
        size.height * 0.6190476,
        size.width * 0.5202077,
        size.height * 0.6221429);
    path_6.lineTo(size.width * 0.5202077, size.height * 0.5904762);
    path_6.lineTo(size.width * 0.5229855, size.height * 0.5904762);
    path_6.lineTo(size.width * 0.5229855, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.5202077, size.height * 0.6785714);
    path_6.lineTo(size.width * 0.5202077, size.height * 0.6686905);
    path_6.cubicTo(
        size.width * 0.5197585,
        size.height * 0.6718655,
        size.width * 0.5191304,
        size.height * 0.6744845,
        size.width * 0.5183237,
        size.height * 0.6765476);
    path_6.cubicTo(
        size.width * 0.5175362,
        size.height * 0.6786107,
        size.width * 0.5166256,
        size.height * 0.6796429,
        size.width * 0.5155942,
        size.height * 0.6796429);
    path_6.cubicTo(
        size.width * 0.5144348,
        size.height * 0.6796429,
        size.width * 0.5133720,
        size.height * 0.6782143,
        size.width * 0.5124058,
        size.height * 0.6753571);
    path_6.cubicTo(
        size.width * 0.5114565,
        size.height * 0.6724202,
        size.width * 0.5107005,
        size.height * 0.6683726,
        size.width * 0.5101353,
        size.height * 0.6632143);
    path_6.cubicTo(
        size.width * 0.5095894,
        size.height * 0.6579762,
        size.width * 0.5093140,
        size.height * 0.6520631,
        size.width * 0.5093140,
        size.height * 0.6454762);
    path_6.close();
    path_6.moveTo(size.width * 0.5202077, size.height * 0.6457143);
    path_6.cubicTo(
        size.width * 0.5202077,
        size.height * 0.6411905,
        size.width * 0.5200145,
        size.height * 0.6372619,
        size.width * 0.5196280,
        size.height * 0.6339286);
    path_6.cubicTo(
        size.width * 0.5192585,
        size.height * 0.6305952,
        size.width * 0.5187681,
        size.height * 0.6280560,
        size.width * 0.5181546,
        size.height * 0.6263095);
    path_6.cubicTo(
        size.width * 0.5175435,
        size.height * 0.6245631,
        size.width * 0.5168841,
        size.height * 0.6236905,
        size.width * 0.5161739,
        size.height * 0.6236905);
    path_6.cubicTo(
        size.width * 0.5154662,
        size.height * 0.6236905,
        size.width * 0.5148068,
        size.height * 0.6245631,
        size.width * 0.5141932,
        size.height * 0.6263095);
    path_6.cubicTo(
        size.width * 0.5135821,
        size.height * 0.6279762,
        size.width * 0.5130821,
        size.height * 0.6304762,
        size.width * 0.5126957,
        size.height * 0.6338095);
    path_6.cubicTo(
        size.width * 0.5123261,
        size.height * 0.6370631,
        size.width * 0.5121401,
        size.height * 0.6409524,
        size.width * 0.5121401,
        size.height * 0.6454762);
    path_6.cubicTo(
        size.width * 0.5121401,
        size.height * 0.6500000,
        size.width * 0.5123261,
        size.height * 0.6539679,
        size.width * 0.5126957,
        size.height * 0.6573810);
    path_6.cubicTo(
        size.width * 0.5130821,
        size.height * 0.6607940,
        size.width * 0.5135821,
        size.height * 0.6634131,
        size.width * 0.5141932,
        size.height * 0.6652381);
    path_6.cubicTo(
        size.width * 0.5148213,
        size.height * 0.6669845,
        size.width * 0.5154831,
        size.height * 0.6678571,
        size.width * 0.5161739,
        size.height * 0.6678571);
    path_6.cubicTo(
        size.width * 0.5168841,
        size.height * 0.6678571,
        size.width * 0.5175435,
        size.height * 0.6669845,
        size.width * 0.5181546,
        size.height * 0.6652381);
    path_6.cubicTo(
        size.width * 0.5187681,
        size.height * 0.6634917,
        size.width * 0.5192585,
        size.height * 0.6609524,
        size.width * 0.5196280,
        size.height * 0.6576190);
    path_6.cubicTo(
        size.width * 0.5200145,
        size.height * 0.6542060,
        size.width * 0.5202077,
        size.height * 0.6502381,
        size.width * 0.5202077,
        size.height * 0.6457143);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.6798382, size.height * 0.1904762);
    path_7.cubicTo(
        size.width * 0.6815749,
        size.height * 0.1912202,
        size.width * 0.6824807,
        size.height * 0.1956845,
        size.width * 0.6825556,
        size.height * 0.2038690);
    path_7.lineTo(size.width * 0.6825556, size.height * 0.2261905);
    path_7.lineTo(size.width * 0.6989734, size.height * 0.2261905);
    path_7.lineTo(size.width * 0.6989734, size.height * 0.2038690);
    path_7.cubicTo(
        size.width * 0.6991256,
        size.height * 0.1956845,
        size.width * 0.7000290,
        size.height * 0.1912202,
        size.width * 0.7016908,
        size.height * 0.1904762);
    path_7.cubicTo(
        size.width * 0.7033527,
        size.height * 0.1912202,
        size.width * 0.7042560,
        size.height * 0.1956845,
        size.width * 0.7044082,
        size.height * 0.2038690);
    path_7.lineTo(size.width * 0.7044082, size.height * 0.2261905);
    path_7.lineTo(size.width * 0.7089372, size.height * 0.2261905);
    path_7.cubicTo(
        size.width * 0.7109758,
        size.height * 0.2265619,
        size.width * 0.7126739,
        size.height * 0.2300964,
        size.width * 0.7140314,
        size.height * 0.2367929);
    path_7.cubicTo(
        size.width * 0.7153913,
        size.height * 0.2434893,
        size.width * 0.7161087,
        size.height * 0.2518595,
        size.width * 0.7161836,
        size.height * 0.2619048);
    path_7.lineTo(size.width * 0.7161836, size.height * 0.2976190);
    path_7.lineTo(size.width * 0.6707802, size.height * 0.2976190);
    path_7.lineTo(size.width * 0.6707802, size.height * 0.4404762);
    path_7.cubicTo(
        size.width * 0.6709324,
        size.height * 0.4460571,
        size.width * 0.6715362,
        size.height * 0.4490333,
        size.width * 0.6725918,
        size.height * 0.4494048);
    path_7.lineTo(size.width * 0.6977271, size.height * 0.4494048);
    path_7.cubicTo(
        size.width * 0.6990870,
        size.height * 0.4598214,
        size.width * 0.7008237,
        size.height * 0.4687500,
        size.width * 0.7029372,
        size.height * 0.4761905);
    path_7.lineTo(size.width * 0.6727053, size.height * 0.4761905);
    path_7.cubicTo(
        size.width * 0.6706667,
        size.height * 0.4758190,
        size.width * 0.6689686,
        size.height * 0.4722845,
        size.width * 0.6676111,
        size.height * 0.4655881);
    path_7.cubicTo(
        size.width * 0.6662512,
        size.height * 0.4588917,
        size.width * 0.6655338,
        size.height * 0.4505214,
        size.width * 0.6654589,
        size.height * 0.4404762);
    path_7.lineTo(size.width * 0.6654589, size.height * 0.2619048);
    path_7.cubicTo(
        size.width * 0.6655338,
        size.height * 0.2518595,
        size.width * 0.6662512,
        size.height * 0.2434893,
        size.width * 0.6676111,
        size.height * 0.2367929);
    path_7.cubicTo(
        size.width * 0.6689686,
        size.height * 0.2300964,
        size.width * 0.6706667,
        size.height * 0.2265619,
        size.width * 0.6727053,
        size.height * 0.2261905);
    path_7.lineTo(size.width * 0.6772343, size.height * 0.2261905);
    path_7.lineTo(size.width * 0.6772343, size.height * 0.2038690);
    path_7.cubicTo(
        size.width * 0.6773865,
        size.height * 0.1956845,
        size.width * 0.6782899,
        size.height * 0.1912202,
        size.width * 0.6799517,
        size.height * 0.1904762);
    path_7.lineTo(size.width * 0.6798382, size.height * 0.1904762);
    path_7.close();
    path_7.moveTo(size.width * 0.7306763, size.height * 0.3958333);
    path_7.cubicTo(
        size.width * 0.7305266,
        size.height * 0.4185262,
        size.width * 0.7289396,
        size.height * 0.4375000,
        size.width * 0.7259203,
        size.height * 0.4527524);
    path_7.cubicTo(
        size.width * 0.7228261,
        size.height * 0.4676333,
        size.width * 0.7189758,
        size.height * 0.4754464,
        size.width * 0.7143720,
        size.height * 0.4761905);
    path_7.cubicTo(
        size.width * 0.7097681,
        size.height * 0.4754464,
        size.width * 0.7059179,
        size.height * 0.4676333,
        size.width * 0.7028237,
        size.height * 0.4527524);
    path_7.cubicTo(
        size.width * 0.6997295,
        size.height * 0.4375000,
        size.width * 0.6981063,
        size.height * 0.4185262,
        size.width * 0.6979541,
        size.height * 0.3958333);
    path_7.cubicTo(
        size.width * 0.6981063,
        size.height * 0.3731405,
        size.width * 0.6997295,
        size.height * 0.3541667,
        size.width * 0.7028237,
        size.height * 0.3389143);
    path_7.cubicTo(
        size.width * 0.7059179,
        size.height * 0.3240333,
        size.width * 0.7097681,
        size.height * 0.3162202,
        size.width * 0.7143720,
        size.height * 0.3154762);
    path_7.cubicTo(
        size.width * 0.7189758,
        size.height * 0.3162202,
        size.width * 0.7228261,
        size.height * 0.3240333,
        size.width * 0.7259203,
        size.height * 0.3389143);
    path_7.cubicTo(
        size.width * 0.7289396,
        size.height * 0.3541667,
        size.width * 0.7305266,
        size.height * 0.3731405,
        size.width * 0.7306763,
        size.height * 0.3958333);
    path_7.close();
    path_7.moveTo(size.width * 0.7124469, size.height * 0.3601190);
    path_7.lineTo(size.width * 0.7124469, size.height * 0.3958333);
    path_7.cubicTo(
        size.width * 0.7125990,
        size.height * 0.4014143,
        size.width * 0.7132029,
        size.height * 0.4043905,
        size.width * 0.7142585,
        size.height * 0.4047619);
    path_7.lineTo(size.width * 0.7198068, size.height * 0.4047619);
    path_7.cubicTo(
        size.width * 0.7209396,
        size.height * 0.4043905,
        size.width * 0.7215435,
        size.height * 0.4014143,
        size.width * 0.7216184,
        size.height * 0.3958333);
    path_7.cubicTo(
        size.width * 0.7215435,
        size.height * 0.3902524,
        size.width * 0.7209396,
        size.height * 0.3872762,
        size.width * 0.7198068,
        size.height * 0.3869048);
    path_7.lineTo(size.width * 0.7160700, size.height * 0.3869048);
    path_7.lineTo(size.width * 0.7160700, size.height * 0.3601190);
    path_7.cubicTo(
        size.width * 0.7159952,
        size.height * 0.3545381,
        size.width * 0.7153913,
        size.height * 0.3515619,
        size.width * 0.7142585,
        size.height * 0.3511905);
    path_7.cubicTo(
        size.width * 0.7132029,
        size.height * 0.3515619,
        size.width * 0.7125990,
        size.height * 0.3545381,
        size.width * 0.7124469,
        size.height * 0.3601190);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.6535024, size.height * 0.6360714);
    path_8.cubicTo(
        size.width * 0.6544034,
        size.height * 0.6368655,
        size.width * 0.6551691,
        size.height * 0.6392060,
        size.width * 0.6557971,
        size.height * 0.6430952);
    path_8.cubicTo(
        size.width * 0.6564251,
        size.height * 0.6469845,
        size.width * 0.6567391,
        size.height * 0.6513893,
        size.width * 0.6567391,
        size.height * 0.6563095);
    path_8.cubicTo(
        size.width * 0.6567391,
        size.height * 0.6605155,
        size.width * 0.6565145,
        size.height * 0.6643250,
        size.width * 0.6560628,
        size.height * 0.6677381);
    path_8.cubicTo(
        size.width * 0.6556280,
        size.height * 0.6710714,
        size.width * 0.6549928,
        size.height * 0.6737298,
        size.width * 0.6541546,
        size.height * 0.6757143);
    path_8.cubicTo(
        size.width * 0.6533164,
        size.height * 0.6776190,
        size.width * 0.6523430,
        size.height * 0.6785714,
        size.width * 0.6512319,
        size.height * 0.6785714);
    path_8.lineTo(size.width * 0.6445169, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.6445169, size.height * 0.5958333);
    path_8.lineTo(size.width * 0.6509179, size.height * 0.5958333);
    path_8.cubicTo(
        size.width * 0.6520604,
        size.height * 0.5958333,
        size.width * 0.6530435,
        size.height * 0.5967857,
        size.width * 0.6538647,
        size.height * 0.5986905);
    path_8.cubicTo(
        size.width * 0.6546860,
        size.height * 0.6005952,
        size.width * 0.6553068,
        size.height * 0.6031750,
        size.width * 0.6557246,
        size.height * 0.6064286);
    path_8.cubicTo(
        size.width * 0.6561425,
        size.height * 0.6096036,
        size.width * 0.6563527,
        size.height * 0.6131750,
        size.width * 0.6563527,
        size.height * 0.6171429);
    path_8.cubicTo(
        size.width * 0.6563527,
        size.height * 0.6219048,
        size.width * 0.6560942,
        size.height * 0.6258726,
        size.width * 0.6555797,
        size.height * 0.6290476);
    path_8.cubicTo(
        size.width * 0.6550652,
        size.height * 0.6322226,
        size.width * 0.6543720,
        size.height * 0.6345631,
        size.width * 0.6535024,
        size.height * 0.6360714);
    path_8.close();
    path_8.moveTo(size.width * 0.6472705, size.height * 0.6305952);
    path_8.lineTo(size.width * 0.6506763, size.height * 0.6305952);
    path_8.cubicTo(
        size.width * 0.6515773,
        size.height * 0.6305952,
        size.width * 0.6522778,
        size.height * 0.6296036,
        size.width * 0.6527778,
        size.height * 0.6276190);
    path_8.cubicTo(
        size.width * 0.6532923,
        size.height * 0.6255560,
        size.width * 0.6535507,
        size.height * 0.6226190,
        size.width * 0.6535507,
        size.height * 0.6188095);
    path_8.cubicTo(
        size.width * 0.6535507,
        size.height * 0.6150798,
        size.width * 0.6532923,
        size.height * 0.6121821,
        size.width * 0.6527778,
        size.height * 0.6101190);
    path_8.cubicTo(
        size.width * 0.6522778,
        size.height * 0.6079762,
        size.width * 0.6515773,
        size.height * 0.6069048,
        size.width * 0.6506763,
        size.height * 0.6069048);
    path_8.lineTo(size.width * 0.6472705, size.height * 0.6069048);
    path_8.lineTo(size.width * 0.6472705, size.height * 0.6305952);
    path_8.close();
    path_8.moveTo(size.width * 0.6509903, size.height * 0.6675000);
    path_8.cubicTo(
        size.width * 0.6519251,
        size.height * 0.6675000,
        size.width * 0.6526570,
        size.height * 0.6663893,
        size.width * 0.6531884,
        size.height * 0.6641667);
    path_8.cubicTo(
        size.width * 0.6537198,
        size.height * 0.6619440,
        size.width * 0.6539855,
        size.height * 0.6588488,
        size.width * 0.6539855,
        size.height * 0.6548810);
    path_8.cubicTo(
        size.width * 0.6539855,
        size.height * 0.6508333,
        size.width * 0.6537029,
        size.height * 0.6476190,
        size.width * 0.6531401,
        size.height * 0.6452381);
    path_8.cubicTo(
        size.width * 0.6525773,
        size.height * 0.6428571,
        size.width * 0.6518285,
        size.height * 0.6416667,
        size.width * 0.6508937,
        size.height * 0.6416667);
    path_8.lineTo(size.width * 0.6472705, size.height * 0.6416667);
    path_8.lineTo(size.width * 0.6472705, size.height * 0.6675000);
    path_8.lineTo(size.width * 0.6509903, size.height * 0.6675000);
    path_8.close();
    path_8.moveTo(size.width * 0.6655048, size.height * 0.6796429);
    path_8.cubicTo(
        size.width * 0.6642488,
        size.height * 0.6796429,
        size.width * 0.6631135,
        size.height * 0.6782536,
        size.width * 0.6620990,
        size.height * 0.6754762);
    path_8.cubicTo(
        size.width * 0.6610845,
        size.height * 0.6726190,
        size.width * 0.6602874,
        size.height * 0.6686512,
        size.width * 0.6597077,
        size.height * 0.6635714);
    path_8.cubicTo(
        size.width * 0.6591280,
        size.height * 0.6584131,
        size.width * 0.6588382,
        size.height * 0.6524607,
        size.width * 0.6588382,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6588382,
        size.height * 0.6390476,
        size.width * 0.6591353,
        size.height * 0.6331345,
        size.width * 0.6597319,
        size.height * 0.6279762);
    path_8.cubicTo(
        size.width * 0.6603285,
        size.height * 0.6228179,
        size.width * 0.6611401,
        size.height * 0.6188488,
        size.width * 0.6621715,
        size.height * 0.6160714);
    path_8.cubicTo(
        size.width * 0.6632029,
        size.height * 0.6132940,
        size.width * 0.6643527,
        size.height * 0.6119048,
        size.width * 0.6656256,
        size.height * 0.6119048);
    path_8.cubicTo(
        size.width * 0.6668986,
        size.height * 0.6119048,
        size.width * 0.6680483,
        size.height * 0.6132940,
        size.width * 0.6690797,
        size.height * 0.6160714);
    path_8.cubicTo(
        size.width * 0.6701111,
        size.height * 0.6188488,
        size.width * 0.6709227,
        size.height * 0.6228179,
        size.width * 0.6715193,
        size.height * 0.6279762);
    path_8.cubicTo(
        size.width * 0.6721159,
        size.height * 0.6331345,
        size.width * 0.6724130,
        size.height * 0.6390476,
        size.width * 0.6724130,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6724130,
        size.height * 0.6523810,
        size.width * 0.6721063,
        size.height * 0.6582940,
        size.width * 0.6714952,
        size.height * 0.6634524);
    path_8.cubicTo(
        size.width * 0.6708841,
        size.height * 0.6686107,
        size.width * 0.6700459,
        size.height * 0.6726190,
        size.width * 0.6689831,
        size.height * 0.6754762);
    path_8.cubicTo(
        size.width * 0.6679372,
        size.height * 0.6782536,
        size.width * 0.6667778,
        size.height * 0.6796429,
        size.width * 0.6655048,
        size.height * 0.6796429);
    path_8.close();
    path_8.moveTo(size.width * 0.6655048, size.height * 0.6678571);
    path_8.cubicTo(
        size.width * 0.6662126,
        size.height * 0.6678571,
        size.width * 0.6668744,
        size.height * 0.6670238,
        size.width * 0.6674855,
        size.height * 0.6653571);
    path_8.cubicTo(
        size.width * 0.6681135,
        size.height * 0.6636905,
        size.width * 0.6686208,
        size.height * 0.6611905,
        size.width * 0.6690072,
        size.height * 0.6578571);
    path_8.cubicTo(
        size.width * 0.6693937,
        size.height * 0.6545238,
        size.width * 0.6695870,
        size.height * 0.6504762,
        size.width * 0.6695870,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6695870,
        size.height * 0.6409524,
        size.width * 0.6694010,
        size.height * 0.6369440,
        size.width * 0.6690314,
        size.height * 0.6336905);
    path_8.cubicTo(
        size.width * 0.6686618,
        size.height * 0.6303571,
        size.width * 0.6681691,
        size.height * 0.6278571,
        size.width * 0.6675580,
        size.height * 0.6261905);
    path_8.cubicTo(
        size.width * 0.6669469,
        size.height * 0.6245238,
        size.width * 0.6662850,
        size.height * 0.6236905,
        size.width * 0.6655773,
        size.height * 0.6236905);
    path_8.cubicTo(
        size.width * 0.6648696,
        size.height * 0.6236905,
        size.width * 0.6642077,
        size.height * 0.6245238,
        size.width * 0.6635966,
        size.height * 0.6261905);
    path_8.cubicTo(
        size.width * 0.6630000,
        size.height * 0.6278571,
        size.width * 0.6625266,
        size.height * 0.6303571,
        size.width * 0.6621715,
        size.height * 0.6336905);
    path_8.cubicTo(
        size.width * 0.6618164,
        size.height * 0.6369440,
        size.width * 0.6616401,
        size.height * 0.6409524,
        size.width * 0.6616401,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6616401,
        size.height * 0.6527774,
        size.width * 0.6620024,
        size.height * 0.6582536,
        size.width * 0.6627271,
        size.height * 0.6621429);
    path_8.cubicTo(
        size.width * 0.6634686,
        size.height * 0.6659524,
        size.width * 0.6643937,
        size.height * 0.6678571,
        size.width * 0.6655048,
        size.height * 0.6678571);
    path_8.close();
    path_8.moveTo(size.width * 0.6809082, size.height * 0.6796429);
    path_8.cubicTo(
        size.width * 0.6796522,
        size.height * 0.6796429,
        size.width * 0.6785169,
        size.height * 0.6782536,
        size.width * 0.6775024,
        size.height * 0.6754762);
    path_8.cubicTo(
        size.width * 0.6764879,
        size.height * 0.6726190,
        size.width * 0.6756908,
        size.height * 0.6686512,
        size.width * 0.6751111,
        size.height * 0.6635714);
    path_8.cubicTo(
        size.width * 0.6745314,
        size.height * 0.6584131,
        size.width * 0.6742415,
        size.height * 0.6524607,
        size.width * 0.6742415,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6742415,
        size.height * 0.6390476,
        size.width * 0.6745386,
        size.height * 0.6331345,
        size.width * 0.6751353,
        size.height * 0.6279762);
    path_8.cubicTo(
        size.width * 0.6757319,
        size.height * 0.6228179,
        size.width * 0.6765435,
        size.height * 0.6188488,
        size.width * 0.6775749,
        size.height * 0.6160714);
    path_8.cubicTo(
        size.width * 0.6786063,
        size.height * 0.6132940,
        size.width * 0.6797560,
        size.height * 0.6119048,
        size.width * 0.6810290,
        size.height * 0.6119048);
    path_8.cubicTo(
        size.width * 0.6823019,
        size.height * 0.6119048,
        size.width * 0.6834517,
        size.height * 0.6132940,
        size.width * 0.6844831,
        size.height * 0.6160714);
    path_8.cubicTo(
        size.width * 0.6855145,
        size.height * 0.6188488,
        size.width * 0.6863261,
        size.height * 0.6228179,
        size.width * 0.6869227,
        size.height * 0.6279762);
    path_8.cubicTo(
        size.width * 0.6875193,
        size.height * 0.6331345,
        size.width * 0.6878164,
        size.height * 0.6390476,
        size.width * 0.6878164,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6878164,
        size.height * 0.6523810,
        size.width * 0.6875097,
        size.height * 0.6582940,
        size.width * 0.6868986,
        size.height * 0.6634524);
    path_8.cubicTo(
        size.width * 0.6862874,
        size.height * 0.6686107,
        size.width * 0.6854493,
        size.height * 0.6726190,
        size.width * 0.6843865,
        size.height * 0.6754762);
    path_8.cubicTo(
        size.width * 0.6833406,
        size.height * 0.6782536,
        size.width * 0.6821812,
        size.height * 0.6796429,
        size.width * 0.6809082,
        size.height * 0.6796429);
    path_8.close();
    path_8.moveTo(size.width * 0.6809082, size.height * 0.6678571);
    path_8.cubicTo(
        size.width * 0.6816159,
        size.height * 0.6678571,
        size.width * 0.6822778,
        size.height * 0.6670238,
        size.width * 0.6828889,
        size.height * 0.6653571);
    path_8.cubicTo(
        size.width * 0.6835169,
        size.height * 0.6636905,
        size.width * 0.6840242,
        size.height * 0.6611905,
        size.width * 0.6844106,
        size.height * 0.6578571);
    path_8.cubicTo(
        size.width * 0.6847971,
        size.height * 0.6545238,
        size.width * 0.6849903,
        size.height * 0.6504762,
        size.width * 0.6849903,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6849903,
        size.height * 0.6409524,
        size.width * 0.6848043,
        size.height * 0.6369440,
        size.width * 0.6844348,
        size.height * 0.6336905);
    path_8.cubicTo(
        size.width * 0.6840652,
        size.height * 0.6303571,
        size.width * 0.6835725,
        size.height * 0.6278571,
        size.width * 0.6829614,
        size.height * 0.6261905);
    path_8.cubicTo(
        size.width * 0.6823502,
        size.height * 0.6245238,
        size.width * 0.6816884,
        size.height * 0.6236905,
        size.width * 0.6809807,
        size.height * 0.6236905);
    path_8.cubicTo(
        size.width * 0.6802729,
        size.height * 0.6236905,
        size.width * 0.6796111,
        size.height * 0.6245238,
        size.width * 0.6790000,
        size.height * 0.6261905);
    path_8.cubicTo(
        size.width * 0.6784034,
        size.height * 0.6278571,
        size.width * 0.6779300,
        size.height * 0.6303571,
        size.width * 0.6775749,
        size.height * 0.6336905);
    path_8.cubicTo(
        size.width * 0.6772198,
        size.height * 0.6369440,
        size.width * 0.6770435,
        size.height * 0.6409524,
        size.width * 0.6770435,
        size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.6770435,
        size.height * 0.6527774,
        size.width * 0.6774058,
        size.height * 0.6582536,
        size.width * 0.6781304,
        size.height * 0.6621429);
    path_8.cubicTo(
        size.width * 0.6788720,
        size.height * 0.6659524,
        size.width * 0.6797971,
        size.height * 0.6678571,
        size.width * 0.6809082,
        size.height * 0.6678571);
    path_8.close();
    path_8.moveTo(size.width * 0.6958043, size.height * 0.6458333);
    path_8.lineTo(size.width * 0.7019396, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.6982198, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.6932923, size.height * 0.6503571);
    path_8.lineTo(size.width * 0.6932923, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.6905386, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.6905386, size.height * 0.5904762);
    path_8.lineTo(size.width * 0.6932923, size.height * 0.5904762);
    path_8.lineTo(size.width * 0.6932923, size.height * 0.6416667);
    path_8.lineTo(size.width * 0.6981232, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7019396, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.6958043, size.height * 0.6458333);
    path_8.close();
    path_8.moveTo(size.width * 0.7053140, size.height * 0.6042857);
    path_8.cubicTo(
        size.width * 0.7048140,
        size.height * 0.6042857,
        size.width * 0.7043961,
        size.height * 0.6034524,
        size.width * 0.7040580,
        size.height * 0.6017857);
    path_8.cubicTo(
        size.width * 0.7037198,
        size.height * 0.6001190,
        size.width * 0.7035507,
        size.height * 0.5980560,
        size.width * 0.7035507,
        size.height * 0.5955952);
    path_8.cubicTo(
        size.width * 0.7035507,
        size.height * 0.5931345,
        size.width * 0.7037198,
        size.height * 0.5910714,
        size.width * 0.7040580,
        size.height * 0.5894048);
    path_8.cubicTo(
        size.width * 0.7043961,
        size.height * 0.5877381,
        size.width * 0.7048140,
        size.height * 0.5869048,
        size.width * 0.7053140,
        size.height * 0.5869048);
    path_8.cubicTo(
        size.width * 0.7057971,
        size.height * 0.5869048,
        size.width * 0.7062077,
        size.height * 0.5877381,
        size.width * 0.7065459,
        size.height * 0.5894048);
    path_8.cubicTo(
        size.width * 0.7068841,
        size.height * 0.5910714,
        size.width * 0.7070531,
        size.height * 0.5931345,
        size.width * 0.7070531,
        size.height * 0.5955952);
    path_8.cubicTo(
        size.width * 0.7070531,
        size.height * 0.5980560,
        size.width * 0.7068841,
        size.height * 0.6001190,
        size.width * 0.7065459,
        size.height * 0.6017857);
    path_8.cubicTo(
        size.width * 0.7062077,
        size.height * 0.6034524,
        size.width * 0.7057971,
        size.height * 0.6042857,
        size.width * 0.7053140,
        size.height * 0.6042857);
    path_8.close();
    path_8.moveTo(size.width * 0.7066667, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7066667, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.7039130, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.7039130, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7066667, size.height * 0.6129762);
    path_8.close();
    path_8.moveTo(size.width * 0.7169976, size.height * 0.6119048);
    path_8.cubicTo(
        size.width * 0.7180435,
        size.height * 0.6119048,
        size.width * 0.7189783,
        size.height * 0.6129762,
        size.width * 0.7197995,
        size.height * 0.6151190);
    path_8.cubicTo(
        size.width * 0.7206353,
        size.height * 0.6172619,
        size.width * 0.7212874,
        size.height * 0.6204369,
        size.width * 0.7217560,
        size.height * 0.6246429);
    path_8.cubicTo(
        size.width * 0.7222222,
        size.height * 0.6288488,
        size.width * 0.7224565,
        size.height * 0.6339286,
        size.width * 0.7224565,
        size.height * 0.6398810);
    path_8.lineTo(size.width * 0.7224565, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.7197271, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.7197271, size.height * 0.6419048);
    path_8.cubicTo(
        size.width * 0.7197271,
        size.height * 0.6360321,
        size.width * 0.7194275,
        size.height * 0.6315476,
        size.width * 0.7188333,
        size.height * 0.6284524);
    path_8.cubicTo(
        size.width * 0.7182367,
        size.height * 0.6252774,
        size.width * 0.7174227,
        size.height * 0.6236905,
        size.width * 0.7163937,
        size.height * 0.6236905);
    path_8.cubicTo(
        size.width * 0.7153623,
        size.height * 0.6236905,
        size.width * 0.7145411,
        size.height * 0.6252774,
        size.width * 0.7139300,
        size.height * 0.6284524);
    path_8.cubicTo(
        size.width * 0.7133333,
        size.height * 0.6315476,
        size.width * 0.7130362,
        size.height * 0.6360321,
        size.width * 0.7130362,
        size.height * 0.6419048);
    path_8.lineTo(size.width * 0.7130362, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.7102826, size.height * 0.6785714);
    path_8.lineTo(size.width * 0.7102826, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7130362, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7130362, size.height * 0.6204762);
    path_8.cubicTo(
        size.width * 0.7134855,
        size.height * 0.6177774,
        size.width * 0.7140580,
        size.height * 0.6156750,
        size.width * 0.7147512,
        size.height * 0.6141667);
    path_8.cubicTo(
        size.width * 0.7154589,
        size.height * 0.6126583,
        size.width * 0.7162077,
        size.height * 0.6119048,
        size.width * 0.7169976,
        size.height * 0.6119048);
    path_8.close();
    path_8.moveTo(size.width * 0.7313309, size.height * 0.6119048);
    path_8.cubicTo(
        size.width * 0.7323599,
        size.height * 0.6119048,
        size.width * 0.7332705,
        size.height * 0.6129369,
        size.width * 0.7340604,
        size.height * 0.6150000);
    path_8.cubicTo(
        size.width * 0.7348647,
        size.height * 0.6169845,
        size.width * 0.7354928,
        size.height * 0.6194845,
        size.width * 0.7359444,
        size.height * 0.6225000);
    path_8.lineTo(size.width * 0.7359444, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7387222, size.height * 0.6129762);
    path_8.lineTo(size.width * 0.7387222, size.height * 0.6796429);
    path_8.cubicTo(
        size.width * 0.7387222,
        size.height * 0.6856750,
        size.width * 0.7384638,
        size.height * 0.6910321,
        size.width * 0.7379493,
        size.height * 0.6957143);
    path_8.cubicTo(
        size.width * 0.7374324,
        size.height * 0.7004762,
        size.width * 0.7366836,
        size.height * 0.7042060,
        size.width * 0.7357029,
        size.height * 0.7069048);
    path_8.cubicTo(
        size.width * 0.7347367,
        size.height * 0.7096036,
        size.width * 0.7335773,
        size.height * 0.7109524,
        size.width * 0.7322246,
        size.height * 0.7109524);
    path_8.cubicTo(
        size.width * 0.7304203,
        size.height * 0.7109524,
        size.width * 0.7289227,
        size.height * 0.7088488,
        size.width * 0.7277319,
        size.height * 0.7046429);
    path_8.cubicTo(
        size.width * 0.7265386,
        size.height * 0.7005155,
        size.width * 0.7258623,
        size.height * 0.6948810,
        size.width * 0.7257029,
        size.height * 0.6877381);
    path_8.lineTo(size.width * 0.7284324, size.height * 0.6877381);
    path_8.cubicTo(
        size.width * 0.7286401,
        size.height * 0.6911512,
        size.width * 0.7290845,
        size.height * 0.6938893,
        size.width * 0.7297609,
        size.height * 0.6959524);
    path_8.cubicTo(
        size.width * 0.7304517,
        size.height * 0.6980952,
        size.width * 0.7312729,
        size.height * 0.6991667,
        size.width * 0.7322246,
        size.height * 0.6991667);
    path_8.cubicTo(
        size.width * 0.7333357,
        size.height * 0.6991667,
        size.width * 0.7342295,
        size.height * 0.6975000,
        size.width * 0.7349058,
        size.height * 0.6941667);
    path_8.cubicTo(
        size.width * 0.7355966,
        size.height * 0.6908333,
        size.width * 0.7359444,
        size.height * 0.6859917,
        size.width * 0.7359444,
        size.height * 0.6796429);
    path_8.lineTo(size.width * 0.7359444, size.height * 0.6686905);
    path_8.cubicTo(
        size.width * 0.7354758,
        size.height * 0.6717857,
        size.width * 0.7348406,
        size.height * 0.6744048,
        size.width * 0.7340362,
        size.height * 0.6765476);
    path_8.cubicTo(
        size.width * 0.7332464,
        size.height * 0.6786107,
        size.width * 0.7323454,
        size.height * 0.6796429,
        size.width * 0.7313309,
        size.height * 0.6796429);
    path_8.cubicTo(
        size.width * 0.7301715,
        size.height * 0.6796429,
        size.width * 0.7291087,
        size.height * 0.6782143,
        size.width * 0.7281425,
        size.height * 0.6753571);
    path_8.cubicTo(
        size.width * 0.7271908,
        size.height * 0.6724202,
        size.width * 0.7264348,
        size.height * 0.6683726,
        size.width * 0.7258720,
        size.height * 0.6632143);
    path_8.cubicTo(
        size.width * 0.7253237,
        size.height * 0.6579762,
        size.width * 0.7250507,
        size.height * 0.6520631,
        size.width * 0.7250507,
        size.height * 0.6454762);
    path_8.cubicTo(
        size.width * 0.7250507,
        size.height * 0.6388893,
        size.width * 0.7253237,
        size.height * 0.6330560,
        size.width * 0.7258720,
        size.height * 0.6279762);
    path_8.cubicTo(
        size.width * 0.7264348,
        size.height * 0.6228964,
        size.width * 0.7271908,
        size.height * 0.6189679,
        size.width * 0.7281425,
        size.height * 0.6161905);
    path_8.cubicTo(
        size.width * 0.7291087,
        size.height * 0.6133333,
        size.width * 0.7301715,
        size.height * 0.6119048,
        size.width * 0.7313309,
        size.height * 0.6119048);
    path_8.close();
    path_8.moveTo(size.width * 0.7359444, size.height * 0.6457143);
    path_8.cubicTo(
        size.width * 0.7359444,
        size.height * 0.6411905,
        size.width * 0.7357512,
        size.height * 0.6372619,
        size.width * 0.7353647,
        size.height * 0.6339286);
    path_8.cubicTo(
        size.width * 0.7349928,
        size.height * 0.6305952,
        size.width * 0.7345024,
        size.height * 0.6280560,
        size.width * 0.7338913,
        size.height * 0.6263095);
    path_8.cubicTo(
        size.width * 0.7332778,
        size.height * 0.6245631,
        size.width * 0.7326184,
        size.height * 0.6236905,
        size.width * 0.7319106,
        size.height * 0.6236905);
    path_8.cubicTo(
        size.width * 0.7312005,
        size.height * 0.6236905,
        size.width * 0.7305411,
        size.height * 0.6245631,
        size.width * 0.7299300,
        size.height * 0.6263095);
    path_8.cubicTo(
        size.width * 0.7293164,
        size.height * 0.6279762,
        size.width * 0.7288188,
        size.height * 0.6304762,
        size.width * 0.7284324,
        size.height * 0.6338095);
    path_8.cubicTo(
        size.width * 0.7280604,
        size.height * 0.6370631,
        size.width * 0.7278768,
        size.height * 0.6409524,
        size.width * 0.7278768,
        size.height * 0.6454762);
    path_8.cubicTo(
        size.width * 0.7278768,
        size.height * 0.6500000,
        size.width * 0.7280604,
        size.height * 0.6539679,
        size.width * 0.7284324,
        size.height * 0.6573810);
    path_8.cubicTo(
        size.width * 0.7288188,
        size.height * 0.6607940,
        size.width * 0.7293164,
        size.height * 0.6634131,
        size.width * 0.7299300,
        size.height * 0.6652381);
    path_8.cubicTo(
        size.width * 0.7305580,
        size.height * 0.6669845,
        size.width * 0.7312174,
        size.height * 0.6678571,
        size.width * 0.7319106,
        size.height * 0.6678571);
    path_8.cubicTo(
        size.width * 0.7326184,
        size.height * 0.6678571,
        size.width * 0.7332778,
        size.height * 0.6669845,
        size.width * 0.7338913,
        size.height * 0.6652381);
    path_8.cubicTo(
        size.width * 0.7345024,
        size.height * 0.6634917,
        size.width * 0.7349928,
        size.height * 0.6609524,
        size.width * 0.7353647,
        size.height * 0.6576190);
    path_8.cubicTo(
        size.width * 0.7357512,
        size.height * 0.6542060,
        size.width * 0.7359444,
        size.height * 0.6502381,
        size.width * 0.7359444,
        size.height * 0.6457143);
    path_8.close();
    path_8.moveTo(size.width * 0.7471691, size.height * 0.6796429);
    path_8.cubicTo(
        size.width * 0.7461232,
        size.height * 0.6796429,
        size.width * 0.7451812,
        size.height * 0.6787298,
        size.width * 0.7443430,
        size.height * 0.6769048);
    path_8.cubicTo(
        size.width * 0.7435217,
        size.height * 0.6750000,
        size.width * 0.7428696,
        size.height * 0.6724607,
        size.width * 0.7423865,
        size.height * 0.6692857);
    path_8.cubicTo(
        size.width * 0.7419034,
        size.height * 0.6660321,
        size.width * 0.7416449,
        size.height * 0.6624202,
        size.width * 0.7416135,
        size.height * 0.6584524);
    path_8.lineTo(size.width * 0.7444638, size.height * 0.6584524);
    path_8.cubicTo(
        size.width * 0.7445121,
        size.height * 0.6612298,
        size.width * 0.7447778,
        size.height * 0.6635714,
        size.width * 0.7452609,
        size.height * 0.6654762);
    path_8.cubicTo(
        size.width * 0.7457609,
        size.height * 0.6673012,
        size.width * 0.7463792,
        size.height * 0.6682143,
        size.width * 0.7471208,
        size.height * 0.6682143);
    path_8.cubicTo(
        size.width * 0.7478937,
        size.height * 0.6682143,
        size.width * 0.7484903,
        size.height * 0.6675000,
        size.width * 0.7489082,
        size.height * 0.6660714);
    path_8.cubicTo(
        size.width * 0.7493430,
        size.height * 0.6645631,
        size.width * 0.7495604,
        size.height * 0.6626583,
        size.width * 0.7495604,
        size.height * 0.6603571);
    path_8.cubicTo(
        size.width * 0.7495604,
        size.height * 0.6578964,
        size.width * 0.7493188,
        size.height * 0.6560714,
        size.width * 0.7488357,
        size.height * 0.6548810);
    path_8.cubicTo(
        size.width * 0.7483696,
        size.height * 0.6536905,
        size.width * 0.7476208,
        size.height * 0.6523810,
        size.width * 0.7465894,
        size.height * 0.6509524);
    path_8.cubicTo(
        size.width * 0.7455918,
        size.height * 0.6496036,
        size.width * 0.7447778,
        size.height * 0.6482940,
        size.width * 0.7441498,
        size.height * 0.6470238);
    path_8.cubicTo(
        size.width * 0.7435217,
        size.height * 0.6457536,
        size.width * 0.7429734,
        size.height * 0.6438095,
        size.width * 0.7425072,
        size.height * 0.6411905);
    path_8.cubicTo(
        size.width * 0.7420556,
        size.height * 0.6385714,
        size.width * 0.7418309,
        size.height * 0.6351190,
        size.width * 0.7418309,
        size.height * 0.6308333);
    path_8.cubicTo(
        size.width * 0.7418309,
        size.height * 0.6273417,
        size.width * 0.7420411,
        size.height * 0.6241667,
        size.width * 0.7424589,
        size.height * 0.6213095);
    path_8.cubicTo(
        size.width * 0.7428768,
        size.height * 0.6183726,
        size.width * 0.7434734,
        size.height * 0.6160714,
        size.width * 0.7442464,
        size.height * 0.6144048);
    path_8.cubicTo(
        size.width * 0.7450362,
        size.height * 0.6127381,
        size.width * 0.7459372,
        size.height * 0.6119048,
        size.width * 0.7469517,
        size.height * 0.6119048);
    path_8.cubicTo(
        size.width * 0.7484662,
        size.height * 0.6119048,
        size.width * 0.7496812,
        size.height * 0.6138095,
        size.width * 0.7505990,
        size.height * 0.6176190);
    path_8.cubicTo(
        size.width * 0.7515338,
        size.height * 0.6213488,
        size.width * 0.7520314,
        size.height * 0.6264679,
        size.width * 0.7520966,
        size.height * 0.6329762);
    path_8.lineTo(size.width * 0.7493430, size.height * 0.6329762);
    path_8.cubicTo(
        size.width * 0.7492947,
        size.height * 0.6300393,
        size.width * 0.7490531,
        size.height * 0.6276988,
        size.width * 0.7486184,
        size.height * 0.6259524);
    path_8.cubicTo(
        size.width * 0.7481836,
        size.height * 0.6242060,
        size.width * 0.7475966,
        size.height * 0.6233333,
        size.width * 0.7468551,
        size.height * 0.6233333);
    path_8.cubicTo(
        size.width * 0.7461304,
        size.height * 0.6233333,
        size.width * 0.7455749,
        size.height * 0.6240083,
        size.width * 0.7451884,
        size.height * 0.6253571);
    path_8.cubicTo(
        size.width * 0.7448019,
        size.height * 0.6267060,
        size.width * 0.7446087,
        size.height * 0.6284917,
        size.width * 0.7446087,
        size.height * 0.6307143);
    path_8.cubicTo(
        size.width * 0.7446087,
        size.height * 0.6324607,
        size.width * 0.7447367,
        size.height * 0.6339286,
        size.width * 0.7449952,
        size.height * 0.6351190);
    path_8.cubicTo(
        size.width * 0.7452536,
        size.height * 0.6363095,
        size.width * 0.7455676,
        size.height * 0.6372619,
        size.width * 0.7459372,
        size.height * 0.6379762);
    path_8.cubicTo(
        size.width * 0.7463068,
        size.height * 0.6386107,
        size.width * 0.7468551,
        size.height * 0.6394440,
        size.width * 0.7475797,
        size.height * 0.6404762);
    path_8.cubicTo(
        size.width * 0.7485459,
        size.height * 0.6417464,
        size.width * 0.7493357,
        size.height * 0.6430560,
        size.width * 0.7499469,
        size.height * 0.6444048);
    path_8.cubicTo(
        size.width * 0.7505749,
        size.height * 0.6456750,
        size.width * 0.7511135,
        size.height * 0.6475798,
        size.width * 0.7515652,
        size.height * 0.6501190);
    path_8.cubicTo(
        size.width * 0.7520169,
        size.height * 0.6526583,
        size.width * 0.7522488,
        size.height * 0.6560321,
        size.width * 0.7522657,
        size.height * 0.6602381);
    path_8.cubicTo(
        size.width * 0.7522657,
        size.height * 0.6639679,
        size.width * 0.7520556,
        size.height * 0.6673012,
        size.width * 0.7516377,
        size.height * 0.6702381);
    path_8.cubicTo(
        size.width * 0.7512198,
        size.height * 0.6731750,
        size.width * 0.7506232,
        size.height * 0.6754762,
        size.width * 0.7498502,
        size.height * 0.6771429);
    path_8.cubicTo(
        size.width * 0.7490942,
        size.height * 0.6788095,
        size.width * 0.7482005,
        size.height * 0.6796429,
        size.width * 0.7471691,
        size.height * 0.6796429);
    path_8.close();

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_8, paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.8780193, size.height * 0.2708333);
    path_9.cubicTo(
        size.width * 0.8769614,
        size.height * 0.2708333,
        size.width * 0.8760942,
        size.height * 0.2725071,
        size.width * 0.8754155,
        size.height * 0.2758560);
    path_9.cubicTo(
        size.width * 0.8747367,
        size.height * 0.2792036,
        size.width * 0.8743961,
        size.height * 0.2834821,
        size.width * 0.8743961,
        size.height * 0.2886905);
    path_9.cubicTo(
        size.width * 0.8743961,
        size.height * 0.2938988,
        size.width * 0.8747367,
        size.height * 0.2981774,
        size.width * 0.8754155,
        size.height * 0.3015250);
    path_9.cubicTo(
        size.width * 0.8760942,
        size.height * 0.3048738,
        size.width * 0.8769614,
        size.height * 0.3065476,
        size.width * 0.8780193,
        size.height * 0.3065476);
    path_9.cubicTo(
        size.width * 0.8790773,
        size.height * 0.3065476,
        size.width * 0.8799444,
        size.height * 0.3048738,
        size.width * 0.8806232,
        size.height * 0.3015250);
    path_9.cubicTo(
        size.width * 0.8813019,
        size.height * 0.2981774,
        size.width * 0.8816425,
        size.height * 0.2938988,
        size.width * 0.8816425,
        size.height * 0.2886905);
    path_9.cubicTo(
        size.width * 0.8816425,
        size.height * 0.2834821,
        size.width * 0.8813019,
        size.height * 0.2792036,
        size.width * 0.8806232,
        size.height * 0.2758560);
    path_9.cubicTo(
        size.width * 0.8799444,
        size.height * 0.2725071,
        size.width * 0.8790773,
        size.height * 0.2708333,
        size.width * 0.8780193,
        size.height * 0.2708333);
    path_9.close();
    path_9.moveTo(size.width * 0.8946643, size.height * 0.3015250);
    path_9.lineTo(size.width * 0.8928527, size.height * 0.2959452);
    path_9.cubicTo(
        size.width * 0.8928527,
        size.height * 0.2937131,
        size.width * 0.8928527,
        size.height * 0.2912952,
        size.width * 0.8928527,
        size.height * 0.2886905);
    path_9.cubicTo(
        size.width * 0.8928527,
        size.height * 0.2864583,
        size.width * 0.8928140,
        size.height * 0.2840405,
        size.width * 0.8927391,
        size.height * 0.2814357);
    path_9.lineTo(size.width * 0.8946643, size.height * 0.2758560);
    path_9.cubicTo(
        size.width * 0.8959469,
        size.height * 0.2717631,
        size.width * 0.8963986,
        size.height * 0.2661833,
        size.width * 0.8960217,
        size.height * 0.2591143);
    path_9.cubicTo(
        size.width * 0.8951908,
        size.height * 0.2472095,
        size.width * 0.8939082,
        size.height * 0.2364214,
        size.width * 0.8921715,
        size.height * 0.2267488);
    path_9.cubicTo(
        size.width * 0.8911159,
        size.height * 0.2215405,
        size.width * 0.8899082,
        size.height * 0.2206095,
        size.width * 0.8885483,
        size.height * 0.2239583);
    path_9.lineTo(size.width * 0.8866232, size.height * 0.2295381);
    path_9.cubicTo(
        size.width * 0.8858696,
        size.height * 0.2265619,
        size.width * 0.8850386,
        size.height * 0.2241440,
        size.width * 0.8841329,
        size.height * 0.2222845);
    path_9.lineTo(size.width * 0.8841329, size.height * 0.2111238);
    path_9.cubicTo(
        size.width * 0.8840580,
        size.height * 0.2040548,
        size.width * 0.8833043,
        size.height * 0.1994048,
        size.width * 0.8818696,
        size.height * 0.1971726);
    path_9.cubicTo(
        size.width * 0.8793019,
        size.height * 0.1945690,
        size.width * 0.8767367,
        size.height * 0.1945690,
        size.width * 0.8741691,
        size.height * 0.1971726);
    path_9.cubicTo(
        size.width * 0.8727343,
        size.height * 0.1994048,
        size.width * 0.8719807,
        size.height * 0.2040548,
        size.width * 0.8719058,
        size.height * 0.2111238);
    path_9.lineTo(size.width * 0.8719058, size.height * 0.2222845);
    path_9.cubicTo(
        size.width * 0.8710000,
        size.height * 0.2241440,
        size.width * 0.8701691,
        size.height * 0.2265619,
        size.width * 0.8694155,
        size.height * 0.2295381);
    path_9.lineTo(size.width * 0.8674903, size.height * 0.2239583);
    path_9.cubicTo(
        size.width * 0.8661304,
        size.height * 0.2206095,
        size.width * 0.8649227,
        size.height * 0.2215405,
        size.width * 0.8638671,
        size.height * 0.2267488);
    path_9.cubicTo(
        size.width * 0.8621304,
        size.height * 0.2364214,
        size.width * 0.8608478,
        size.height * 0.2472095,
        size.width * 0.8600169,
        size.height * 0.2591143);
    path_9.cubicTo(
        size.width * 0.8596401,
        size.height * 0.2661833,
        size.width * 0.8600918,
        size.height * 0.2717631,
        size.width * 0.8613744,
        size.height * 0.2758560);
    path_9.lineTo(size.width * 0.8632995, size.height * 0.2814357);
    path_9.cubicTo(
        size.width * 0.8632246,
        size.height * 0.2840405,
        size.width * 0.8631860,
        size.height * 0.2864583,
        size.width * 0.8631860,
        size.height * 0.2886905);
    path_9.cubicTo(
        size.width * 0.8631860,
        size.height * 0.2909226,
        size.width * 0.8632246,
        size.height * 0.2933405,
        size.width * 0.8632995,
        size.height * 0.2959452);
    path_9.lineTo(size.width * 0.8613744, size.height * 0.3015250);
    path_9.cubicTo(
        size.width * 0.8600918,
        size.height * 0.3056179,
        size.width * 0.8596401,
        size.height * 0.3111976,
        size.width * 0.8600169,
        size.height * 0.3182667);
    path_9.cubicTo(
        size.width * 0.8608478,
        size.height * 0.3301714,
        size.width * 0.8621304,
        size.height * 0.3409595,
        size.width * 0.8638671,
        size.height * 0.3506321);
    path_9.cubicTo(
        size.width * 0.8649227,
        size.height * 0.3554690,
        size.width * 0.8661304,
        size.height * 0.3563988,
        size.width * 0.8674903,
        size.height * 0.3534226);
    path_9.lineTo(size.width * 0.8694155, size.height * 0.3478429);
    path_9.cubicTo(
        size.width * 0.8701691,
        size.height * 0.3508190,
        size.width * 0.8710000,
        size.height * 0.3532369,
        size.width * 0.8719058,
        size.height * 0.3550964);
    path_9.lineTo(size.width * 0.8719058, size.height * 0.3662571);
    path_9.cubicTo(
        size.width * 0.8719807,
        size.height * 0.3733262,
        size.width * 0.8727343,
        size.height * 0.3779762,
        size.width * 0.8741691,
        size.height * 0.3802083);
    path_9.cubicTo(
        size.width * 0.8754541,
        size.height * 0.3813238,
        size.width * 0.8767367,
        size.height * 0.3818821,
        size.width * 0.8780193,
        size.height * 0.3818821);
    path_9.cubicTo(
        size.width * 0.8793019,
        size.height * 0.3818821,
        size.width * 0.8805845,
        size.height * 0.3813238,
        size.width * 0.8818696,
        size.height * 0.3802083);
    path_9.cubicTo(
        size.width * 0.8833043,
        size.height * 0.3779762,
        size.width * 0.8840580,
        size.height * 0.3733262,
        size.width * 0.8841329,
        size.height * 0.3662571);
    path_9.lineTo(size.width * 0.8841329, size.height * 0.3550964);
    path_9.cubicTo(
        size.width * 0.8850386,
        size.height * 0.3532369,
        size.width * 0.8858696,
        size.height * 0.3508190,
        size.width * 0.8866232,
        size.height * 0.3478429);
    path_9.lineTo(size.width * 0.8885483, size.height * 0.3534226);
    path_9.cubicTo(
        size.width * 0.8899082,
        size.height * 0.3563988,
        size.width * 0.8911159,
        size.height * 0.3554690,
        size.width * 0.8921715,
        size.height * 0.3506321);
    path_9.cubicTo(
        size.width * 0.8939082,
        size.height * 0.3409595,
        size.width * 0.8951908,
        size.height * 0.3301714,
        size.width * 0.8960217,
        size.height * 0.3182667);
    path_9.cubicTo(
        size.width * 0.8963986,
        size.height * 0.3111976,
        size.width * 0.8959469,
        size.height * 0.3056179,
        size.width * 0.8946643,
        size.height * 0.3015250);
    path_9.close();
    path_9.moveTo(size.width * 0.8879831, size.height * 0.2886905);
    path_9.cubicTo(
        size.width * 0.8879831,
        size.height * 0.2950143,
        size.width * 0.8877560,
        size.height * 0.3007810,
        size.width * 0.8873043,
        size.height * 0.3059893);
    path_9.lineTo(size.width * 0.8912657, size.height * 0.3171500);
    path_9.cubicTo(
        size.width * 0.8908140,
        size.height * 0.3219869,
        size.width * 0.8902850,
        size.height * 0.3264512,
        size.width * 0.8896812,
        size.height * 0.3305429);
    path_9.lineTo(size.width * 0.8856063, size.height * 0.3193821);
    path_9.cubicTo(
        size.width * 0.8840193,
        size.height * 0.3290548,
        size.width * 0.8819831,
        size.height * 0.3350071,
        size.width * 0.8794903,
        size.height * 0.3372393);
    path_9.lineTo(size.width * 0.8794903, size.height * 0.3595607);
    path_9.cubicTo(
        size.width * 0.8784348,
        size.height * 0.3599333,
        size.width * 0.8773768,
        size.height * 0.3599333,
        size.width * 0.8763213,
        size.height * 0.3595607);
    path_9.lineTo(size.width * 0.8763213, size.height * 0.3372393);
    path_9.cubicTo(
        size.width * 0.8738309,
        size.height * 0.3350071,
        size.width * 0.8717923,
        size.height * 0.3290548,
        size.width * 0.8702077,
        size.height * 0.3193821);
    path_9.lineTo(size.width * 0.8663575, size.height * 0.3305429);
    path_9.cubicTo(
        size.width * 0.8657536,
        size.height * 0.3264512,
        size.width * 0.8652246,
        size.height * 0.3219869,
        size.width * 0.8647729,
        size.height * 0.3171500);
    path_9.lineTo(size.width * 0.8687343, size.height * 0.3059893);
    path_9.cubicTo(
        size.width * 0.8682826,
        size.height * 0.3007810,
        size.width * 0.8680556,
        size.height * 0.2950143,
        size.width * 0.8680556,
        size.height * 0.2886905);
    path_9.cubicTo(
        size.width * 0.8680556,
        size.height * 0.2823667,
        size.width * 0.8682826,
        size.height * 0.2766000,
        size.width * 0.8687343,
        size.height * 0.2713917);
    path_9.lineTo(size.width * 0.8647729, size.height * 0.2602310);
    path_9.cubicTo(
        size.width * 0.8652246,
        size.height * 0.2553940,
        size.width * 0.8657536,
        size.height * 0.2509298,
        size.width * 0.8663575,
        size.height * 0.2468381);
    path_9.lineTo(size.width * 0.8703188, size.height * 0.2579988);
    path_9.cubicTo(
        size.width * 0.8719058,
        size.height * 0.2483262,
        size.width * 0.8739420,
        size.height * 0.2423738,
        size.width * 0.8764348,
        size.height * 0.2401417);
    path_9.lineTo(size.width * 0.8764348, size.height * 0.2178202);
    path_9.cubicTo(
        size.width * 0.8774903,
        size.height * 0.2174476,
        size.width * 0.8785483,
        size.height * 0.2174476,
        size.width * 0.8796039,
        size.height * 0.2178202);
    path_9.lineTo(size.width * 0.8796039, size.height * 0.2401417);
    path_9.cubicTo(
        size.width * 0.8820966,
        size.height * 0.2423738,
        size.width * 0.8841329,
        size.height * 0.2483262,
        size.width * 0.8857198,
        size.height * 0.2579988);
    path_9.lineTo(size.width * 0.8896812, size.height * 0.2468381);
    path_9.cubicTo(
        size.width * 0.8902850,
        size.height * 0.2509298,
        size.width * 0.8908140,
        size.height * 0.2553940,
        size.width * 0.8912657,
        size.height * 0.2602310);
    path_9.lineTo(size.width * 0.8873043, size.height * 0.2713917);
    path_9.cubicTo(
        size.width * 0.8877560,
        size.height * 0.2766000,
        size.width * 0.8879831,
        size.height * 0.2823667,
        size.width * 0.8879831,
        size.height * 0.2886905);
    path_9.close();
    path_9.moveTo(size.width * 0.9124396, size.height * 0.3690476);
    path_9.cubicTo(
        size.width * 0.9113816,
        size.height * 0.3690476,
        size.width * 0.9105145,
        size.height * 0.3707214,
        size.width * 0.9098357,
        size.height * 0.3740702);
    path_9.cubicTo(
        size.width * 0.9091570,
        size.height * 0.3774179,
        size.width * 0.9088164,
        size.height * 0.3816964,
        size.width * 0.9088164,
        size.height * 0.3869048);
    path_9.cubicTo(
        size.width * 0.9088164,
        size.height * 0.3921131,
        size.width * 0.9091570,
        size.height * 0.3963917,
        size.width * 0.9098357,
        size.height * 0.3997393);
    path_9.cubicTo(
        size.width * 0.9105145,
        size.height * 0.4030881,
        size.width * 0.9113816,
        size.height * 0.4047619,
        size.width * 0.9124396,
        size.height * 0.4047619);
    path_9.cubicTo(
        size.width * 0.9134203,
        size.height * 0.4047619,
        size.width * 0.9142899,
        size.height * 0.4030881,
        size.width * 0.9150435,
        size.height * 0.3997393);
    path_9.cubicTo(
        size.width * 0.9157222,
        size.height * 0.3963917,
        size.width * 0.9160628,
        size.height * 0.3921131,
        size.width * 0.9160628,
        size.height * 0.3869048);
    path_9.cubicTo(
        size.width * 0.9160628,
        size.height * 0.3816964,
        size.width * 0.9157222,
        size.height * 0.3774179,
        size.width * 0.9150435,
        size.height * 0.3740702);
    path_9.cubicTo(
        size.width * 0.9143647,
        size.height * 0.3707214,
        size.width * 0.9134976,
        size.height * 0.3690476,
        size.width * 0.9124396,
        size.height * 0.3690476);
    path_9.close();
    path_9.moveTo(size.width * 0.9310097, size.height * 0.3679310);
    path_9.cubicTo(
        size.width * 0.9305556,
        size.height * 0.3612357,
        size.width * 0.9296111,
        size.height * 0.3575143,
        size.width * 0.9281787,
        size.height * 0.3567714);
    path_9.lineTo(size.width * 0.9259130, size.height * 0.3567714);
    path_9.cubicTo(
        size.width * 0.9255362,
        size.height * 0.3523071,
        size.width * 0.9250459,
        size.height * 0.3482143,
        size.width * 0.9244420,
        size.height * 0.3444940);
    path_9.lineTo(size.width * 0.9255749, size.height * 0.3350071);
    path_9.cubicTo(
        size.width * 0.9262536,
        size.height * 0.3283107,
        size.width * 0.9260652,
        size.height * 0.3223583,
        size.width * 0.9250072,
        size.height * 0.3171500);
    path_9.cubicTo(
        size.width * 0.9230459,
        size.height * 0.3085940,
        size.width * 0.9208551,
        size.height * 0.3022690,
        size.width * 0.9184396,
        size.height * 0.2981774);
    path_9.cubicTo(
        size.width * 0.9170072,
        size.height * 0.2963167,
        size.width * 0.9158744,
        size.height * 0.2985488,
        size.width * 0.9150435,
        size.height * 0.3048738);
    path_9.lineTo(size.width * 0.9139106, size.height * 0.3143595);
    path_9.cubicTo(
        size.width * 0.9133841,
        size.height * 0.3139881,
        size.width * 0.9128937,
        size.height * 0.3138024,
        size.width * 0.9124396,
        size.height * 0.3138024);
    path_9.cubicTo(
        size.width * 0.9119855,
        size.height * 0.3138024,
        size.width * 0.9114952,
        size.height * 0.3139881,
        size.width * 0.9109686,
        size.height * 0.3143595);
    path_9.lineTo(size.width * 0.9098357, size.height * 0.3048738);
    path_9.cubicTo(
        size.width * 0.9090048,
        size.height * 0.2985488,
        size.width * 0.9078720,
        size.height * 0.2963167,
        size.width * 0.9064396,
        size.height * 0.2981774);
    path_9.cubicTo(
        size.width * 0.9039469,
        size.height * 0.3022690,
        size.width * 0.9017585,
        size.height * 0.3085940,
        size.width * 0.8998720,
        size.height * 0.3171500);
    path_9.cubicTo(
        size.width * 0.8988140,
        size.height * 0.3223583,
        size.width * 0.8986256,
        size.height * 0.3283107,
        size.width * 0.8993043,
        size.height * 0.3350071);
    path_9.lineTo(size.width * 0.9004372, size.height * 0.3444940);
    path_9.cubicTo(
        size.width * 0.8998333,
        size.height * 0.3482143,
        size.width * 0.8993430,
        size.height * 0.3523071,
        size.width * 0.8989662,
        size.height * 0.3567714);
    path_9.lineTo(size.width * 0.8967005, size.height * 0.3567714);
    path_9.cubicTo(
        size.width * 0.8952681,
        size.height * 0.3571429,
        size.width * 0.8943237,
        size.height * 0.3608631,
        size.width * 0.8938696,
        size.height * 0.3679310);
    path_9.cubicTo(
        size.width * 0.8936449,
        size.height * 0.3742560,
        size.width * 0.8935314,
        size.height * 0.3805810,
        size.width * 0.8935314,
        size.height * 0.3869048);
    path_9.cubicTo(
        size.width * 0.8935314,
        size.height * 0.3932286,
        size.width * 0.8936449,
        size.height * 0.3995536,
        size.width * 0.8938696,
        size.height * 0.4058786);
    path_9.cubicTo(
        size.width * 0.8943237,
        size.height * 0.4129464,
        size.width * 0.8952681,
        size.height * 0.4166667,
        size.width * 0.8967005,
        size.height * 0.4170381);
    path_9.lineTo(size.width * 0.8989662, size.height * 0.4170381);
    path_9.cubicTo(
        size.width * 0.8993430,
        size.height * 0.4215024,
        size.width * 0.8998333,
        size.height * 0.4255952,
        size.width * 0.9004372,
        size.height * 0.4293155);
    path_9.lineTo(size.width * 0.8993043, size.height * 0.4388024);
    path_9.cubicTo(
        size.width * 0.8986256,
        size.height * 0.4454988,
        size.width * 0.8988140,
        size.height * 0.4514512,
        size.width * 0.8998720,
        size.height * 0.4566595);
    path_9.cubicTo(
        size.width * 0.9018333,
        size.height * 0.4652155,
        size.width * 0.9040242,
        size.height * 0.4715405,
        size.width * 0.9064396,
        size.height * 0.4756321);
    path_9.cubicTo(
        size.width * 0.9078720,
        size.height * 0.4774929,
        size.width * 0.9090048,
        size.height * 0.4752607,
        size.width * 0.9098357,
        size.height * 0.4689357);
    path_9.lineTo(size.width * 0.9109686, size.height * 0.4594500);
    path_9.cubicTo(
        size.width * 0.9114952,
        size.height * 0.4598214,
        size.width * 0.9119855,
        size.height * 0.4600071,
        size.width * 0.9124396,
        size.height * 0.4600071);
    path_9.cubicTo(
        size.width * 0.9128937,
        size.height * 0.4600071,
        size.width * 0.9133841,
        size.height * 0.4598214,
        size.width * 0.9139106,
        size.height * 0.4594500);
    path_9.lineTo(size.width * 0.9150435, size.height * 0.4689357);
    path_9.cubicTo(
        size.width * 0.9158744,
        size.height * 0.4752607,
        size.width * 0.9170072,
        size.height * 0.4774929,
        size.width * 0.9184396,
        size.height * 0.4756321);
    path_9.cubicTo(
        size.width * 0.9208551,
        size.height * 0.4715405,
        size.width * 0.9230459,
        size.height * 0.4652155,
        size.width * 0.9250072,
        size.height * 0.4566595);
    path_9.cubicTo(
        size.width * 0.9259879,
        size.height * 0.4514512,
        size.width * 0.9261787,
        size.height * 0.4454988,
        size.width * 0.9255749,
        size.height * 0.4388024);
    path_9.lineTo(size.width * 0.9244420, size.height * 0.4293155);
    path_9.cubicTo(
        size.width * 0.9250459,
        size.height * 0.4255952,
        size.width * 0.9255362,
        size.height * 0.4215024,
        size.width * 0.9259130,
        size.height * 0.4170381);
    path_9.lineTo(size.width * 0.9281787, size.height * 0.4170381);
    path_9.cubicTo(
        size.width * 0.9296111,
        size.height * 0.4166667,
        size.width * 0.9305556,
        size.height * 0.4129464,
        size.width * 0.9310097,
        size.height * 0.4058786);
    path_9.cubicTo(
        size.width * 0.9315362,
        size.height * 0.3932286,
        size.width * 0.9315362,
        size.height * 0.3805810,
        size.width * 0.9310097,
        size.height * 0.3679310);
    path_9.close();
    path_9.moveTo(size.width * 0.9268188, size.height * 0.3947167);
    path_9.lineTo(size.width * 0.9222899, size.height * 0.3947167);
    path_9.cubicTo(
        size.width * 0.9218382,
        size.height * 0.4069940,
        size.width * 0.9206304,
        size.height * 0.4170381,
        size.width * 0.9186667,
        size.height * 0.4248512);
    path_9.lineTo(size.width * 0.9209324, size.height * 0.4443821);
    path_9.cubicTo(
        size.width * 0.9201014,
        size.height * 0.4473583,
        size.width * 0.9191957,
        size.height * 0.4497762,
        size.width * 0.9182150,
        size.height * 0.4516369);
    path_9.lineTo(size.width * 0.9159493, size.height * 0.4326643);
    path_9.cubicTo(
        size.width * 0.9148937,
        size.height * 0.4348952,
        size.width * 0.9137222,
        size.height * 0.4360119,
        size.width * 0.9124396,
        size.height * 0.4360119);
    path_9.cubicTo(
        size.width * 0.9111570,
        size.height * 0.4360119,
        size.width * 0.9099855,
        size.height * 0.4348952,
        size.width * 0.9089300,
        size.height * 0.4326643);
    path_9.lineTo(size.width * 0.9066643, size.height * 0.4521952);
    path_9.cubicTo(
        size.width * 0.9056836,
        size.height * 0.4499631,
        size.width * 0.9047778,
        size.height * 0.4473583,
        size.width * 0.9039469,
        size.height * 0.4443821);
    path_9.lineTo(size.width * 0.9062126, size.height * 0.4248512);
    path_9.cubicTo(
        size.width * 0.9042488,
        size.height * 0.4170381,
        size.width * 0.9030411,
        size.height * 0.4069940,
        size.width * 0.9025894,
        size.height * 0.3947167);
    path_9.lineTo(size.width * 0.8980604, size.height * 0.3947167);
    path_9.cubicTo(
        size.width * 0.8979855,
        size.height * 0.3895095,
        size.width * 0.8979855,
        size.height * 0.3843000,
        size.width * 0.8980604,
        size.height * 0.3790929);
    path_9.lineTo(size.width * 0.9025894, size.height * 0.3790929);
    path_9.cubicTo(
        size.width * 0.9030411,
        size.height * 0.3668155,
        size.width * 0.9042488,
        size.height * 0.3567714,
        size.width * 0.9062126,
        size.height * 0.3489583);
    path_9.lineTo(size.width * 0.9039469, size.height * 0.3294274);
    path_9.cubicTo(
        size.width * 0.9047778,
        size.height * 0.3264512,
        size.width * 0.9056836,
        size.height * 0.3238464,
        size.width * 0.9066643,
        size.height * 0.3216143);
    path_9.lineTo(size.width * 0.9089300, size.height * 0.3411452);
    path_9.cubicTo(
        size.width * 0.9099855,
        size.height * 0.3389143,
        size.width * 0.9111570,
        size.height * 0.3377976,
        size.width * 0.9124396,
        size.height * 0.3377976);
    path_9.cubicTo(
        size.width * 0.9137222,
        size.height * 0.3377976,
        size.width * 0.9148937,
        size.height * 0.3389143,
        size.width * 0.9159493,
        size.height * 0.3411452);
    path_9.lineTo(size.width * 0.9182150, size.height * 0.3216143);
    path_9.cubicTo(
        size.width * 0.9191957,
        size.height * 0.3238464,
        size.width * 0.9201014,
        size.height * 0.3264512,
        size.width * 0.9209324,
        size.height * 0.3294274);
    path_9.lineTo(size.width * 0.9186667, size.height * 0.3489583);
    path_9.cubicTo(
        size.width * 0.9206304,
        size.height * 0.3567714,
        size.width * 0.9218382,
        size.height * 0.3668155,
        size.width * 0.9222899,
        size.height * 0.3790929);
    path_9.lineTo(size.width * 0.9268188, size.height * 0.3790929);
    path_9.cubicTo(
        size.width * 0.9268937,
        size.height * 0.3843000,
        size.width * 0.9268937,
        size.height * 0.3895095,
        size.width * 0.9268188,
        size.height * 0.3947167);
    path_9.close();

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Color(0xffFFCA6A).withOpacity(1.0);
    canvas.drawPath(path_9, paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.8572826, size.height * 0.6616667);
    path_10.lineTo(size.width * 0.8502536, size.height * 0.6616667);
    path_10.lineTo(size.width * 0.8490459, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.8461715, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.8521860, size.height * 0.5957143);
    path_10.lineTo(size.width * 0.8553744, size.height * 0.5957143);
    path_10.lineTo(size.width * 0.8613889, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.8584903, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.8572826, size.height * 0.6616667);
    path_10.close();
    path_10.moveTo(size.width * 0.8565097, size.height * 0.6505952);
    path_10.lineTo(size.width * 0.8537802, size.height * 0.6121429);
    path_10.lineTo(size.width * 0.8510266, size.height * 0.6505952);
    path_10.lineTo(size.width * 0.8565097, size.height * 0.6505952);
    path_10.close();
    path_10.moveTo(size.width * 0.8630845, size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.8630845,
        size.height * 0.6389679,
        size.width * 0.8633599,
        size.height * 0.6330560,
        size.width * 0.8639058,
        size.height * 0.6279762);
    path_10.cubicTo(
        size.width * 0.8644710,
        size.height * 0.6228179,
        size.width * 0.8652440,
        size.height * 0.6188488,
        size.width * 0.8662246,
        size.height * 0.6160714);
    path_10.cubicTo(
        size.width * 0.8672077,
        size.height * 0.6132940,
        size.width * 0.8683357,
        size.height * 0.6119048,
        size.width * 0.8696063,
        size.height * 0.6119048);
    path_10.cubicTo(
        size.width * 0.8712174,
        size.height * 0.6119048,
        size.width * 0.8725459,
        size.height * 0.6138095,
        size.width * 0.8735918,
        size.height * 0.6176190);
    path_10.cubicTo(
        size.width * 0.8746546,
        size.height * 0.6213488,
        size.width * 0.8753720,
        size.height * 0.6267060,
        size.width * 0.8757415,
        size.height * 0.6336905);
    path_10.lineTo(size.width * 0.8727705, size.height * 0.6336905);
    path_10.cubicTo(
        size.width * 0.8725290,
        size.height * 0.6304369,
        size.width * 0.8721425,
        size.height * 0.6278964,
        size.width * 0.8716111,
        size.height * 0.6260714);
    path_10.cubicTo(
        size.width * 0.8710797,
        size.height * 0.6242464,
        size.width * 0.8704130,
        size.height * 0.6233333,
        size.width * 0.8696063,
        size.height * 0.6233333);
    path_10.cubicTo(
        size.width * 0.8684807,
        size.height * 0.6233333,
        size.width * 0.8675773,
        size.height * 0.6253179,
        size.width * 0.8669010,
        size.height * 0.6292857);
    path_10.cubicTo(
        size.width * 0.8662415,
        size.height * 0.6331750,
        size.width * 0.8659106,
        size.height * 0.6386512,
        size.width * 0.8659106,
        size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.8659106,
        size.height * 0.6527774,
        size.width * 0.8662415,
        size.height * 0.6582940,
        size.width * 0.8669010,
        size.height * 0.6622619);
    path_10.cubicTo(
        size.width * 0.8675773,
        size.height * 0.6662298,
        size.width * 0.8684807,
        size.height * 0.6682143,
        size.width * 0.8696063,
        size.height * 0.6682143);
    path_10.cubicTo(
        size.width * 0.8712005,
        size.height * 0.6682143,
        size.width * 0.8722560,
        size.height * 0.6647619,
        size.width * 0.8727705,
        size.height * 0.6578571);
    path_10.lineTo(size.width * 0.8757415, size.height * 0.6578571);
    path_10.cubicTo(
        size.width * 0.8753551,
        size.height * 0.6645238,
        size.width * 0.8746304,
        size.height * 0.6698417,
        size.width * 0.8735676,
        size.height * 0.6738095);
    path_10.cubicTo(
        size.width * 0.8725048,
        size.height * 0.6776988,
        size.width * 0.8711860,
        size.height * 0.6796429,
        size.width * 0.8696063,
        size.height * 0.6796429);
    path_10.cubicTo(
        size.width * 0.8683357,
        size.height * 0.6796429,
        size.width * 0.8672077,
        size.height * 0.6782536,
        size.width * 0.8662246,
        size.height * 0.6754762);
    path_10.cubicTo(
        size.width * 0.8652440,
        size.height * 0.6726190,
        size.width * 0.8644710,
        size.height * 0.6686512,
        size.width * 0.8639058,
        size.height * 0.6635714);
    path_10.cubicTo(
        size.width * 0.8633599,
        size.height * 0.6584131,
        size.width * 0.8630845,
        size.height * 0.6524607,
        size.width * 0.8630845,
        size.height * 0.6457143);
    path_10.close();
    path_10.moveTo(size.width * 0.8775676, size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.8775676,
        size.height * 0.6389679,
        size.width * 0.8778430,
        size.height * 0.6330560,
        size.width * 0.8783889,
        size.height * 0.6279762);
    path_10.cubicTo(
        size.width * 0.8789541,
        size.height * 0.6228179,
        size.width * 0.8797271,
        size.height * 0.6188488,
        size.width * 0.8807077,
        size.height * 0.6160714);
    path_10.cubicTo(
        size.width * 0.8816908,
        size.height * 0.6132940,
        size.width * 0.8828188,
        size.height * 0.6119048,
        size.width * 0.8840894,
        size.height * 0.6119048);
    path_10.cubicTo(
        size.width * 0.8857005,
        size.height * 0.6119048,
        size.width * 0.8870290,
        size.height * 0.6138095,
        size.width * 0.8880749,
        size.height * 0.6176190);
    path_10.cubicTo(
        size.width * 0.8891377,
        size.height * 0.6213488,
        size.width * 0.8898551,
        size.height * 0.6267060,
        size.width * 0.8902246,
        size.height * 0.6336905);
    path_10.lineTo(size.width * 0.8872536, size.height * 0.6336905);
    path_10.cubicTo(
        size.width * 0.8870121,
        size.height * 0.6304369,
        size.width * 0.8866256,
        size.height * 0.6278964,
        size.width * 0.8860942,
        size.height * 0.6260714);
    path_10.cubicTo(
        size.width * 0.8855628,
        size.height * 0.6242464,
        size.width * 0.8848961,
        size.height * 0.6233333,
        size.width * 0.8840894,
        size.height * 0.6233333);
    path_10.cubicTo(
        size.width * 0.8829638,
        size.height * 0.6233333,
        size.width * 0.8820604,
        size.height * 0.6253179,
        size.width * 0.8813841,
        size.height * 0.6292857);
    path_10.cubicTo(
        size.width * 0.8807246,
        size.height * 0.6331750,
        size.width * 0.8803937,
        size.height * 0.6386512,
        size.width * 0.8803937,
        size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.8803937,
        size.height * 0.6527774,
        size.width * 0.8807246,
        size.height * 0.6582940,
        size.width * 0.8813841,
        size.height * 0.6622619);
    path_10.cubicTo(
        size.width * 0.8820604,
        size.height * 0.6662298,
        size.width * 0.8829638,
        size.height * 0.6682143,
        size.width * 0.8840894,
        size.height * 0.6682143);
    path_10.cubicTo(
        size.width * 0.8856836,
        size.height * 0.6682143,
        size.width * 0.8867391,
        size.height * 0.6647619,
        size.width * 0.8872536,
        size.height * 0.6578571);
    path_10.lineTo(size.width * 0.8902246, size.height * 0.6578571);
    path_10.cubicTo(
        size.width * 0.8898382,
        size.height * 0.6645238,
        size.width * 0.8891135,
        size.height * 0.6698417,
        size.width * 0.8880507,
        size.height * 0.6738095);
    path_10.cubicTo(
        size.width * 0.8869879,
        size.height * 0.6776988,
        size.width * 0.8856691,
        size.height * 0.6796429,
        size.width * 0.8840894,
        size.height * 0.6796429);
    path_10.cubicTo(
        size.width * 0.8828188,
        size.height * 0.6796429,
        size.width * 0.8816908,
        size.height * 0.6782536,
        size.width * 0.8807077,
        size.height * 0.6754762);
    path_10.cubicTo(
        size.width * 0.8797271,
        size.height * 0.6726190,
        size.width * 0.8789541,
        size.height * 0.6686512,
        size.width * 0.8783889,
        size.height * 0.6635714);
    path_10.cubicTo(
        size.width * 0.8778430,
        size.height * 0.6584131,
        size.width * 0.8775676,
        size.height * 0.6524607,
        size.width * 0.8775676,
        size.height * 0.6457143);
    path_10.close();
    path_10.moveTo(size.width * 0.8987415, size.height * 0.6796429);
    path_10.cubicTo(
        size.width * 0.8974855,
        size.height * 0.6796429,
        size.width * 0.8963502,
        size.height * 0.6782536,
        size.width * 0.8953357,
        size.height * 0.6754762);
    path_10.cubicTo(
        size.width * 0.8943213,
        size.height * 0.6726190,
        size.width * 0.8935242,
        size.height * 0.6686512,
        size.width * 0.8929444,
        size.height * 0.6635714);
    path_10.cubicTo(
        size.width * 0.8923647,
        size.height * 0.6584131,
        size.width * 0.8920749,
        size.height * 0.6524607,
        size.width * 0.8920749,
        size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.8920749,
        size.height * 0.6390476,
        size.width * 0.8923744,
        size.height * 0.6331345,
        size.width * 0.8929686,
        size.height * 0.6279762);
    path_10.cubicTo(
        size.width * 0.8935652,
        size.height * 0.6228179,
        size.width * 0.8943792,
        size.height * 0.6188488,
        size.width * 0.8954082,
        size.height * 0.6160714);
    path_10.cubicTo(
        size.width * 0.8964396,
        size.height * 0.6132940,
        size.width * 0.8975918,
        size.height * 0.6119048,
        size.width * 0.8988623,
        size.height * 0.6119048);
    path_10.cubicTo(
        size.width * 0.9001353,
        size.height * 0.6119048,
        size.width * 0.9012874,
        size.height * 0.6132940,
        size.width * 0.9023164,
        size.height * 0.6160714);
    path_10.cubicTo(
        size.width * 0.9033478,
        size.height * 0.6188488,
        size.width * 0.9041618,
        size.height * 0.6228179,
        size.width * 0.9047560,
        size.height * 0.6279762);
    path_10.cubicTo(
        size.width * 0.9053527,
        size.height * 0.6331345,
        size.width * 0.9056498,
        size.height * 0.6390476,
        size.width * 0.9056498,
        size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.9056498,
        size.height * 0.6523810,
        size.width * 0.9053454,
        size.height * 0.6582940,
        size.width * 0.9047319,
        size.height * 0.6634524);
    path_10.cubicTo(
        size.width * 0.9041208,
        size.height * 0.6686107,
        size.width * 0.9032826,
        size.height * 0.6726190,
        size.width * 0.9022198,
        size.height * 0.6754762);
    path_10.cubicTo(
        size.width * 0.9011739,
        size.height * 0.6782536,
        size.width * 0.9000145,
        size.height * 0.6796429,
        size.width * 0.8987415,
        size.height * 0.6796429);
    path_10.close();
    path_10.moveTo(size.width * 0.8987415, size.height * 0.6678571);
    path_10.cubicTo(
        size.width * 0.8994517,
        size.height * 0.6678571,
        size.width * 0.9001111,
        size.height * 0.6670238,
        size.width * 0.9007222,
        size.height * 0.6653571);
    path_10.cubicTo(
        size.width * 0.9013502,
        size.height * 0.6636905,
        size.width * 0.9018575,
        size.height * 0.6611905,
        size.width * 0.9022440,
        size.height * 0.6578571);
    path_10.cubicTo(
        size.width * 0.9026304,
        size.height * 0.6545238,
        size.width * 0.9028237,
        size.height * 0.6504762,
        size.width * 0.9028237,
        size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.9028237,
        size.height * 0.6409524,
        size.width * 0.9026401,
        size.height * 0.6369440,
        size.width * 0.9022681,
        size.height * 0.6336905);
    path_10.cubicTo(
        size.width * 0.9018986,
        size.height * 0.6303571,
        size.width * 0.9014082,
        size.height * 0.6278571,
        size.width * 0.9007947,
        size.height * 0.6261905);
    path_10.cubicTo(
        size.width * 0.9001836,
        size.height * 0.6245238,
        size.width * 0.8995242,
        size.height * 0.6236905,
        size.width * 0.8988140,
        size.height * 0.6236905);
    path_10.cubicTo(
        size.width * 0.8981063,
        size.height * 0.6236905,
        size.width * 0.8974469,
        size.height * 0.6245238,
        size.width * 0.8968333,
        size.height * 0.6261905);
    path_10.cubicTo(
        size.width * 0.8962391,
        size.height * 0.6278571,
        size.width * 0.8957633,
        size.height * 0.6303571,
        size.width * 0.8954082,
        size.height * 0.6336905);
    path_10.cubicTo(
        size.width * 0.8950556,
        size.height * 0.6369440,
        size.width * 0.8948768,
        size.height * 0.6409524,
        size.width * 0.8948768,
        size.height * 0.6457143);
    path_10.cubicTo(
        size.width * 0.8948768,
        size.height * 0.6527774,
        size.width * 0.8952391,
        size.height * 0.6582536,
        size.width * 0.8959638,
        size.height * 0.6621429);
    path_10.cubicTo(
        size.width * 0.8967053,
        size.height * 0.6659524,
        size.width * 0.8976304,
        size.height * 0.6678571,
        size.width * 0.8987415,
        size.height * 0.6678571);
    path_10.close();
    path_10.moveTo(size.width * 0.9204251, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9204251, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9176715, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9176715, size.height * 0.6708333);
    path_10.cubicTo(
        size.width * 0.9172367,
        size.height * 0.6735321,
        size.width * 0.9166667,
        size.height * 0.6756750,
        size.width * 0.9159565,
        size.height * 0.6772619);
    path_10.cubicTo(
        size.width * 0.9152657,
        size.height * 0.6787702,
        size.width * 0.9145242,
        size.height * 0.6795238,
        size.width * 0.9137343,
        size.height * 0.6795238);
    path_10.cubicTo(
        size.width * 0.9126884,
        size.height * 0.6795238,
        size.width * 0.9117464,
        size.height * 0.6784524,
        size.width * 0.9109082,
        size.height * 0.6763095);
    path_10.cubicTo(
        size.width * 0.9100870,
        size.height * 0.6741667,
        size.width * 0.9094348,
        size.height * 0.6709917,
        size.width * 0.9089517,
        size.height * 0.6667857);
    path_10.cubicTo(
        size.width * 0.9084855,
        size.height * 0.6625798,
        size.width * 0.9082512,
        size.height * 0.6575000,
        size.width * 0.9082512,
        size.height * 0.6515476);
    path_10.lineTo(size.width * 0.9082512, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9109807, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9109807, size.height * 0.6495238);
    path_10.cubicTo(
        size.width * 0.9109807,
        size.height * 0.6553964,
        size.width * 0.9112802,
        size.height * 0.6599202,
        size.width * 0.9118744,
        size.height * 0.6630952);
    path_10.cubicTo(
        size.width * 0.9124710,
        size.height * 0.6661905,
        size.width * 0.9132850,
        size.height * 0.6677381,
        size.width * 0.9143140,
        size.height * 0.6677381);
    path_10.cubicTo(
        size.width * 0.9153454,
        size.height * 0.6677381,
        size.width * 0.9161594,
        size.height * 0.6661905,
        size.width * 0.9167536,
        size.height * 0.6630952);
    path_10.cubicTo(
        size.width * 0.9173671,
        size.height * 0.6599202,
        size.width * 0.9176715,
        size.height * 0.6553964,
        size.width * 0.9176715,
        size.height * 0.6495238);
    path_10.lineTo(size.width * 0.9176715, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9204251, size.height * 0.6129762);
    path_10.close();
    path_10.moveTo(size.width * 0.9307754, size.height * 0.6119048);
    path_10.cubicTo(
        size.width * 0.9318213,
        size.height * 0.6119048,
        size.width * 0.9327560,
        size.height * 0.6129762,
        size.width * 0.9335773,
        size.height * 0.6151190);
    path_10.cubicTo(
        size.width * 0.9344130,
        size.height * 0.6172619,
        size.width * 0.9350652,
        size.height * 0.6204369,
        size.width * 0.9355338,
        size.height * 0.6246429);
    path_10.cubicTo(
        size.width * 0.9360000,
        size.height * 0.6288488,
        size.width * 0.9362343,
        size.height * 0.6339286,
        size.width * 0.9362343,
        size.height * 0.6398810);
    path_10.lineTo(size.width * 0.9362343, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9335048, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9335048, size.height * 0.6419048);
    path_10.cubicTo(
        size.width * 0.9335048,
        size.height * 0.6360321,
        size.width * 0.9332053,
        size.height * 0.6315476,
        size.width * 0.9326111,
        size.height * 0.6284524);
    path_10.cubicTo(
        size.width * 0.9320145,
        size.height * 0.6252774,
        size.width * 0.9312005,
        size.height * 0.6236905,
        size.width * 0.9301715,
        size.height * 0.6236905);
    path_10.cubicTo(
        size.width * 0.9291401,
        size.height * 0.6236905,
        size.width * 0.9283188,
        size.height * 0.6252774,
        size.width * 0.9277077,
        size.height * 0.6284524);
    path_10.cubicTo(
        size.width * 0.9271111,
        size.height * 0.6315476,
        size.width * 0.9268140,
        size.height * 0.6360321,
        size.width * 0.9268140,
        size.height * 0.6419048);
    path_10.lineTo(size.width * 0.9268140, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9240604, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9240604, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9268140, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9268140, size.height * 0.6204762);
    path_10.cubicTo(
        size.width * 0.9272633,
        size.height * 0.6177774,
        size.width * 0.9278357,
        size.height * 0.6156750,
        size.width * 0.9285290,
        size.height * 0.6141667);
    path_10.cubicTo(
        size.width * 0.9292367,
        size.height * 0.6126583,
        size.width * 0.9299855,
        size.height * 0.6119048,
        size.width * 0.9307754,
        size.height * 0.6119048);
    path_10.close();
    path_10.moveTo(size.width * 0.9429589, size.height * 0.6240476);
    path_10.lineTo(size.width * 0.9429589, size.height * 0.6603571);
    path_10.cubicTo(
        size.width * 0.9429589,
        size.height * 0.6628179,
        size.width * 0.9430700,
        size.height * 0.6646036,
        size.width * 0.9432971,
        size.height * 0.6657143);
    path_10.cubicTo(
        size.width * 0.9435386,
        size.height * 0.6667464,
        size.width * 0.9439396,
        size.height * 0.6672619,
        size.width * 0.9445048,
        size.height * 0.6672619);
    path_10.lineTo(size.width * 0.9461957, size.height * 0.6672619);
    path_10.lineTo(size.width * 0.9461957, size.height * 0.6785714);
    path_10.lineTo(size.width * 0.9440217, size.height * 0.6785714);
    path_10.cubicTo(
        size.width * 0.9427802,
        size.height * 0.6785714,
        size.width * 0.9418309,
        size.height * 0.6771429,
        size.width * 0.9411715,
        size.height * 0.6742857);
    path_10.cubicTo(
        size.width * 0.9405097,
        size.height * 0.6714286,
        size.width * 0.9401812,
        size.height * 0.6667857,
        size.width * 0.9401812,
        size.height * 0.6603571);
    path_10.lineTo(size.width * 0.9401812, size.height * 0.6240476);
    path_10.lineTo(size.width * 0.9386111, size.height * 0.6240476);
    path_10.lineTo(size.width * 0.9386111, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9401812, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9401812, size.height * 0.5966667);
    path_10.lineTo(size.width * 0.9429589, size.height * 0.5966667);
    path_10.lineTo(size.width * 0.9429589, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9461957, size.height * 0.6129762);
    path_10.lineTo(size.width * 0.9461957, size.height * 0.6240476);
    path_10.lineTo(size.width * 0.9429589, size.height * 0.6240476);
    path_10.close();

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = Color(0xff9CA0C1).withOpacity(1.0);
    canvas.drawPath(path_10, paint_10_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
