import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_i_draw/06/path/combine/coordinate_pro.dart';



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

    Path path = Path();
    Paint paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    path
      ..lineTo(100, 100)
      ..relativeLineTo(0, -50)
      ..close();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawPath(path, paint);
    canvas.drawPath(path.shift(const Offset(100, 0)), paint);
    canvas.drawPath(path.shift(const Offset(200, 0)), paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}