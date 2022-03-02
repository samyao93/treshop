import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  final List? dotsCount;
  final int? position;

  const CustomDotsIndicator({Key? key, this.dotsCount, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount!.length,
      position: position!.toDouble(),
      decorator: DotsDecorator(
        activeColor: Theme.of(context).primaryColor,
        activeSize: const Size(25, 9),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
