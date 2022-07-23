import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_i_draw/06/path/combine/coordinate_pro.dart';

class Paper extends StatelessWidget {
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
  final Coordinate coordinate = Coordinate();

  Offset p1 = const Offset(50, 50);
  Offset p2 = const Offset(120, -60);
  Offset p3 = const Offset(160,-50);
  final Paint _helpPaint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    canvas.translate(size.width / 2, size.height / 2);

    Paint paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();
    //二次贝塞尔曲线  p1为控制点,p2为结束点,起点默认为零点
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    canvas.drawPath(path, paint);
    _drawHelp(canvas);
  }

  void _drawHelp(Canvas canvas) {
    _helpPaint
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    // PointMode.lines : 线段模式
    // 线段模式下：每两个点一对形成线段。如果点是奇数个，那么最后一个点将没有用。
    // PointMode.polygon : 多边形连线模式
    // 多边形连线模式下：所有的点依次连接成图形。
    canvas.drawPoints(PointMode.polygon,[Offset.zero, p1, p1,p2, p3], _helpPaint..strokeWidth=1);
    canvas.drawPoints(PointMode.points, [Offset.zero, p1, p1, p2],
        _helpPaint..strokeWidth = 8);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}