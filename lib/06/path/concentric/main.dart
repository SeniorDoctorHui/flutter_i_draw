import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i_draw/06/path/concentric/pager.dart';

import 'concentric_painter.dart';



void main() {
  // 确定初始化
  WidgetsFlutterBinding.ensureInitialized();
  //横屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //全屏显示
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(ConcentricPager(minRadius: 30,maxRadius: 80,colorsList: const [Colors.amber, Colors.cyan,Colors.blue,
    Colors.purple,Colors.red,Colors.pink]));
}