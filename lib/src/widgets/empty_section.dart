import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      margin: EdgeInsets.symmetric(horizontal: Const.margin),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon!),
            SizedBox(height: Const.space25),
            AutoSizeText(
              title!,
              style: theme.textTheme.headline3,
            ),
            SizedBox(height: Const.space12),
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
