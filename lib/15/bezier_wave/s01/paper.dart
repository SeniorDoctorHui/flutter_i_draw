import 'package:flutter/material.dart';
import 'package:flutter_i_draw/06/path/combine/coordinate_pro.dart';

//第十五章paper
//调到敌岛打特盗,特盗太刁投短刀，挡推顶打短刀掉，踏盗得刀盗打到
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

double waveWidth = 80;    //波纹宽度
double waveHeight = 40;  //波纹高度

final Coordinate coordinate = Coordinate();

@override
void paint(Canvas canvas, Size size) {
  //绘制坐标系
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