import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/models/product_model.dart';
import 'package:treshop/src/widgets/custom_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductCheckoutCard extends StatelessWidget {
  const ProductCheckoutCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      margin: EdgeInsets.only(
        right: Const.space15,
        bottom: 2.0,
      ),
      child: Container(
        width: 250.0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(Const.space8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(
                    image: product.images!.first,
                    width: 60.0,
                    height: 60.0,
                  ),
                  SizedBox(width: Const.space8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          product.name!,
                          style: theme.textTheme.headline3,
                          maxLines: 1,
                        ),
                        SizedBox(height: 5.0),
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
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: Const.space8),
                            AutoSizeText(
                              AppLocalizations.of(context)!.size,
                              style: theme.textTheme.subtitle2,
                              maxLines: 1,
                            ),
                            SizedBox(width: 5.0),
                            AutoSizeText(
                              'M',
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
                              1.toString(),
                              style: theme.textTheme.headline4,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: theme.hintColor),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    AppLocalizations.of(context)!.total,
                    style: theme.textTheme.subtitle1,
                  ),
                  AutoSizeText(
                    NumberFormat.currency(symbol: '\$').format(1202),
                    style: theme.textTheme.headline3,
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
