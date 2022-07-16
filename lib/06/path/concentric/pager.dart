

import 'package:flutter/material.dart';

/// 所属系统:  绘制小册
/// 所属模块:  ${自定义绘制模块}
/// 功能描述:  ${通用画板,外界可以传进来自定义CustomPainter}
/// 创建时间: 2022/7/16 9:30
/// 维护人: LiZhuHui
/// 邮箱: nalanrumeng1113@163.com
class Paper extends StatelessWidget {
   const Paper(this._customPainter,{Key? key}) : super(key: key);

   final CustomPainter _customPainter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        // 使用CustomPaint
        painter: _customPainter,
      ),
    );
  }
}