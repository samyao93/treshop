import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum _AniProps { opacity, translateX }

class CustomFadeTransition extends StatelessWidget {
  final Duration duration;
  final Widget child;
  final Axis axis;

  const CustomFadeTransition({
    Key? key,
    required this.duration,
     this.axis = Axis.vertical,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween<dynamic>(begin: 0.0, end: 1.0))
      ..add(
        _AniProps.translateX,
        Tween<dynamic>(begin: 30.0, end: 0.0),
       const Duration(milliseconds: 200),
        // Curves.fastOutSlowIn,
        Curves.bounceOut,
      );

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: duration,
      duration: duration,
      tween: tween,
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
      child: child,
    );
  }
}
