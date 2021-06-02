import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/screens.dart';
import 'package:treshop/src/models/order_model.dart';

import 'custom_network_image.dart';



class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({Key? key, required this.order}) : super(key: key);
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

    _statusOrderColorType(StatusOrder val) {
      switch (val) {
        case StatusOrder.on_delivery:
          return Color(0xFFE77E1D);
        case StatusOrder.packaging:
          return Color(0xFFE3E71D);
        case StatusOrder.success:
          return Color(0xFF14BD18);
        default:
          return Color(0xFFE3E71D);
      }
    }

    _statusOrderLabelType(StatusOrder val) {
      switch (val) {
        case StatusOrder.on_delivery:
          return AppLocalizations.of(context)!.on_delivery;
        case StatusOrder.packaging:
          return AppLocalizations.of(context)!.packaging;
        case StatusOrder.success:
          return AppLocalizations.of(context)!.success;
        default:
          return AppLocalizations.of(context)!.not_pay;
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
        height: 230.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.space15,
                vertical: Const.space8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        AppLocalizations.of(context)!.trendias_Shop,
                        style: theme.textTheme.headline4,
                      ),
                      SizedBox(height: Const.space8),
                      AutoSizeText(
                        DateFormat.yMMMd().format(order.dateOrder!),
                        style: theme.textTheme.subtitle2,
                      ),
                    ],
                  ),
                  Icon(FeatherIcons.moreVertical, color: theme.hintColor)
                ],
              ),
            ),
            Divider(color: theme.backgroundColor, thickness: 2.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.space15,
              ),
              child: Row(
                children: [
                  CustomNetworkImage(
                    image: order.products!.first.productImage!,
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
                            order.products!.first.productName!,
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
                                    _colorType(order.products!.first.color!),
                              ),
                              SizedBox(width: Const.space8),
                              AutoSizeText(
                                AppLocalizations.of(context)!.size,
                                style: theme.textTheme.subtitle2,
                                maxLines: 1,
                              ),
                              SizedBox(width: 5.0),
                              AutoSizeText(
                                _sizeType(order.products!.first.size!),
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
                                order.products!.first.qty.toString(),
                                style: theme.textTheme.headline4,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          SizedBox(height: Const.space8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                NumberFormat.currency(
                                  symbol: '\$',
                                ).format(order.products!.first.price),
                                style: theme.textTheme.headline4,
                                maxLines: 1,
                              ),
                              AutoSizeText(
                                order.products!.length.toString() +
                                    " " +
                                    AppLocalizations.of(context)!.items,
                                style: theme.textTheme.subtitle1,
                                maxLines: 1,
                              ),
                            ],
                          ),
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
                        NumberFormat.currency(symbol: '\$').format(order.total),
                        style: theme.textTheme.headline4,
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: _statusOrderColorType(order.statusOrder!)
                          .withOpacity(.1),
                      borderRadius: BorderRadius.circular(Const.radius),
                    ),
                    child: AutoSizeText(
                      _statusOrderLabelType(order.statusOrder!),
                      style: theme.textTheme.bodyText2!.copyWith(
                        color: _statusOrderColorType(order.statusOrder!),
                      ),
                    ),
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
