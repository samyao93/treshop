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

    _paymentIconSelected(int? val) {
      switch (val) {
        case 0:
          return PaymentList.paymentList[0].icon;
        case 1:
          return PaymentList.paymentList[1].icon;
        case 2:
          return PaymentList.paymentList[2].icon;
        case 3:
          return PaymentList.paymentList[3].icon;

        default:
          return PaymentList.paymentList[0].icon;
      }
    }

    _paymentNameSelected(int? val) {
      switch (val) {
        case 0:
          return PaymentList.paymentList[0].name;
        case 1:
          return PaymentList.paymentList[1].name;
        case 2:
          return PaymentList.paymentList[2].name;
        case 3:
          return PaymentList.paymentList[3].name;

        default:
          return PaymentList.paymentList[0].name;
      }
    }

    return Consumer<CheckoutProvider>(
      builder: (context, checkoutProv, snapshot) {
        _total = _priceTotal! +
            ShippingList
                .shippingList[checkoutProv.shippingSelected ?? 0].price! -
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
                    _BuildLabelSection(
                      label: AppLocalizations.of(context)!.address,
                      trailing: AppLocalizations.of(context)!.add_address,
                      onViewAllTap: () {},
                    ),
                    SizedBox(height: Const.space8),
                    Container(
                      width: Screens.width(context),
                      height: 120.0,
                      child: ListView.builder(
                        itemCount: AddressList.addressList.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: Const.margin),
                        itemBuilder: (context, index) {
                          var address = AddressList.addressList[index];

                          return AddressCard(
                            address: address,
                            index: index,
                            onAddressTap: () {
                              context.read<CheckoutProvider>().addressSelected =
                                  index;
                            },
                          );
                        },
                      ),
                    ),
                    SizedBox(height: Const.space15),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Const.margin),
                      child: AutoSizeText(
                          checkout!.products!.length.toString() +
                              " " +
                              AppLocalizations.of(context)!.items,
                          style: theme.textTheme.headline3),
                    ),
                    SizedBox(height: Const.space8),
                    Container(
                      width: Screens.width(context),
                      height: 128.0,
                      child: ListView.builder(
                        itemCount: checkout!.products!.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: Const.margin),
                        itemBuilder: (context, index) {
                          var product = checkout!.products![index];

                          return ProductCheckoutCard(product: product);
                        },
                      ),
                    ),
                    SizedBox(height: Const.space15),
                    _BuildLabelSection(
                      label: AppLocalizations.of(context)!.payment_method,
                      trailing: AppLocalizations.of(context)!.change,
                      onViewAllTap: () => Get.toNamed(Routes.payment),
                    ),
                    SizedBox(height: Const.space8),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Const.margin),
                      child: (checkoutProv.paymentSelected == null)
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: Const.space12),
                              child: Center(
                                child: AutoSizeText(
                                  AppLocalizations.of(context)!
                                      .payment_method_not_selected,
                                  style: theme.textTheme.subtitle1,
                                ),
                              ),
                            )
                          : Row(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(Const.radius),
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.all(Const.space8),
                                  child: SvgPicture.asset(
                                    _paymentIconSelected(
                                        checkoutProv.paymentSelected)!,
                                  ),
                                ),
                                SizedBox(width: Const.space12),
                                AutoSizeText(
                                    _paymentNameSelected(
                                        checkoutProv.paymentSelected)!,
                                    style: theme.textTheme.bodyText1)
                              ],
                            ),
                    ),
                    SizedBox(height: Const.space15),
                    _BuildLabelSection(
                      label: AppLocalizations.of(context)!.delivery_method,
                      trailing: AppLocalizations.of(context)!.change,
                      onViewAllTap: () => Get.toNamed(Routes.shipping),
                    ),
                    SizedBox(height: Const.space8),
                    (checkoutProv.shippingSelected == null)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Const.space12),
                            child: Center(
                              child: AutoSizeText(
                                AppLocalizations.of(context)!
                                    .payment_method_not_selected,
                                style: theme.textTheme.subtitle1,
                              ),
                            ),
                          )
                        : Container(
                            width: Screens.width(context),
                            height: 60.0,
                            margin:
                                EdgeInsets.symmetric(horizontal: Const.margin),
                            padding:
                                EdgeInsets.symmetric(horizontal: Const.margin),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Const.radius),
                              color: Color(0xFFE3F1F2),
                            ),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AutoSizeText(
                                        ShippingList
                                            .shippingList[
                                                checkoutProv.shippingSelected ??
                                                    0]
                                            .name!,
                                        style:
                                            theme.textTheme.bodyText2!.copyWith(
                                          color: ColorLight.fontTitle,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      AutoSizeText(
                                        AppLocalizations.of(context)!
                                                .estimated +
                                            " " +
                                            ShippingList
                                                .shippingList[checkoutProv
                                                        .shippingSelected ??
                                                    0]
                                                .estimate! +
                                            " " +
                                            AppLocalizations.of(context)!.days,
                                        style:
                                            theme.textTheme.subtitle2!.copyWith(
                                          color: ColorLight.fontSubtitle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AutoSizeText(
                                  NumberFormat.currency(symbol: '\$').format(
                                      ShippingList
                                          .shippingList[
                                              checkoutProv.shippingSelected ??
                                                  0]
                                          .price),
                                  style: theme.textTheme.headline3!.copyWith(
                                    color: ColorLight.fontTitle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    SizedBox(height: Const.space15),
                  ],
                ),
              ),
              Container(
                width: Screens.width(context),
                height: 212.0,
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
                      value: (checkoutProv.paymentSelected == null)
                          ? 0
                          : ShippingList
                              .shippingList[checkoutProv.shippingSelected ?? 0]
                              .price,
                    ),
                    SizedBox(height: Const.space8),
                    (_couponId == null)
                        ? SizedBox()
                        : _BuildPriceDetail(
                            isDiscount: true,
                            title: AppLocalizations.of(context)!.discount +
                                " " +
                                CouponList
                                    .couponList[checkout!.couponId!].discount
                                    .toString() +
                                "%",
                            value: _discount?.toInt(),
                          ),
                    SizedBox(height: Const.space8),
                    _BuildPriceDetail(
                      title: AppLocalizations.of(context)!.price_total,
                      value: _priceTotal,
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
                          ).format(_total ?? 0),
                          style: theme.textTheme.headline3,
                        ),
                      ],
                    ),
                    SizedBox(height: Const.space8),
                    CustomElevatedButton(
                      onTap: () {},
                      label: AppLocalizations.of(context)!.buy_now,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BuildPriceDetail extends StatelessWidget {
  final String title;
  final int? value;
  final bool isDiscount;

  const _BuildPriceDetail(
      {Key? key, required this.title, this.value, this.isDiscount = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(title, style: theme.textTheme.subtitle1),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isDiscount ? '- ' : '',
                style: theme.textTheme.headline4,
              ),
              TextSpan(
                text: NumberFormat.currency(symbol: '\$').format(value),
                style: theme.textTheme.headline4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
