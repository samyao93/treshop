import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/constants.dart';

class IllustrationWidget extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? subtitle;

  const IllustrationWidget({Key? key, this.icon, this.title, this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin:const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon!),
            const SizedBox(height: Const.space25),
            AutoSizeText(
              title!,
              style: theme.textTheme.headline3,
            ),
            const SizedBox(height: Const.space12),
            AutoSizeText(
              subtitle!,
              style: theme.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
