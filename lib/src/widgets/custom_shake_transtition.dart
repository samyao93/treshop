

import 'package:flutter/material.dart';

class CustomShakeTransition extends StatelessWidget {
  final Widget? child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final Curve curve;

  const CustomShakeTransition({
    Key? key,
    this.duration = const Duration(milliseconds: 700),
    this.offset = 140.0,
    this.child,
    this.curve = Curves.easeOutQuint,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: duration,
      curve: curve,
      tween: Tween(begin: 1, end: 0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0)
              : Offset(0,value * offset),
          child: child,
        );
      },
      child: child,
    );
  }
}
