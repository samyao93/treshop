part of '../coupon_page.dart';

class CouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, snapshot) {
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.available_coupon,
        ),
        body: ListView.builder(
          itemCount: CouponList.couponList.length,
          padding: EdgeInsets.symmetric(horizontal: Const.margin),
          itemBuilder: (context, index) {
            var coupon = CouponList.couponList[index];

            return CouponCard(
              coupon: coupon,
              buttonLabel: (cart.selectedCoupon == index)
                  ? AppLocalizations.of(context)!.active
                  : AppLocalizations.of(context)!.use,
              buttonColor: (cart.selectedCoupon == index)
                  ? Theme.of(context).hintColor
                  : Theme.of(context).primaryColor,
              onUseTap: () {
                cart.selectedCoupon = index;
              },
            );
          },
        ),
      );
    });
  }
}

class CouponCard extends StatelessWidget {
  const CouponCard({
    Key? key,
    this.onUseTap,
    this.buttonLabel,
    this.buttonColor,
    required this.coupon,
  }) : super(key: key);

  final CouponModel coupon;
  final String? buttonLabel;
  final VoidCallback? onUseTap;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Const.radius),
      ),
      child: Container(
        width: Screens.width(context),
        height: 130.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Screens.width(context),
              height: 50.0,
              padding: EdgeInsets.symmetric(horizontal: Const.margin),
              decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Const.radius),
                    topRight: Radius.circular(Const.radius),
                  )),
              child: Row(
                children: [
                  Icon(
                    Icons.card_giftcard,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  SizedBox(width: Const.space12),
                  AutoSizeText(coupon.name!, style: theme.textTheme.headline3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Const.margin,
                vertical: Const.space8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: coupon.discount.toString() + "%",
                              style: theme.textTheme.bodyText1!
                                  .copyWith(fontSize: 25.0)),
                          TextSpan(
                              text: ' OFF', style: theme.textTheme.bodyText1),
                        ]),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: AppLocalizations.of(context)!.valid_until +
                                  " ",
                              style: theme.textTheme.subtitle2),
                          TextSpan(
                              text: DateFormat.yMMMEd().format(coupon.expired!),
                              style: theme.textTheme.subtitle2),
                        ]),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    onTap: onUseTap,
                    label: buttonLabel,
                    color: buttonColor,
                    width: 100.0,
                    height: 30.0,
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
