import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i_draw/14/bezier/s02_bezier2_player/pager.dart';


void main() {
  // 确定初始化
  WidgetsFlutterBinding.ensureInitialized();
  //横屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //全屏显示
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(const Pager());
}