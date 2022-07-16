import 'package:flutter/material.dart';

class ConcentricPager extends StatelessWidget {
  ConcentricPager({this.minRadius = 10, this.maxRadius = 20, this.colorsList = const [Colors.amber, Colors.cyan], Key? key}) : super(key: key);

  final double minRadius;

  final double maxRadius;

  List<Color> colorsList = [Colors.amber, Colors.cyan];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        // 使用CustomPaint
        painter: ConcentricPainter(minRadius: minRadius, maxRadius: maxRadius, colorsList: colorsList),
      ),
    );
  }
}

class ConcentricPainter extends CustomPainter {
  ConcentricPainter({this.minRadius = 10, this.maxRadius = 20, this.colorsList = const [Colors.amber, Colors.cyan]});

  final double minRadius;

  final double maxRadius;

  List<Color> colorsList = [Colors.amber, Colors.cyan];

  final Paint mPaint = Paint()
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    mPaint.color = colorsList[0];
    drawCircle(path, canvas, minRadius);

    if (colorsList.length > 2) {
      //被分割的同心圆份数
      int count = colorsList.length - 1;
      double divider = (maxRadius - minRadius) / count;
      //从1开始,因为0是minRadius
      for (int i = 1; i < count; i++) {
        path.reset();
        mPaint.color = colorsList[i];
        drawCircle(path, canvas, minRadius + i * divider);
      }
    }
    path.reset();
    mPaint.color = colorsList[colorsList.length - 1];
    drawCircle(path, canvas, maxRadius);
  }

  void drawCircle(Path path, Canvas canvas, double radius) {
    path.addOval(Rect.fromCenter(center: Offset.zero, width: radius, height: radius));
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
