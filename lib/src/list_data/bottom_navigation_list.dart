import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:treshop/src/pages/cart/cart_page.dart';
import 'package:treshop/src/pages/home/home_page.dart';
import 'package:treshop/src/pages/profile/profile_page.dart';
import 'package:treshop/src/pages/shop/shop_page.dart';
 

class BottomNavigationList {
  static List<Widget> pageList(BuildContext context) => [
        const HomeScreen(),
        const CartScreen(),
        const ShopScreen(),
        const ProfileScreen(),
      ];
  static List<BottomNavigationBarItem> items(BuildContext context) => [
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.shoppingCart),
          label: AppLocalizations.of(context)!.cart,
        ),
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.shoppingBag),
          label: AppLocalizations.of(context)!.shop,
        ),
        BottomNavigationBarItem(
          icon: const Icon(FeatherIcons.user),
          label: AppLocalizations.of(context)!.profile,
        ),
      ];
}
