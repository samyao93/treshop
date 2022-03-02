import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SortAndFilterList {
  static List<String> sortList(BuildContext context) => [
        AppLocalizations.of(context)!.popularity,
        AppLocalizations.of(context)!.lowest_price_to_highest_price,
        AppLocalizations.of(context)!.highest_price_to_lowest_price,
        AppLocalizations.of(context)!.newly_listed,
        AppLocalizations.of(context)!.discount,
      ];
  static List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];
  static List<Color> colorList = [
    const Color(0xFF6D9BE1),
    const Color(0xFFBF5E5A),
    const Color(0xFFA1ABBD),
    const Color(0xFF699156),
    const Color(0xFFC58F5E),
    const Color(0xFFA872B1),
  ];
  static List<String> categoryList(BuildContext context) => [
        AppLocalizations.of(context)!.all,
        AppLocalizations.of(context)!.men,
        AppLocalizations.of(context)!.women,
        AppLocalizations.of(context)!.boys,
        AppLocalizations.of(context)!.girls,
      ];
  static List<String> brandList = [
    'Nike',
    'Supreme',
    'Adidas',
    'Rising 88',
    'Sophie Paris',
  ];
}
