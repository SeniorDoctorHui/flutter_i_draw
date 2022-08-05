

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'clock_manage.dart';
import 'clock_painter.dart';

class ClockPanel extends StatefulWidget {
  @override
  _ClockPanelState createState() => _ClockPanelState();
}

class _ClockPanelState extends State<ClockPanel>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  late ClockManage pm;

  @override
  void initState() {
    super.initState();
    pm = ClockManage(size: const Size(550, 200));

    _ticker = createTicker(_tick)
      ..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: pm.size,
      painter: ClockPainter(manage: pm),

    );
  }

  void _tick(Duration duration) {
    DateTime now = DateTime.now();

    if (now.millisecondsSinceEpoch - pm.datetime.millisecondsSinceEpoch > 1000) {
      pm..datetime = now..tick(now);
    }
  }
}