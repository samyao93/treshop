part of '../checkout_page.dart';

class _FooterSection extends StatelessWidget {
  final int? couponId;
  final CheckoutModel? checkout;
  final double? discount;
  final int? priceTotal;
  final int? total;

  const _FooterSection(
      {Key? key,
      this.couponId,
      this.checkout,
      this.discount,
      this.priceTotal,
      this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<CheckoutProvider>(builder: (context, provider, snapshot) {
      return Container(
        width: Screens.width(context),
        height: 218,
        padding: const EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space12,
        ),
        decoration: BoxDecoration(
          color: theme.cardColor,
        ),
        child: Column(
          children: [
            _BuildPriceDetail(
              title: AppLocalizations.of(context)!.shipping_fee,
              value: ShippingList.shippingList[provider.shippingSelected].price,
            ),
            const SizedBox(height: Const.space8),
            if (couponId == null)
              const SizedBox()
            else
              _BuildPriceDetail(
                isDiscount: true,
                title:
                    // ignore: lines_longer_than_80_chars
                    '${AppLocalizations.of(context)!.discount} ${CouponList.couponList[checkout!.couponId!].discount}%',
                value: discount?.toInt(),
              ),
            const SizedBox(height: Const.space8),
            _BuildPriceDetail(
              title: AppLocalizations.of(context)!.price_total,
              value: priceTotal,
            ),
            const SizedBox(height: Const.space8),
            Divider(color: theme.hintColor),
            const SizedBox(height: Const.space8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.total,
                  style: theme.textTheme.headline4,
                ),
                AutoSizeText(
                  NumberFormat.currency(
                    symbol: r'$',
                     decimalDigits: 0,
                  ).format(total ?? 0),
                  style: theme.textTheme.headline3,
                ),
              ],
            ),
            const SizedBox(height: Const.space8),
            if (provider.isLoading == true)
              const CustomLoadingIndicator()
            else
              CustomElevatedButton(
                onTap: () {
                  if (provider.addressSelected == null) {
                    showToast(
                        msg: AppLocalizations.of(context)!
                            .choose_the_destination_address);
                  } else if (provider.paymentSelected == null) {
                    showToast(
                        msg: AppLocalizations.of(context)!
                            .payment_method_not_selected);
                  } else {
                    provider.isLoading = true;

                    Future.delayed(const Duration(seconds: 2), () {
                      Get.toNamed<dynamic>(Routes.checkoutSuccess);
                      provider.isLoading = false;
                    });
                  }
                },
                label: AppLocalizations.of(context)!.buy_now,
              ),
          ],
        ),
      );
    });
  }
}
