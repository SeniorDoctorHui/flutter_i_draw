import 'package:flutter/material.dart';
import 'package:flutter_i_draw/10/animate/s01_static/pic_man.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 58.0, left: 20),
              child: Center(
                child: Wrap(spacing: 20, runSpacing: 20, children: buildChildren()),
              ),
            )));
  }

  List<Widget> buildChildren() =>
      List<Widget>.generate(6,
              (index) => PicMan(
            color: Colors.lightBlue,
            angle: (1 + index) * 6.0, // 背景
          ));
}