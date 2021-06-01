part of '../cart_page.dart';

class _FooterSection extends StatelessWidget {
  final int? total;

  const _FooterSection({Key? key, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    _couponType(int val) {
      switch (val) {
        case 0:
          break;
        default:
      }
    }

    return Consumer<CartProvider>(builder: (context, cart, snapshot) {
      return Container(
        width: Screens.width(context),
        height: 155.0,
        color: theme.cardColor,
        padding: EdgeInsets.symmetric(
          horizontal: Const.margin,
          vertical: Const.space8,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.coupon),
              borderRadius: BorderRadius.circular(Const.radius),
              child: Container(
                width: Screens.width(context),
                height: 45.0,
                decoration: BoxDecoration(
                  border: Border.all(color: theme.hintColor),
                  borderRadius: BorderRadius.circular(Const.radius),
                ),
                padding: EdgeInsets.symmetric(horizontal: Const.space15),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      CustomIcon.coupon,
                      color: theme.hintColor,
                    ),
                    SizedBox(width: Const.space12),
                    AutoSizeText(
                      (cart.selectedCoupon != null)
                          ? CouponList.couponList[cart.selectedCoupon!].name! + " "+
                              CouponList
                                  .couponList[cart.selectedCoupon!].discount
                                  .toString() +
                              "% OFF"
                          : AppLocalizations.of(context)!.enter_your_promo_code,
                      style: theme.textTheme.subtitle2,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: theme.hintColor,
                      size: 12.0,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: Const.space12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  AppLocalizations.of(context)!.total,
                  style: theme.textTheme.bodyText1,
                ),
                AutoSizeText(
                  NumberFormat.currency(
                    symbol: '\$',
                  ).format(total),
                  style: theme.textTheme.headline3,
                ),
              ],
            ),
            SizedBox(height: Const.space12),
            CustomElevatedButton(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FeatherIcons.shoppingBag,
                    color: Colors.white,
                    size: 16.0,
                  ),
                  SizedBox(width: Const.space12),
                  AutoSizeText(
                    AppLocalizations.of(context)!.checkout,
                    style: theme.textTheme.button,
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
