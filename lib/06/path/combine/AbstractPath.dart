import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class AbstractPath {
  Path formPath();
}

class PortPath extends AbstractPath {
  final Offset position;
  final Size size;

  PortPath(this.position, this.size);

  @override
  Path formPath() {
    Path path = Path();
    //以position为中心,宽为size.width,高为size.height的矩形
    Rect zone = Rect.fromCenter(center: position, width: size.width, height: size.height);
    path.addOval(zone);
    return path;
  }
}

class ArrowPath extends AbstractPath {
  final PortPath head;
  final PortPath tail;

  ArrowPath({required this.head, required this.tail});

  @override
  Path formPath() {
    Offset line = (tail.position - head.position);
    Offset center = head.position + line / 2;
    double length = line.distance;
    debugPrint("length=$length");
    Rect lineZone = Rect.fromCenter(center: center, width: length, height: 2);
    Path linePath = Path()..addRect(lineZone);
    //linePath和起始节点连接
    Path temp = Path.combine(PathOperation.union, linePath, head.formPath());
    //temp和结尾节点连接
    return Path.combine(PathOperation.union, temp, tail.formPath());
  }
}
