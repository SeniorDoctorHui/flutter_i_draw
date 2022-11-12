import 'package:flutter/material.dart';
import 'package:flutter_i_draw/06/path/combine/coordinate_pro.dart';

//测试
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
double waveWidth = 80;
double waveHeight = 40;

final Coordinate coordinate = Coordinate();

@override
void paint(Canvas canvas, Size size) {
  coordinate.paint(canvas, size);
  canvas.translate(size.width / 2, size.height / 2);
  Path path = Path();
  Paint paint = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  path.relativeQuadraticBezierTo( waveWidth / 2, -waveHeight * 2, waveWidth, 0);
  canvas.drawPath(path, paint);
}

@override
bool shouldRepaint(CustomPainter oldDelegate) => false;
}