import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/screens.dart';
import 'package:treshop/src/models/coupon_model.dart';
import 'package:treshop/src/widgets/custom_elevated_button.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    Key? key,
    this.onUseTap,
    this.buttonLabel,
    this.buttonColor,
    required this.coupon,
  }) : super(key: key);

  final CouponModel coupon;
  final String? buttonLabel;
  final VoidCallback? onUseTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // ignore: always_declare_return_types
    _onTapType(CouponCondition val) {
      switch (val) {
        case CouponCondition.notUsed:
          return () {};
        case CouponCondition.used:
          return null;
        case CouponCondition.exprired:
          return null;
      }
    }

    // ignore: always_declare_return_types
    _labelType(CouponCondition val) {
      switch (val) {
        case CouponCondition.notUsed:
          return buttonLabel;
        case CouponCondition.used:
          return AppLocalizations.of(context)!.used;
        case CouponCondition.exprired:
          return AppLocalizations.of(context)!.expired;
      }
    }

    return (coupon.condition == CouponCondition.notUsed)
        ? Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Const.radius),
            ),
            child: SizedBox(
              width: Screens.width(context),
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Screens.width(context),
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Const.radius),
                        topRight: Radius.circular(Const.radius),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.card_giftcard,
                          size: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(width: Const.space12),
                        AutoSizeText(
                          coupon.name!,
                          style: theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                      vertical: Const.space8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${coupon.discount}%',
                                    style: theme.textTheme.bodyText1!
                                        .copyWith(fontSize: 25),
                                  ),
                                  TextSpan(
                                    text: ' OFF',
                                    style: theme.textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${AppLocalizations.of(context)!.valid_until} ',
                                    style: theme.textTheme.subtitle2,
                                  ),
                                  TextSpan(
                                    text: DateFormat.yMMMEd()
                                        .format(coupon.expired!),
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          onTap: onUseTap,
                          label: buttonLabel,
                          color: buttonColor,
                          width: 100,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Const.radius),
            ),
            child: SizedBox(
              width: Screens.width(context),
              height: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Screens.width(context),
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Const.radius),
                        topRight: Radius.circular(Const.radius),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.card_giftcard,
                          size: 25,
                          color: Colors.white,
                        ),
                        const SizedBox(width: Const.space12),
                        AutoSizeText(
                          coupon.name!,
                          style: theme.textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Const.margin,
                      vertical: Const.space8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${coupon.discount}%',
                                    style: theme.textTheme.bodyText1!
                                        .copyWith(fontSize: 25),
                                  ),
                                  TextSpan(
                                    text: ' OFF',
                                    style: theme.textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${AppLocalizations.of(context)!.valid_until} ',
                                    style: theme.textTheme.subtitle2,
                                  ),
                                  TextSpan(
                                    text: DateFormat.yMMMEd()
                                        .format(coupon.expired!),
                                    style: theme.textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CustomElevatedButton(
                          onTap: _onTapType(coupon.condition!),
                          label: _labelType(coupon.condition!),
                          color: buttonColor,
                          width: 100,
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
