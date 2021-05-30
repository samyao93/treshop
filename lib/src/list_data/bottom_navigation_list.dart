import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:treshop/src/pages/home/home_page.dart';
import 'package:treshop/src/pages/shop/shop_page.dart';

class BottomNavigationList {
  static List<Widget> pageList(BuildContext context) => [
        HomeScreen(),
        Container(),
        ShopScreen(),
        Container(),
      ];
  static List<BottomNavigationBarItem> items(BuildContext context) => [
    BottomNavigationBarItem(
      icon: Icon(FeatherIcons.home),
      label: AppLocalizations.of(context)!.home,
    ),
    BottomNavigationBarItem(
      icon: Icon(FeatherIcons.heart),
      label: AppLocalizations.of(context)!.favorite,
    ),
    BottomNavigationBarItem(
      icon: Icon(FeatherIcons.shoppingBag),
      label: AppLocalizations.of(context)!.shop,
    ),
    BottomNavigationBarItem(
      icon: Icon(FeatherIcons.user),
      label: AppLocalizations.of(context)!.profile,
    ),
  ];
}
