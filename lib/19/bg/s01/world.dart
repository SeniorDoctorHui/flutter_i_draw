import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i_draw/19/bg/s01/particle.dart';
import 'package:flutter_i_draw/19/bg/s01/particle_manage.dart';
import 'package:flutter_i_draw/19/bg/s01/world_render.dart';

class World extends StatefulWidget {
  final Size size;

  World({Key? key,required this.size}) : super(key: key);

  @override
  _WorldState1 createState() => _WorldState1();
}

class _WorldState1 extends State<World> with SingleTickerProviderStateMixin {
  AnimationController ? _controller;
  ParticleManage pm = ParticleManage();
  Random random = Random();
  Timer ?  timer;

  @override
  void initState() {
    super.initState();
    pm.size = widget.size;
    // 定义计时器
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // 如果粒子数大于10，停止计时器
      if (pm.particles.length >= 10) {
        timer.cancel();
      }
      // 添加随机粒子
      pm.addParticle(Particle(
          color: pm.randomRGB(),
          size: 15 + 4 * random.nextDouble(),
          vx: 1 * random.nextDouble() * pow(-1, random.nextInt(20)),
          vy: 1 * random.nextDouble() * pow(-1, random.nextInt(20)),
          ay: 0,
          x: 150,
          y: 100));
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )
      ..addListener(pm.tick)
      ..repeat();
  }

  theWorld(){
    if (_controller!.isAnimating) {
      _controller!.stop();
    } else {
      _controller!.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // SizedBox(
        //     width: widget.size.width,
        //     height: widget.size.height,
        //     child: Image.asset(
        //       'assets/images/bg.jpeg',
        //       fit: BoxFit.cover,
        //     )),
        GestureDetector(
          onTap: theWorld,
          child: CustomPaint(
            size: pm.size,
            painter: WorldRender(
              manage: pm,
            ),
          ),
        ),
      ],
    );
  }
}

class _WorldState extends State<World> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ParticleManage pm = ParticleManage();
  Random random = Random();

  @override
  void initState() {
    super.initState();
    loadImageFromAssets("assets/images/sword.png");
    pm.size = widget.size;

    initParticles();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(pm.tick)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  theWorld() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: widget.size.width,
            height: widget.size.height,
            child: Image.asset(
              'assets/images/bg.jpeg',
              fit: BoxFit.cover,
            )),
        GestureDetector(
          onTap: theWorld,
          child: CustomPaint(
            size: pm.size,
            painter: WorldRender(
              manage: pm,
            ),
          ),
        ),
      ],
    );
  }

  //读取 assets 中的图片
  void loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    pm.setImage(await decodeImageFromList(data.buffer.asUint8List()));
  }

  void initParticles() {
    for (int i = 0; i < 100; i++) {
      Particle particle = Particle(
          x: pm.size.width / 100 * i,
          y: 0,
          vx: 1 * random.nextDouble() * pow(-1, random.nextInt(20)),
          vy: 4 * random.nextDouble() + 1);
      pm.particles.add(particle);
    }
  }
}