import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_i_draw/19/bg/s01/particle.dart';
import 'dart:ui' as ui;

class ParticleManage with ChangeNotifier {
  List<Particle> particles = [];
  Random random = Random();
  ui.Image? image;

  void setImage(ui.Image image) {
    this.image = image;
    notifyListeners();
  }

  Size size;

  ParticleManage({this.size = Size.zero});

  void setParticles(List<Particle> particles) {
    this.particles = particles;
  }

  void addParticle(Particle particle) {
    particles.add(particle);
    notifyListeners();
  }

  void tick() {
    for (int i = 0; i < particles.length; i++) {
      doUpdate(particles[i]);
    }
    notifyListeners();
  }

  void doUpdate(Particle p) {
    p.vy += p.ay; // y加速度变化
    p.vx += p.ax; // x加速度变化
    p.x += p.vx;
    p.y += p.vy;

    if (p.x > size.width) {
      p.x = size.width;
      p.vx = -p.vx;
    }

    if (p.x < 0) {
      p.x = 0;
      p.vx = -p.vx;
    }

    if (p.y > size.height) {
      p.y = 0;
    }
  }

  void reset() {
    for (var p in particles) {
      p.x = 0;
    }
    notifyListeners();
  }

  Color randomRGB({
    int limitR = 0,
    int limitG = 0,
    int limitB = 0,
  }) {
    var r = limitR + random.nextInt(256 - limitR); //红值
    var g = limitG + random.nextInt(256 - limitG); //绿值
    var b = limitB + random.nextInt(256 - limitB); //蓝值
    return Color.fromARGB(255, r, g, b); //生成argb模式的颜色
  }
}
