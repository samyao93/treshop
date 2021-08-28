import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/screens.dart';
import 'package:treshop/src/models/order_model.dart';
import 'package:treshop/src/widgets/custom_network_image.dart';
 

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({Key? key, required this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   Color _colorType(int val) {
      switch (val) {
        case 0:
          return const Color(0xFF6D9BE1);
        case 1:
          return const Color(0xFFBF5E5A);
        case 2:
          return const Color(0xFFA1ABBD);
        case 3:
          return const Color(0xFF699156);
        case 4:
          return const Color(0xFFC58F5E);
        case 5:
          return const Color(0xFFA872B1);
        default:
          return const Color(0xFFFFFFFF);
      }
    }

   String _sizeType(int val) {
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

  Color  _statusOrderColorType(OrderStatus val) {
      switch (val) {
        case OrderStatus.onDelivery:
          return const Color(0xFFE77E1D);
        case OrderStatus.packaging:
          return const Color(0xFFE3E71D);
        case OrderStatus.success:
          return const Color(0xFF14BD18);
        default:
          return const Color(0xFFE3E71D);
      }
    }

    String _statusOrderLabelType(OrderStatus val) {
      switch (val) {
        case OrderStatus.onDelivery:
          return AppLocalizations.of(context)!.on_delivery;
        case OrderStatus.packaging:
          return AppLocalizations.of(context)!.packaging;
        case OrderStatus.success:
          return AppLocalizations.of(context)!.success;
        default:
          return AppLocalizations.of(context)!.not_pay;
      }
    }

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin:const EdgeInsets.only(bottom: Const.space15),
      child: InkWell(
        onTap: ()=>Get.toNamed<dynamic>(Routes.orderDetail),
        borderRadius: BorderRadius.circular(Const.radius),
        child: SizedBox(
          width: Screens.width(context),
          height: 230,
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
                     const   SizedBox(height: Const.space8),
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
              Divider(color: theme.backgroundColor, thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.space15,
                ),
                child: Row(
                  children: [
                    CustomNetworkImage(
                      image: order.products!.first.productImage!,
                      width: 65,
                      height: 65,
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
                      const      SizedBox(height: Const.space8),
                            Row(
                              children: [
                                AutoSizeText(
                                  AppLocalizations.of(context)!.color,
                                  style: theme.textTheme.subtitle2,
                                  maxLines: 1,
                                ),
                           const     SizedBox(width: 5),
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor:
                                      _colorType(order.products!.first.color!),
                                ),
                            const    SizedBox(width: Const.space8),
                                AutoSizeText(
                                  AppLocalizations.of(context)!.size,
                                  style: theme.textTheme.subtitle2,
                                  maxLines: 1,
                                ),
                              const  SizedBox(width: 5),
                                AutoSizeText(
                                  _sizeType(order.products!.first.size!),
                                  style: theme.textTheme.headline4,
                                  maxLines: 1,
                                ),
                          const      SizedBox(width: Const.space8),
                                AutoSizeText(
                                  AppLocalizations.of(context)!.qty,
                                  style: theme.textTheme.subtitle2,
                                  maxLines: 1,
                                ),
                           const     SizedBox(width: 5),
                                AutoSizeText(
                                  order.products!.first.qty.toString(),
                                  style: theme.textTheme.headline4,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          const  SizedBox(height: Const.space8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  NumberFormat.currency(
                                    symbol: r'\$',
                                  ).format(order.products!.first.price),
                                  style: theme.textTheme.headline4,
                                  maxLines: 1,
                                ),
                                AutoSizeText(
             '${order.products!.length} ${AppLocalizations.of(context)!.items}',
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
              Divider(color: theme.backgroundColor, thickness: 2),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Const.margin,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                            AppLocalizations.of(context)!.total_payment,
                            style: theme.textTheme.subtitle1),
                        AutoSizeText(
                          NumberFormat.currency(symbol: r'\$')
                              .format(order.total),
                          style: theme.textTheme.headline4,
                        ),
                      ],
                    ),
                    Container(
                      padding:const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: _statusOrderColorType(order.status!)
                            .withOpacity(.1),
                        borderRadius: BorderRadius.circular(Const.radius),
                      ),
                      child: AutoSizeText(
                        _statusOrderLabelType(order.status!),
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: _statusOrderColorType(order.status!),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
