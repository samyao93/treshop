import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:treshop/src/helpers/constants.dart';
import 'package:treshop/src/helpers/screens.dart';
import 'package:treshop/src/models/product_model.dart';
import 'package:treshop/src/widgets/custom_network_image.dart';
 

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => Get.toNamed<dynamic>(Routes.product, arguments: product),
      borderRadius: BorderRadius.circular(Const.radius),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Const.radius),
        ),
        child: Container(
          margin: const EdgeInsets.all(Const.space12),
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomNetworkImage(
                    image: product.images!.first,
                    borderRadius: BorderRadius.circular(
                      Const.radius,
                    ), 
                    height: Screens.width(context) / 2.0,
                  ),
                  Positioned(
                    right: Const.space8,
                    bottom: Const.space8,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: theme.cardColor.withOpacity(.4),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(FeatherIcons.heart),
                        color: Colors.red,
                        iconSize: 15,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: Const.space12),
              AutoSizeText(
                product.name!,
                style: theme.textTheme.headline4,
                maxLines: 1,
              ),
              const SizedBox(height: Const.space8),
              AutoSizeText(
                NumberFormat.currency(
                  symbol: r'\$',
                ).format(product.price),
                style: theme.textTheme.bodyText2,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
