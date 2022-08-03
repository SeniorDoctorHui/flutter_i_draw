import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i_draw/19/bg/s01/world.dart';

void main() {
  // // 确定初始化
  WidgetsFlutterBinding.ensureInitialized();
  // //横屏
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // //全屏显示
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:  Builder(
          builder:(ctx)=> Center(child: World(
            size: MediaQuery.of(ctx).size ,
          )),
        ),
      ),
    );
  }
}