import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'concentric_painter1.dart';



void main() {
  // 确定初始化
  WidgetsFlutterBinding.ensureInitialized();
  //横屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  //全屏显示
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(Center(
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ConcentricPager(minRadius: 30,maxRadius: 80,colorsList: const [Colors.amber, Colors.cyan,Colors.blue,
              Colors.purple,Colors.red,Colors.pink]),
          ],
        ),
      ),
    ),
  ));
}