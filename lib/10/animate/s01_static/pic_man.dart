import 'package:flutter/material.dart';
import 'package:flutter_i_draw/10/animate/s01_static/pic_man_painter.dart';

class PicMan extends StatefulWidget {
  final Color color;
  final double angle;
  const PicMan({Key? key, this.color = Colors.lightBlue, this.angle = 30 }) : super(key: key);

  @override
  _PicManState createState() => _PicManState();
}

class _PicManState extends State<PicMan> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: PicManPainter(color: widget.color, angle : widget.angle), // 背景
    );
  }
}