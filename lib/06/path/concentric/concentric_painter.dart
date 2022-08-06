import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_i_draw/06/path/concentric/concentric_manager.dart';

class ConcentricPager extends StatefulWidget {
  ConcentricPager({this.minRadius = 10, this.maxRadius = 20, this.colorsList = const [Colors.amber, Colors.cyan], Key? key}) : super(key: key);

  final double minRadius;

  final double maxRadius;

  List<Color> colorsList = [Colors.amber, Colors.cyan];

  @override
  State<ConcentricPager> createState() => ConcentricPagerState();
}

class ConcentricPagerState extends State<ConcentricPager> with SingleTickerProviderStateMixin {
  double _valueX = 20.0;
  double _valueY = 20.0;

  late Ticker _ticker;
  late ConcentricManager manager;

  @override
  void initState(){
    super.initState();
    manager = ConcentricManager(widget.colorsList);
    _ticker = createTicker(_tick)
      ..start();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, zone) {
      debugPrint("zone maxWidth and zone maxHeight ${zone.maxWidth} ${zone.maxHeight}");
      return Column(
        children: [buildPager(), buildSliderX(), buildSliderY()],
      );
    });
  }

  Widget buildSliderX() {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Slider(
            max: 180,
            min: -180,
            divisions: 360,
            value: _valueX,
            onChanged: (v) {
              setState(() {
                _valueX = v;
              });
            }));
  }

  Widget buildSliderY() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Slider(
            max: 180,
            min: -180,
            divisions: 360,
            value: _valueY,
            onChanged: (v) {
              setState(() {
                _valueY = v;
              });
            }));
  }

  Widget buildPager() {
    return Container(
      width: 300,
      height: 200,
      color: Colors.white,
      alignment: Alignment.center,
      child: LayoutBuilder(builder: (_, zone) {
        return CustomPaint(
          size: Size(zone.maxWidth, zone.maxHeight),
          // 使用CustomPaint
          painter: ConcentricPainter(manage: manager,
              minRadius: widget.minRadius, maxRadius: widget.maxRadius, centerFactorX: _valueX / 180, centerFactorY: _valueY / 180),
        );
      }),
    );
  }

  void _tick(Duration elapsed) {
        manager.tick(DateTime.now());
  }
}

class ConcentricPainter extends CustomPainter {

  final ConcentricManager manage;

  ConcentricPainter({this.minRadius = 10, this.maxRadius = 20, this.centerFactorX = 0, this.centerFactorY = 0, required this.manage})
  : super(repaint: manage);

  final double minRadius;

  final double maxRadius;

  final double centerFactorX;

  final double centerFactorY;

  List<Color> colorsList = [Colors.amber, Colors.cyan];

  final Paint mPaint = Paint()
    ..strokeWidth = 2
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("size.width and size.height=${size.width} ${size.height}");
    canvas.translate(size.width / 2, size.height / 2);
    Path path = Path();
    colorsList = manage.colorsList;
    mPaint.color = colorsList[0];
    drawCircle(path, canvas, minRadius, size);

    if (colorsList.length > 2) {
      //被分割的同心圆份数
      int count = colorsList.length - 1;
      double divider = (maxRadius - minRadius) / count;
      //从1开始,因为0是minRadius
      for (int i = 1; i < count; i++) {
        path.reset();
        mPaint.color = colorsList[i];
        drawCircle(path, canvas, minRadius + i * divider, size);
      }
    }
    path.reset();
    mPaint.color = colorsList[colorsList.length - 1];
    drawCircle(path, canvas, maxRadius, size);
  }

  void drawCircle(Path path, Canvas canvas, double radius, Size size) {
    path.addOval(Rect.fromCenter(center: Offset.zero + Offset(size.width / 2 * centerFactorX, size.height / 2 * centerFactorY), width: radius, height: radius));
    canvas.drawPath(path, mPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
