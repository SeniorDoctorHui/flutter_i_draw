import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i_draw/15/bezier_wave/s01/paper.dart';

//增加注释345135
void main() {
  // 确定初始化
  WidgetsFlutterBinding.ensureInitialized();
  //横屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //全屏显示
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(Paper());
}