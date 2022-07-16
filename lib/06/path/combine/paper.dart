import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'AbstractPath.dart';
import 'coordinate_pro.dart';



/// create by 张风捷特烈 on 2020/5/1
/// contact me by email 1981462002@qq.com
/// 说明:
class Paper extends StatelessWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        // 使用CustomPaint
        painter: PaperPainter(),
      ),
    );
  }
}

class PaperPainter extends CustomPainter {


  final Coordinate coordinate= Coordinate();

  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);

    Path path = Path();
    Paint paint = Paint();
    paint
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo( 30,30)
      ..close();


    final Paint arrowPainter = Paint();
    arrowPainter
      ..style = PaintingStyle.stroke..strokeWidth = 1
      ..color = Colors.red;


    double width =10;
    double height =10;
    Offset p0 = const Offset(40, 40);
    Offset p1 = const Offset(200, 40);
    Size portSize = Size(width, height);
    ArrowPath arrow = ArrowPath(
      head: PortPath(p0, portSize),
      tail: PortPath(p1, portSize),
    );
    canvas.drawPath(arrow.formPath(), arrowPainter);


    var pathOval =Path()..addOval(Rect.fromCenter(center: const Offset(0, 0),width: 60,height: 60));
    canvas.drawPath(Path.combine(PathOperation.difference, path, pathOval), paint);

    canvas.translate(120, 0);
    canvas.drawPath(Path.combine(PathOperation.intersect, path, pathOval), paint);

    canvas.translate(120, 0);
    canvas.drawPath(Path.combine(PathOperation.union, path, pathOval), paint);

    canvas.translate(-120*3.0, 0);
    canvas.drawPath(Path.combine(PathOperation.reverseDifference, path, pathOval), paint);

    canvas.translate(-120, 0);
    canvas.drawPath(Path.combine(PathOperation.xor, path, pathOval), paint);

    canvas.translate(-120, 0);
    canvas.drawPath(pathOval, paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}