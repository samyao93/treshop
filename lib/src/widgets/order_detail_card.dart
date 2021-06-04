import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../helpers/constants.dart';
import '../helpers/screens.dart';
import '../models/cart_model.dart';
import 'custom_network_image.dart';

class OrderDetailCard extends StatelessWidget {
  final CartModel order;

  const OrderDetailCard({Key? key, required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _colorType(int val) {
      switch (val) {
        case 0:
          return Color(0xFF6D9BE1);
        case 1:
          return Color(0xFFBF5E5A);
        case 2:
          return Color(0xFFA1ABBD);
        case 3:
          return Color(0xFF699156);
        case 4:
          return Color(0xFFC58F5E);
        case 5:
          return Color(0xFFA872B1);
        default:
          return Color(0xFFFFFFFF);
      }
    }

    _sizeType(int val) {
      switch (val) {
        case 0:
          return 'M';
        case 1:
          return 'L';
        case 2:
          return 'XL';
        default:
          return 'M';
      }
    }

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: EdgeInsets.only(bottom: Const.space15),
      child: Container(
        width: Screens.width(context),
        height: 157.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.space15,
                vertical: Const.space12,
              ),
              child: Row(
                children: [
                  CustomNetworkImage(
                    image: order.productImage!,
                    width: 65.0,
                    height: 65.0,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Const.space12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            order.productName!,
                            style: theme.textTheme.headline3,
                            maxLines: 1,
                          ),
                          SizedBox(height: Const.space8),
                          Row(
                            children: [
                              AutoSizeText(
                                AppLocalizations.of(context)!.color,
                                style: theme.textTheme.subtitle2,
                                maxLines: 1,
                              ),
                              SizedBox(width: 5.0),
                              CircleAvatar(
                                radius: 8.0,
                                backgroundColor:
                                    _colorType(order.color!),
                              ),
                              SizedBox(width: Const.space8),
                              AutoSizeText(
                                AppLocalizations.of(context)!.size,
                                style: theme.textTheme.subtitle2,
                                maxLines: 1,
                              ),
                              SizedBox(width: 5.0),
                              AutoSizeText(
                                _sizeType(order.size!),
                                style: theme.textTheme.headline4,
                                maxLines: 1,
                              ),
                              SizedBox(width: Const.space8),
                              AutoSizeText(
                                AppLocalizations.of(context)!.qty,
                                style: theme.textTheme.subtitle2,
                                maxLines: 1,
                              ),
                              SizedBox(width: 5.0),
                              AutoSizeText(
                                order.qty.toString(),
                                style: theme.textTheme.headline4,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          SizedBox(height: Const.space8),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(color: theme.backgroundColor, thickness: 2.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
                vertical: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(AppLocalizations.of(context)!.total_payment,
                          style: theme.textTheme.subtitle1),
                      AutoSizeText(
                        NumberFormat.currency(symbol: '\$').format(order.price),
                        style: theme.textTheme.headline4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
