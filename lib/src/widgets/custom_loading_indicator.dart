import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitRing(
      color: Theme.of(context).primaryColor,
    );
  }
}
