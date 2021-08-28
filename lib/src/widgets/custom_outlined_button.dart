import 'package:flutter/material.dart';

import 'package:treshop/src/helpers/colors.dart';
import 'package:treshop/src/helpers/constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onTap;
  final String? label;
  final double height;
  final double width;
  final double labelSize;
  final Color? color;
  final Color labelColor;

  const CustomOutlinedButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.width = double.infinity,
    this.height = 45.0,
    this.labelSize = 14.0,
    this.color = ColorLight.primary,
    this.labelColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          onSurface:  Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Const.radius),
            side: BorderSide(
              color: theme.primaryColor
            ),
          ),
        ),
        child: Text(
          label!,
          style: theme.textTheme.bodyText1?.copyWith(
            fontSize: labelSize,
          ),
        ),
      ),
    );
  }
}
