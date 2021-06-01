part of '../checkout_page.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CheckoutModel? checkout;

  int? _priceTotal = 0;
  int? _total = 0;
  double? _discount;
  int? _couponId;

  @override
  void initState() {
    super.initState();
    checkout = Get.arguments;
    List<int?> price = checkout!.products!.map((e) => e.price).toList();
    _priceTotal = price.fold(0, (p, c) => p! + c!);
    _couponId = checkout!.couponId;
    if (_couponId == null) {
      _discount = 0;
    } else {
      _discount = _priceTotal! *
          (CouponList.couponList[checkout!.couponId!].discount! / 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<CheckoutProvider>(
      builder: (context, checkoutProv, snapshot) {
        _total = _priceTotal! +
            ShippingList.shippingList[checkoutProv.shippingSelected].price! -
            _discount!.toInt();

        return Scaffold(
          appBar: CustomAppBar(
            context,
            title: AppLocalizations.of(context)!.checkout,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    _BuildAddress(),
                    SizedBox(height: Const.space15),
                    _BuildProducts(checkout: checkout),
                    SizedBox(height: Const.space15),
                    _BuildPaymentMethod(),
                    SizedBox(height: Const.space15),
                    _BuildDeliveryMethod(),
                    SizedBox(height: Const.space15),
                  ],
                ),
              ),
              _FooterSection(
                  couponId: _couponId,
                  checkout: checkout,
                  discount: _discount,
                  priceTotal: _priceTotal,
                  total: _total),
            ],
          ),
        );
      },
    );
  }
}

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
        height: 218.0,
        padding: EdgeInsets.symmetric(
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
            SizedBox(height: Const.space8),
            (couponId == null)
                ? SizedBox()
                : _BuildPriceDetail(
                    isDiscount: true,
                    title: AppLocalizations.of(context)!.discount +
                        " " +
                        CouponList.couponList[checkout!.couponId!].discount
                            .toString() +
                        "%",
                    value: discount?.toInt(),
                  ),
            SizedBox(height: Const.space8),
            _BuildPriceDetail(
              title: AppLocalizations.of(context)!.price_total,
              value: priceTotal,
            ),
            SizedBox(height: Const.space8),
            Divider(color: theme.hintColor),
            SizedBox(height: Const.space8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.total,
                  style: theme.textTheme.headline4,
                ),
                AutoSizeText(
                  NumberFormat.currency(
                    symbol: '\$',
                  ).format(total ?? 0),
                  style: theme.textTheme.headline3,
                ),
              ],
            ),
            SizedBox(height: Const.space8),
            (provider.isLoading == true)
                ? CustomLoadingIndicator()
                : CustomElevatedButton(
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

                        Future.delayed(Duration(seconds: 2), () {
                          Get.toNamed(Routes.checkout_success);
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
