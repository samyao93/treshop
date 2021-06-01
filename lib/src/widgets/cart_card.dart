import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../helpers/constants.dart';
import '../models/cart_model.dart';
import 'custom_network_image.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  final VoidCallback? onRemoveTap;

  const CartCard({Key? key, required this.cart, this.onRemoveTap})
      : super(key: key);
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

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: [
        IconSlideAction(
          icon: FeatherIcons.trash,
          color: Colors.red,
          onTap: onRemoveTap,
        ),
      ],
      child: Container(
        height: 120.0,
        color: theme.cardColor,
        padding: EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space12,
        ),
        child: Row(
          children: [
            CustomNetworkImage(
              image: cart.productImage!,
              width: 120.0,
              height: 120.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space12,
                  vertical: 5.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      cart.productName!,
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
                          backgroundColor: _colorType(cart.color!),
                        ),
                        SizedBox(width: Const.space8),
                        AutoSizeText(
                          AppLocalizations.of(context)!.size,
                          style: theme.textTheme.subtitle2,
                          maxLines: 1,
                        ),
                        SizedBox(width: 5.0),
                        AutoSizeText(
                          _sizeType(cart.size!),
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
                          cart.qty.toString(),
                          style: theme.textTheme.headline4,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    SizedBox(height: Const.space8),
                    AutoSizeText(
                      NumberFormat.currency(
                        symbol: '\$',
                      ).format(cart.price),
                      style: theme.textTheme.headline4,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
