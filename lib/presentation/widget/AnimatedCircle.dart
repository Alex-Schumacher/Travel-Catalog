import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedCircle extends StatefulWidget {
  AnimatedCircle({required this.child, required this.duration, super.key});
  Duration duration;
  Widget child;
  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> tween;

  @override
  initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..addListener(() {
            setState(() {});
          });
    animationController.repeat(reverse: true);
    var length = Random().nextInt(100);
    var direction = Random().nextBool();
    tween =
        Tween(begin: Random().nextDouble() + 1, end: Random().nextDouble() + 1)
            .animate(CurvedAnimation(
                parent: animationController, curve: Curves.easeInOutCubic));
  }

  @override
  dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: tween.value,
      child: widget.child,
    );
  }
}
