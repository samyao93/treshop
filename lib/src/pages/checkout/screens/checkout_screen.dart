part of '../checkout_page.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  padding: const EdgeInsets.symmetric(horizontal: Const.margin),
                  child:
                      AutoSizeText('1 Items', style: theme.textTheme.headline3),
                ),
                SizedBox(height: Const.space8),
                Container(
                  width: Screens.width(context),
                  height: 128.0,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: Const.margin),
                    itemBuilder: (context, index) {
                      var product = ProductList.allProduct[index];

                      return ProductCheckoutCard(product: product);
                    },
                  ),
                ),
                SizedBox(height: Const.space15),
                _BuildLabelSection(
                  label: AppLocalizations.of(context)!.payment_method,
                  trailing: AppLocalizations.of(context)!.change,
                  onViewAllTap: () {},
                ),
                SizedBox(height: Const.space8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Const.margin),
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Const.radius),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(Const.space8),
                        child: SvgPicture.asset(
                          CustomIcon.mastercard,
                        ),
                      ),
                      SizedBox(width: Const.space12),
                      AutoSizeText('Master Card',
                          style: theme.textTheme.bodyText1)
                    ],
                  ),
                ),
                SizedBox(height: Const.space15),
                _BuildLabelSection(
                  label: AppLocalizations.of(context)!.delivery_method,
                  trailing: AppLocalizations.of(context)!.change,
                  onViewAllTap: () {},
                ),
                SizedBox(height: Const.space8),
                Container(
                  width: Screens.width(context),
                  height: 60.0,
                  margin: EdgeInsets.symmetric(horizontal: Const.margin),
                  padding: EdgeInsets.symmetric(horizontal: Const.margin),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Const.radius),
                    color: Color(0xFFE3F1F2),
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
                              'Express Shipping',
                              style: theme.textTheme.bodyText2!.copyWith(
                                color: ColorLight.fontTitle,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            AutoSizeText(
                              'Estimated 2-3 Days',
                              style: theme.textTheme.subtitle2!.copyWith(
                                color: ColorLight.fontSubtitle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AutoSizeText(
                        NumberFormat.currency(symbol: '\$').format(120),
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
                  value: 500,
                ),
                SizedBox(height: Const.space8),
                _BuildPriceDetail(
                  title: AppLocalizations.of(context)!.discount + " " + "10%",
                  value: 500,
                ),
                SizedBox(height: Const.space8),
                _BuildPriceDetail(
                  title: AppLocalizations.of(context)!.price_total,
                  value: 500,
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
                      ).format(1200),
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
  }
}

class _BuildPriceDetail extends StatelessWidget {
  final String title;
  final int? value;

  const _BuildPriceDetail({Key? key, required this.title, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(title, style: theme.textTheme.subtitle1),
        AutoSizeText(
          NumberFormat.currency(symbol: '\$').format(value),
          style: theme.textTheme.headline4,
        ),
      ],
    );
  }
}
