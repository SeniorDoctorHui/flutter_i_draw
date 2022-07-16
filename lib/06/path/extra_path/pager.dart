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



  final Paint mPaint = Paint()
    ..color = Colors.purpleAccent
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;


  @override
  void paint(Canvas canvas, Size size) {
    coordinate.paint(canvas, size);
    Path path = Path()
      ..moveTo(0, 0)
      ..relativeLineTo(40, 40)
      ..relativeLineTo(0, -40)
      ..close();
    Matrix4 m4 = Matrix4.translationValues(size.width/2, size.height/2, 0);
    Matrix4 center = Matrix4.translationValues(20, 20, 0);
    Matrix4 back = Matrix4.translationValues(-20, -20, 0);

    Matrix4 rotateM4 = Matrix4.rotationZ(60*pi/180);
    Matrix4 scaleM4 = Matrix4.diagonal3Values(2,2,1);

    m4.multiply(center);// tag1
    m4.multiply(rotateM4);
    m4.multiply(scaleM4);
    m4.multiply(back); // tag2 这样三角形斜边中心点为20,20
    path = path.transform(m4.storage);
    canvas.drawPath(path, mPaint);


  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}