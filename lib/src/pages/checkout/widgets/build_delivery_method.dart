part of '../checkout_page.dart';

class _BuildDeliveryMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CheckoutProvider>(builder: (context, checkout, snapshot) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BuildLabelSection(
            label: AppLocalizations.of(context)!.delivery_method,
            trailing: AppLocalizations.of(context)!.change,
            onViewAllTap: () => Get.toNamed<dynamic>(Routes.shipping),
          ),
          const SizedBox(height: Const.space8),
          Container(
            width: Screens.width(context),
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: Const.margin),
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Const.radius),
              color: const Color(0xFFE3F1F2),
            ),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        ShippingList
                            .shippingList[checkout.shippingSelected].name!,
                        style: theme.textTheme.bodyText2!.copyWith(
                          color: ColorLight.fontTitle,
                        ),
                      ),
                      const SizedBox(height: 5),
                      AutoSizeText(
                        // ignore: lines_longer_than_80_chars
                        '${AppLocalizations.of(context)!.estimated} ${ShippingList.shippingList[checkout.shippingSelected].estimate!} ${AppLocalizations.of(context)!.days}',
                        style: theme.textTheme.subtitle2!.copyWith(
                          color: ColorLight.fontSubtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                AutoSizeText(
                  NumberFormat.currency(
                    symbol: r'$',
                     decimalDigits: 0,
                  ).format(ShippingList
                      .shippingList[checkout.shippingSelected].price),
                  style: theme.textTheme.headline3!.copyWith(
                    color: ColorLight.fontTitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
