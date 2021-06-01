
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Const.margin),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(CustomIcon.shopping_bag),
            SizedBox(height: Const.space25),
            AutoSizeText(
              AppLocalizations.of(context)!.shopping_bag_is_empty,
              style: theme.textTheme.headline3,
            ),
            SizedBox(height: Const.space12),
            AutoSizeText(
              AppLocalizations.of(context)!
                  .looks_like_you_havent_added_any_item_to_your_cart_yet,
              style: theme.textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
