import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum _AniProps { opacity, translateX }

class CustomFadeTransition extends StatelessWidget {
  final Duration duration;
  final Widget child;
  final Axis axis;

  CustomFadeTransition({
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(
        _AniProps.translateX,
        Tween(begin: 30.0, end: 0.0),
        Duration(milliseconds: 200),
        // Curves.fastOutSlowIn,
        Curves.bounceOut,
      );

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: duration,
      duration: duration,
      tween: tween,
      child: child,
      // curve: ,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value.get(_AniProps.translateX), 0)
              : Offset(0, value.get(_AniProps.translateX)),
          child: child,
        ),
      ),
    );
  }
}
